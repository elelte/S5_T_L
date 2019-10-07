//
//  NavRoot.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 02/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

class NavRoot: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.isTranslucent  = false
        self.navigationBar.barTintColor   = GBASE_COLOR.blue
        self.navigationBar.tintColor      = .white
        
        self.navigationBar.titleTextAttributes = [
            
//            NSAttributedString.Key.font: font_regular,
            NSAttributedString.Key.foregroundColor: UIColor.white
            
        ]
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

}
