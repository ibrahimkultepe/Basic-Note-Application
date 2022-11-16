//
//  Protocol.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.11.2022.
//

import UIKit

protocol LoadingProtocol {
    func presentLoading()
    func dismissLoading()
}

 extension LoadingProtocol where Self: UIViewController {
    
    func presentLoading() {
        let window = UIApplication.shared.windows.first
        window?.startBlockingActivityIndicator()
    }
    
    func dismissLoading() {
        let window = UIApplication.shared.windows.first
        window?.stopBlockingActivityIndicator()
    }
    
}
