//
//  NoteViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 9.12.2022.
//

import Foundation
import Alamofire
import KeychainSwift

class NoteListViewModel: BaseViewModel {
    
    var reloadData: VoidClosure?
    var notes = [NoteModel]()
    var keyChainSwift = KeychainSwift()
    var numberOfItems: Int {
        return notes.count
    }
    
    func cellItemForAt(indexPath: IndexPath) -> NoteModel {
        return notes[indexPath.row]
    }
    
    func getMyNotes() {
        let url = baseUrl + "users/me/notes?page=1"
        guard let accessToken = keyChainSwift.get("accessToken") else { return }
        let headers : HTTPHeaders = ["Authorization": "Bearer "+accessToken]
        showActivityIndicatorView?()
        
        AF.request(url, method: .get, parameters: nil, headers: headers).response { [weak self] response in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(NoteListResponse.self, from: data)
                
                if let datas = decodedData.data?.data {
                    self.notes = datas.map( {NoteModel(note: $0)} )
                    self.reloadData?()
                }
            } catch {
                self.showWarningToast?(response.error?.localizedDescription ?? "Not Listelemede Bir Hata Oluştu.")
            }
        }
    }
    
    func addNotesRequest(title: String, note: String) {
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
