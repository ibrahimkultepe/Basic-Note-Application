//
//  BaseViewModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.11.2022.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showWarningToast: StringClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel: BaseViewModelProtocol {
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    var showWarningToast: StringClosure?
}
