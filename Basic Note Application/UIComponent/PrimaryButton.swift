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
        titleLabel?.text = "sdasdada"
        backgroundColor = .white
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
