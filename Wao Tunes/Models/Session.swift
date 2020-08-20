//
//  Session.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 08/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import Foundation
class Session {
    
    var loggedIn :Bool
    var data: String
    init() {
        loggedIn=Constant.DATA.storage.bool(forKey: "loggedIn")
        data=Constant.DATA.storage.string(forKey: "data") ?? ""
        
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
