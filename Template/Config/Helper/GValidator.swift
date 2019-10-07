//
//  GValidator.swift
//  Template_Swift_5_Storyboard
//
//  Created by Gan on 10/7/19.
//  Copyright © 2019 Gan. All rights reserved.
//

import UIKit

class GLengthValidator: NSObject {
    
    enum typeValidator {
        case maxLength,
             minLength,
             length,
             empty
    }
    
    private var maxLength = -1
    
    private var minLength = -1
    
    private var length = -1
    
    private var tempText = ""
    
    private var failedHandler : (typeValidator) -> () = { message in }
    
    func setup(
        max: Int = -1,
        min: Int = -1,
        length: Int = -1,
        failedHandler: @escaping (typeValidator) -> ()) {
            self.length = length
            self.maxLength = max
            self.minLength = min
            self.failedHandler = failedHandler
    }
    
    func validation(text: String) -> Bool{
        
        tempText = text
        
        return checkMax() && checkMin() && checkLength()
        
    }
    
    // Check Max Length
    private func checkMax() -> Bool{
        
        if maxLength != -1{
        
            let status = tempText.count < maxLength
            
            if !status{
                
                failedHandler(.maxLength)
                
            }
            
            return status
            
        }
        
        return true
        
    }
    
    // Check Min Length
    private func checkMin() -> Bool{
        
        if minLength != -1{
            
            if tempText.count == 0{
                
                failedHandler(.empty)
                
                return false
                
            }
            else{
                
                let status = tempText.count >= minLength
                
                if !status{
                    
                    failedHandler(.minLength)
                    
                }
                
                return status
            }
            
        }
        
        return true
        
    }
    
    // Check Min Length
    private func checkLength() -> Bool{
        
        if length != -1{
            
            let status = tempText.count == length
            
            if !status{
                
                failedHandler(.length)
                
            }
            
            return status
            
        }
        
        return true
        
    }
    
}

class GFormatValidator: NSObject {
    
    enum typeValidator {
        case validEmail,
             validPhoneNumber
    }
    
    private var isValidEmail = false
    private var isValidPhoneNumber = false
    
    private var tempText = ""
    
    private var failedHandler : (typeValidator) -> () = { message in }
    
    func setup(
        email: Bool = false,
        phoneNumber: Bool = false,
        failedHandler: @escaping (typeValidator) -> ()) {
        
        self.isValidEmail       = email
        self.isValidPhoneNumber = phoneNumber
        self.failedHandler      = failedHandler
    }
    
    func validation(text: String) -> Bool{
        tempText = text
        
        return checkEmail() &&
               checkPhoneNumber()
        
    }
    
    // Check Min Length
    private func checkEmail() -> Bool{
        
        if isValidEmail{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            let status = emailPred.evaluate(with: tempText)
            
            if !status{
                
                failedHandler(.validEmail)
                
            }
            
            return status
        }
        
        return true
        
    }
    
    // Check Min Length
    private func checkPhoneNumber() -> Bool{
        
        if isValidPhoneNumber{
            
            let status = tempText[0]       == "0" ||
                         tempText[0 ..< 2] == "62" ||
                         tempText[0 ..< 3] == "+62"
            
            if !status{
                
                failedHandler(.validPhoneNumber)
                
            }
            
            return status
        }
        
        return true
        
    }
    
}

extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}
