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

class AddNoteViewModel: BaseViewModel {
    
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
            guard let data = response.data else { return }

            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(AuthResponse.self, from: data)
            } catch {
                self.showWarningToast?(response.error?.localizedDescription ?? "Not Eklenirken Bir Hata Oluştu.")
            }
        }
    }
}
