//
//  CustomTextField.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 20.10.2022.
//

import Foundation
import UIKit

class AuthTextField : UITextField {
    
    func configureContents() {
        backgroundColor = .white
        height(45)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
}
