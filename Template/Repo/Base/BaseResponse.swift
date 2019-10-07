//
//  BaseResponse.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 02/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit

struct baseResponse<T: Codable>: Codable {
    
    let status  : String
    let data    : T
    
}
