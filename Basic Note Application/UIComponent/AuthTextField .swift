//
//  CustomTextField.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 20.10.2022.
//

import Foundation
import UIKit

class AuthTextField : UITextField, UITextFieldDelegate {
    
    func configureContents() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.appLightGray.cgColor
        backgroundColor = .white
        height(50)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderColor = UIColor.appLightBlue.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        layer.borderColor = UIColor.appLightGray.cgColor
    }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        self.delegate = self
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
}
