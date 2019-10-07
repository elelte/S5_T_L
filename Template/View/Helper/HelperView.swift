
//
//  sa.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 02/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit
import KYDrawerController

struct GBASE_LANDING_INFO {
    
    private static let base = "https://www.izistay.com/"
    
    static let kontak             = base + "kontak"
    static let tentang_kami       = base + "landing/tentang_izistay"
    static let privacy_policy     = base + "landing/privacypolicy"
    static let syarat_n_ketentuan = base + "landing/syaratketentuan"
    
}

/// Use to get Default Color

struct GBASE_COLOR {
    
    static let blue      = GColor.UIColorFromRGBS(rgbValue: 0x004998)
    static let green_old = GColor.UIColorFromRGBS(rgbValue: 0x385667)
    static let green     = GColor.UIColorFromRGBS(rgbValue: 0x00A86B)
    static let favorit   = GColor.UIColorFromRGBS(rgbValue: 0xFF3232)
    
}

struct GBASE_STORYBOARD {
    
    enum nib: String {
        
        case Navigation,
             Dashboard,
             Login
        
        func GetStoryboard() -> UIStoryboard{
            
            return UIStoryboard(name: self.rawValue, bundle: nil)
            
        }
    }
    
    
}

struct GBASE_VIEWCONTROLLER {
    
//    static func getRootController() -> UIViewController{
//
//        let vc  = GBASE_STORYBOARD
//                    .nib
//                    .Dashboard
//                    .GetStoryboard()
//                    .instantiateViewController(withIdentifier: "VCTabbarController") as! VCTabbarController
//
//        let nav = GBASE_STORYBOARD
//                    .nib
//                    .Navigation
//                    .GetStoryboard()
//                    .instantiateViewController(withIdentifier: "NavRoot") as! NavRoot
//
//        nav.viewControllers = [vc]
//
//        let sideMenu = GBASE_STORYBOARD
//                        .nib
//                        .Navigation
//                        .GetStoryboard()
//                        .instantiateViewController(withIdentifier: "Sidemenu") as! UITableViewController
//
//        let root_drawer = KYDrawerController(
//            drawerDirection : .left,
//            drawerWidth     : GScreen.width - 48
//        )
//
//        root_drawer.mainViewController   = nav
//        root_drawer.drawerViewController = sideMenu
//
//        return root_drawer
//
//    }
//
//    static func openSidemenu(){
//        let sidemenu = getSideMenu() as! KYDrawerController
//        sidemenu.setDrawerState(.opened, animated: true)
//    }
//
//    static private func getAppdelegate() -> AppDelegate{
//        return UIApplication.shared.delegate as! AppDelegate
//    }
//
//    static private func getSideMenu() -> UIViewController?{
//        let apps = getAppdelegate()
//        return apps.window?.rootViewController
//    }
    
}
