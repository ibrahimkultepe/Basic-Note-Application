//
//  Validation.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 21.11.2022.
//

import Foundation

class Validation {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            ToastPresenter.showWarningToast(text: "Lütfen geçerli bir email adresi giriniz.")
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: "Şifreniz en az 6 karaterden oluşmalıdır.")
            return false
        }
        return true
    }
    
    func isValidName(_ name: String) -> Bool {
        guard name.count > 1 else {
            ToastPresenter.showWarningToast(text: "Lütfen İsminizi Giriniz")
            return false
        }
        return true
    }
    
    func isValidTitle(_ title: String) -> Bool {
        guard title.count > 1 else {
            ToastPresenter.showWarningToast(text: "Lütfen bir başlık giriniz")
            return false
        }
        return true
    }
    
    func isValidSubtitle(_ subtitle: String) -> Bool {
        guard subtitle.count > 1 else {
            ToastPresenter.showWarningToast(text: "Lütfen not ekleyiniz")
            return false
        }
        return true
    }
}
