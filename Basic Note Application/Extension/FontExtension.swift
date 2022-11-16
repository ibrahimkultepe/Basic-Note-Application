//
//  FontExtension.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 6.10.2022.
//

import Foundation
import UIKit

extension UIFont {

    static func italicVariableFont(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Italic-VariableFont_wght", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func italic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Italic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func thin(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Thin.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func bold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Bold", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func light(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Light", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func lightItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-LightItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func mediumItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-MediumItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-SemiBold", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func regular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Regular", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func extraLightItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ExtraLightItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func medium(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Medium", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func boldItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-BoldItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func thinItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ThinItalic.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func extraLight(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ExtraLight", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func semiBoldItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-SemiBoldItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func variableFontWght(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-VariableFont_wght.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
}
