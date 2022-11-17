//
//  ToastPresenter.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.11.2022.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .red, dark: .red))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let customView = TostWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
