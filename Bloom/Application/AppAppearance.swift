//
//  AppAppearance.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/9/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

final class AppAppearance {
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension UINavigationController {
    @objc override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
