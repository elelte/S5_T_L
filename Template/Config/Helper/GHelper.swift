//
//  GHelper.swift
//  Template_Swift_5_Storyboard
//
//  Created by Gan on 10/7/19.
//  Copyright © 2019 Gan. All rights reserved.
//

import UIKit
import JGProgressHUD
import MessageUI
import SafariServices

struct GScreen {
    static let bounds = UIScreen.main.bounds
    static let width  = bounds.size.width
    static let height = bounds.size.height
    
    static func getTopInset() -> CGFloat{
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            
            if let top = window?.safeAreaInsets.top{
                if top > 20{
                    return top
                }
            }
        }
        return 20
    }
}

struct GColor {
    static func UIColorFromRGBS(rgbValue: UInt)->UIColor{
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

struct GImageExt {
    static func renderedImageColor(img:String)->UIImage{
        let image = UIImage(named: img)?.withRenderingMode(.alwaysTemplate)
        return image!
    }
}

struct GAssets {
    static let ic_back   = "button_icon_back_grey"
    static let ic_search = "ic_search"
    static let ic_check  =  "checkbox_button_aktif"
    static let ic_trash  =  "icon_delete"
}

struct GFont {
    enum size: CGFloat {
        case little = 14,
             medium = 16,
             big    = 18
    }
    enum typeHelvetica: String {
        case light    = "Helvetica-Light",
             regular  = "Helvetica",
             medium   = "HelveticaNeue-Medium",
             bold     = "Helvetica-Bold"
    }
}

struct GViewExtension {
    static func radius(vw: UIView, rad: CGFloat){
        vw.layer.masksToBounds = true
        vw.layer.cornerRadius  = rad
    }
    static func border(vw: UIView, width: CGFloat, color: UIColor){
        vw.layer.borderWidth  = width
        vw.layer.borderColor  = color.cgColor
    }
    static func shadow(vw: UIView){
        vw.layer.shadowColor   = UIColor.lightGray.cgColor
        vw.layer.shadowOffset  = CGSize(width: 0, height: 0)
        vw.layer.shadowRadius  = 2.0
        vw.layer.shadowOpacity = 0.6
        vw.layer.masksToBounds = false
    }
}

struct GTableViewExtension {
    
    static func registerNib(tableView: UITableView, nib: String){
        let nibBreaking = UINib(nibName: nib, bundle:nil)
        tableView.register(nibBreaking, forCellReuseIdentifier: nib)
    }
    
    static func separatorCell() -> UITableViewCell{
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "separator")
        cell.backgroundColor = .groupTableViewBackground
        cell.selectionStyle = .none
        return cell
    }
    static func separatorCellHeight() -> CGFloat{
        return 16
    }
    
}

struct GCollectionViewExtension {
    static func registerNib(collectionView: UICollectionView, nib: String){
        let nibBreaking = UINib(nibName: nib, bundle:nil)
        collectionView.register(nibBreaking, forCellWithReuseIdentifier: nib)
    }
}

struct GAlert{
    static func set(title:String, msg:String, style:UIAlertController.Style)->UIAlertController{
        let alert = UIAlertController(title: title, message: msg, preferredStyle: style)
        return alert
    }
    
    static func addAction(title:String, style:UIAlertAction.Style, completion: ((UIAlertAction) -> Void)!, alert:UIAlertController){
        let action = UIAlertAction(title: title, style: style, handler: completion)
        alert.addAction(action)
    }
}

struct GViewController{
    static func stylePopTranparant(vc: UIViewController){
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle   = .crossDissolve
        vc.view.backgroundColor   = .clear
    }
}

struct GAnimation {
    static func show(view: UIView){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            view.alpha = 1
            view.isUserInteractionEnabled = true
        }, completion: nil)
    }
    
    static func close(view: UIView){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            view.alpha = 0
        }, completion: nil)
    }
    
    static func custom(anim: @escaping() -> Void, com: @escaping() -> Void){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            anim()
        }) { (_) in
            com()
        }
    }
}

struct GHUD {
    
    static func progress(view: UIView, completionHandler: @escaping () -> Void){
        
        let hud = JGProgressHUD(style: .dark)
        hud.vibrancyEnabled = true
        
        if arc4random_uniform(2) == 0 {
            
            hud.indicatorView = JGProgressHUDPieIndicatorView()
            
        }
        else {
            
            hud.indicatorView = JGProgressHUDRingIndicatorView()
            
        }
        
        hud.detailTextLabel.text = "0% Progress"
        hud.textLabel.text = "Setup Language"
        hud.show(in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
            
            self.incrementHUD(hud, progress: 0, completionHandler: completionHandler)
            
        }
        
    }
    
    private static func incrementHUD(_ hud: JGProgressHUD, progress previousProgress: Int, completionHandler: @escaping () -> Void) {
        
        let progress = previousProgress + 1
        hud.progress = Float(progress)/100.0
        hud.detailTextLabel.text = "\(progress)% Process"
        
        if Float(progress)/100.0 == 1{
            
            hud.detailTextLabel.text = "\(progress)% Completed"
            
        }
        
        if progress == 100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                
                UIView.animate(withDuration: 0.1, animations: {
                    
                    hud.textLabel.text = "Success"
                    hud.detailTextLabel.text = nil
                    hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                    
                })
                
                hud.dismiss(afterDelay: 1.0)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    
                    completionHandler()
                    
                }
                
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(20)) {
                
                self.incrementHUD(hud, progress: progress, completionHandler: completionHandler)
                
            }
        }
    }
}

struct GCurrency {
    
    static func formatCurrency(_ value: UInt32) -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        return formatter.string(from: value as NSNumber)!
        
    }
    
}



struct GData{
    
    static func archive_array(array: [Any?]) -> Data{
        return NSKeyedArchiver.archivedData(withRootObject: array)
    }
    
    static func unarchive_data<T>(data: NSData) -> T{
        return NSKeyedArchiver.archivedData(withRootObject: data) as! T
    }
    
}

struct GAccessbility {
    
    static func call_phone(no: String, vc: UIViewController){
        
        var temp_no = no
        temp_no = temp_no.replacingOccurrences(of: "(", with: "")
        temp_no = temp_no.replacingOccurrences(of: ")", with: "")
        temp_no = temp_no.replacingOccurrences(of: " ", with: "")
        
        if let url = URL(string: "tel://\(temp_no)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            let alert = GAlert.set(title: "Info", msg: "Application is not able to call phone", style: .alert)
            GAlert.addAction(title: "Cancel", style: .cancel, completion: nil, alert: alert)
            vc.present(alert, animated: true, completion: nil)
        }
        
    }
    
    static func send_email(email: String, vc: UIViewController){
        
        
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            let alert = GAlert.set(title: "Info", msg: "Application is not able to send an email", style: .alert)
            GAlert.addAction(title: "Cancel", style: .cancel, completion: nil, alert: alert)
            vc.present(alert, animated: true, completion: nil)
        }
        
    }
    
    static func open_browser(url: String, vc: UIViewController, delegat: SFSafariViewControllerDelegate){
        let controller = SFSafariViewController(url: URL(string: url)!)
        controller.delegate = delegat
        vc.present(controller, animated: true, completion: nil)
    }
    
    static func copy_phone_number(no: String, vc: UIViewController){
        
        var temp_no = no
        temp_no = temp_no.replacingOccurrences(of: "(", with: "")
        temp_no = temp_no.replacingOccurrences(of: ")", with: "")
        temp_no = temp_no.replacingOccurrences(of: " ", with: "")
        
       UIPasteboard.general.string = temp_no
        
        let alert = GAlert.set(title: "Info", msg: "Nomor telepon berhasil disalin", style: .alert)
        GAlert.addAction(title: "Close", style: .cancel, completion: nil, alert: alert)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
