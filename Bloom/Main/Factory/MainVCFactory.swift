//
//  MainVCFactory.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/9/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

class MainVCFactory {
    
    static func create() -> UIViewController {
        
        let vc = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(identifier: "main") as! MainViewController
        vc.presenter = MainViewPresenter(view: vc)
        return vc
    }
}
