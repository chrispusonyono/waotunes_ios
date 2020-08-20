//
//  Curve.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 12/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit
class Curve: UIView {

    @IBInspectable var cornerRadius: CGFloat = 20
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }

}
