//
//  FontExtension.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 6.10.2022.
//

import Foundation
import UIKit

extension UIFont {
    
    static func ItalicVariableFont(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Italic-VariableFont_wght", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Italic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Italic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Thin(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Thin.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Bold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Bold", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Light(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Light", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func LightItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-LightItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func MediumItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-MediumItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func SemiBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-SemiBold", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Regular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Regular", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func ExtraLightItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ExtraLightItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func Medium(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Medium", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func BoldItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-BoldItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func ThinItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ThinItalic.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func ExtraLight(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-ExtraLight", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func SemiBoldItalic(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-SemiBoldItalic", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
    
    static func VariableFontWght(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "JosefinSans-VariableFont_wght.", size: size) else {
            fatalError("Unable to initialize font")
        }
        return font
    }
}
