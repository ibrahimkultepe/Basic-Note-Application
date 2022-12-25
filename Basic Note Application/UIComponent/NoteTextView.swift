//
//  NoteTextView.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 23.12.2022.
//

import Foundation
import UIKit

class NoteTextView: UITextView, UITextViewDelegate {
    
    func configureContents() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.appLightGray.cgColor
        backgroundColor = .white
        autocorrectionType = .no
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        layer.borderColor = UIColor.appLightBlue.cgColor
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        layer.borderColor = UIColor.appLightGray.cgColor
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.delegate = self
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
}
