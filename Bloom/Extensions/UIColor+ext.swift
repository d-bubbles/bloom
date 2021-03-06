//
//  UIColor+ext.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/10/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIColor {
  
   /**
   Creates an UIColor from HEX String in "#363636" format
  
   - parameter hexString: HEX String in "#363636" format
   - returns: UIColor from HexString
   */
    convenience init(hexString: String) {
            
      let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
      let scanner          = Scanner(string: hexString as String)
            
      if hexString.hasPrefix("#") {
        scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
      }
      var color: UInt64 = 0
      scanner.scanHexInt64(&color)
            
      let mask = 0x000000FF
      let r = Int(color >> 16) & mask
      let g = Int(color >> 8) & mask
      let b = Int(color) & mask
      
      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0
      self.init(red:red, green:green, blue:blue, alpha:1)
    }
  
//  /**
//   Creates an UIColor Object based on provided RGB value in integer
//   - parameter red:   Red Value in integer (0-255)
//   - parameter green: Green Value in integer (0-255)
//   - parameter blue:  Blue Value in integer (0-255)
//   - returns: UIColor with specified RGB values
//   */
//    convenience init(red: Int, green: Int, blue: Int) {
//      assert(red >= 0 && red <= 255, "Invalid red component")
//      assert(green >= 0 && green <= 255, "Invalid green component")
//      assert(blue >= 0 && blue <= 255, "Invalid blue component")
//      self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
}
