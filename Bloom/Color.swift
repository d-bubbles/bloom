//
//  Color.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/12/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

enum Color {
    
    case darkText
    case lightText
    case intermidiateText
    case disabledButton
    
    case custom(hexString: String, alpha: Double)
    
    case lightBlue
    case lightGreen
    case darkGreen
    case coral
    // 2
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .darkText:
            instanceColor = UIColor(hexString: "#004D40")
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#717175")
        case .lightText:
            instanceColor = UIColor(hexString: "#9B9B9B")
        case .disabledButton:
            instanceColor = UIColor(hexString: "#D8D8D8")
        case .lightBlue:
            instanceColor = UIColor(hexString: "#76C7D2")
        case .darkGreen:
            instanceColor = UIColor(hexString: "#004D40")
        case .lightGreen:
            instanceColor = UIColor(hexString: "#07BB9C")
        case .coral:
            instanceColor = UIColor(hexString: "#F97171")
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}
