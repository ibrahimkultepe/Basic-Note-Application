//
//  LoginViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 1.12.2022.
//

import Foundation
import Alamofire

class LoginViewModel: BaseViewModel {
        
    func loginRequest(email: String, password: String) {
        let parameters: [String: String] = ["email": email, "password": password]
        let url = baseUrl + "auth/login"
        
        showActivityIndicatorView?()
        AF.request(url, method: .post, parameters: parameters).response { [weak self] response in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(AuthResponse.self, from: data)
            } catch {
                self.showWarningToast?(response.error?.localizedDescription ?? "Bir Hata oluştu.")
            }
        }
    }
}
