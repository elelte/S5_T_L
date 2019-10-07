//
//  GConstURL.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 02/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

struct BaseURL {
    
    static private let method   = "https://"
    static private let base_url = "api.izistay.com"
    
    enum api_url : String {
        
        case defaults    = ""
        case cities      = "cities"
        case testimony   = "testimony"
        case recommended = "recommended"
        case detail      = "accomodation"
        case search      = "search"
        case feeds       = "feeds"
        case contact     = "contact"
        case contact_us  = "contact_us"
        
        case fac_room    = "facilities_room"
        case fac_acco    = "facilities_accomodation"
        case genders     = "list_genders"
        case jobs        = "list_by_jobs"
        case acco_type   = "type_accomodation"
        case suggest     = "suggest"
        
        func get_url() -> String{
            
            /*  sample :
             
             http://api.com/home/
             
             */
            
            return method + base_url + "/" + self.rawValue + "/"
            
        }
        
    }
}
