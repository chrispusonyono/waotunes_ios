//
//  Constant.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 05/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import Foundation
import SystemConfiguration
import SwiftyJSON
import Alamofire
class Constant {
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let connection = (isReachable && !needsConnection)
        
        return connection
        
    }
    struct URLS {
        static let PROJECT = "https://web.waotunes.com/raw/api/"
        static let LOGIN_URL = "user/parser.jsp"
        static let CATEGORIES = "user/parser.jsp"
    }
    struct DATA {
        static var storage = UserDefaults.standard
        static var categories = [Category]()
        static var MyUploads = [Content]()
        static var MyPurchase = [Content]()
    }
    struct FUNCTIONS {
       
        static func fetchCategories() -> Void {
            let categoriesJSON = JSON(Constant.DATA.storage.string(forKey: "categories") ?? "[]")
            for (index, subJson):(String, JSON) in categoriesJSON {
                           subJson[""]
            }
            
            
            
            let parameters: Parameters=[
                "function":"categories",
            ]
            Alamofire.request(Constant.URLS.PROJECT+Constant.URLS.CATEGORIES, method: .post, parameters: parameters).validate().responseJSON {
                response in
                switch response.result {
                case .success:
                    
                      let dataIn = response.result.value as! NSDictionary
                        if((dataIn.value(forKey: "status") as! Int) == 1){
                            
                            homeInstance?.categoryCollection.reloadData()
                            
                            
                        }else{
                            
                        }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
       
        
        
        static func toMoney(amount:String) -> String {
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "en_KE")
            formatter.numberStyle = .currency
            let formattedTipAmount = formatter.string(from: NumberFormatter().number(from: amount)!)!
            return formattedTipAmount
        }
     
    
        
    }
    
}
