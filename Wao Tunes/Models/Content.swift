//
//  Content.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 05/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import Foundation
class Content {
    
    var id: String
    var icon: String
    var description: String
    
    
    init(id: String, icon: String, description: String) {
        self.id=id
        self.icon=icon
        self.description=description
    }
    
}
