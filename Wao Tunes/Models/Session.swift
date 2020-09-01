//
//  Session.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 08/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import Foundation
import SwiftyJSON
class Session {
    
    var loggedIn :Bool
    var data: JSON
    init() {
        loggedIn=Constant.DATA.storage.bool(forKey: "loggedIn")
        data=JSON((Constant.DATA.storage.string(forKey: "data") ?? "{}").data(using: .utf8)!)
        
    }
    func start(data:NSDictionary) -> Void {
        Constant.DATA.storage.set(loggedIn, forKey: "loggedIn")
        Constant.DATA.storage.set(data, forKey: "data")
    }
    func end() -> Void {
        Constant.DATA.storage.set(false, forKey: "loggedIn")
        Constant.DATA.storage.set("", forKey: "data")
    }
}
