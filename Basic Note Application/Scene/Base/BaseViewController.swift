//
//  BaseViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.11.2022.
//

import Foundation
import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
    }
}

extension BaseViewController {
    
    func subscribeViewModel() {
        viewModel.showWarningToast = { message in
            ToastPresenter.showWarningToast(text: message)
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
    }
}
