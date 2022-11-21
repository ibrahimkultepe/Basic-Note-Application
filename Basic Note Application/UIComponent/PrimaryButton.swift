//
//  CustomButton.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 19.10.2022.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    
    func configureContents() {
        setTitle("Sign Up", for: .normal)
        titleLabel?.font = .bold(size: 20)
        setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        backgroundColor = UIColor(red: 0.863, green: 0.863, blue: 1, alpha: 1)
        height(60)
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
