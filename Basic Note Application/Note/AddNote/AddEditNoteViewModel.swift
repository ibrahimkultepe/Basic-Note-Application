//
//  AddNoteViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 22.12.2022.
//

import Foundation
import KeychainSwift
import UIKit
import Alamofire

class AddEditNoteViewModel: BaseViewModel {
    
    var title: String?
    var subtitle: String?
    var noteId  = 0
    var isEditing = false
    var pushToNoteListVC: VoidClosure?
    private let keyChainSwift = KeychainSwift()
    
    func addNoteRequest(title: String, note: String) {
        let url = baseUrl + "notes"
        let parameters: [String: String] = ["title": title, "note": note]
        guard let accessToken = keyChainSwift.get("accessToken") else { return }
        let headers : HTTPHeaders = ["Authorization": "Bearer "+accessToken]
        showActivityIndicatorView?()
        
        AF.request(url, method: .post, parameters: parameters, headers: headers).response { [weak self] response in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            
            switch response.result {
            case .success:
                self.pushToNoteListVC?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func updateNoteRequest(title: String, note: String) {
        let url = baseUrl + "notes/\(noteId)"
        guard let accessToken = keyChainSwift.get("accessToken") else { return }
        let parameters: [String: String] = ["title": title, "note": note]
        let headers : HTTPHeaders = ["Authorization": "Bearer "+accessToken]
        showActivityIndicatorView?()
        
        AF.request(url, method: .put, parameters: parameters, headers: headers).response { [weak self] response in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()

            switch response.result {
            case .success:
                self.pushToNoteListVC?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
