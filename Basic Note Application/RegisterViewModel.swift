//
//  ViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.09.2022.
//

import Foundation

class RegisterViewModel: BaseViewModel {
    
    func loading() {
        showActivityIndicatorView?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hideLoading?()
            self.showWarningToast?("warning")
        }
    }
}
