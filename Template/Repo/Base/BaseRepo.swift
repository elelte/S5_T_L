//
//  BaseRepo.swift
//  Airlog
//
//  Created by Icon+ Gaenael on 02/10/19.
//  Copyright © 2019 Icon+ Mampang. All rights reserved.
//

import UIKit
import Alamofire

class BaseRepo {
    
    typealias successHandler<T: Codable> = (baseResponse<T>) -> ()
    typealias failedHandler  = (errorHandler) -> ()
    
    internal var url      = BaseURL.api_url.defaults
    internal var param    = [String:String]()
    internal var headers  : HTTPHeaders = [:]
    internal var method   : HTTPMethod = .get
    
    internal func request<T: Codable>(success: @escaping successHandler<T>,fail: @escaping failedHandler){
        
        Alamofire.request(url.get_url(), method: method, parameters: param, headers: headers).validate().responseJSON { response in
            
            switch response.result {
                
                case .success(let data):
                    do {
                        
                        print("\(self.url.get_url())") //Print >>>>>>>>>>>
                        print("\(self.param)") //Print >>>>>>>>>>>
                        print("\(data)") //Print >>>>>>>>>>>
                        
                        let datas = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        
                        let decoder   = JSONDecoder()
                        
                        let dt = try decoder.decode(baseResponse<T>.self, from:datas)
                        
                        success(dt)
                        
                        
                    }
                    catch {
                        let err_obj = errorHandler(error: error)
                        fail(err_obj)
                    }
                
                case .failure(let error):
                    let err_obj = errorHandler(error: error)
                    fail(err_obj)
            }
            
        }
        
    }
    
}
