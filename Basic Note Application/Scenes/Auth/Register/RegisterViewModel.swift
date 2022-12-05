//
//  ViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.09.2022.
//

import Foundation
import Alamofire

class RegisterViewModel: BaseViewModel {
    
    var pushToLoginVC: VoidClosure?
        
    func registerRequest(fullName: String, email: String, password: String) {
        let parameters: [String: String] = ["full_name": fullName, "email": email, "password": password]
        let url = baseUrl + "auth/register"
        
        showActivityIndicatorView?()
        AF.request(url, method: .post, parameters: parameters).response { [weak self] response in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(RegisterResponse.self, from: data)
                self.pushToLoginVC?()
            } catch {
                print(error)
                self.showWarningToast?(response.error?.localizedDescription ?? "Bir hata oluştu.")
            }
        }
    }
}
