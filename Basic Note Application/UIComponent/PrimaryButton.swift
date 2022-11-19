//
//  CustomButton.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 19.10.2022.
//

import Foundation
import UIKit
import Kingfisher

class PrimaryButton: UIButton {
    
    func configureContents() {
        setTitle("Sign Up", for: .normal)
        titleLabel?.font = .bold(size: 20)
        setTitleColor(UIColor.blue, for: .normal)
        backgroundColor = .cyan
        height(55)
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
