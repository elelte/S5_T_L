//
//  VMSidemenu.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 04/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

class VMSidemenu: NSObject {

    
    var arr_cell = [model_sidemenu_cell]()
    
    func setup(){
        
        arr_cell = [
            model_sidemenu_cell(title: "", image: "", cell: .header),
            
            model_sidemenu_cell(title: "History Pemesanan", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "Daftar Pemesanan", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "", image: "", cell: .separator),
            
            model_sidemenu_cell(title: "History Layanan", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "Daftar Layanan", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "", image: "", cell: .separator),
            
            model_sidemenu_cell(title: "Hubungi Kami", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "Bantuan", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "Tentang Aplikasi", image: "icon_menu_history", cell: .title),
            model_sidemenu_cell(title: "", image: "", cell: .separator),
        ]
        
    }
    
}

struct model_sidemenu_cell {
    
    enum cell {
        case header,
             title,
             separator
    }
    
    let title : String?
    let image : String
    let cell  : cell
    
}
