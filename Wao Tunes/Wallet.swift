//
//  Wallet.swift
//  Wao Tunes
//
//  Created by Chrispus Onyono on 21/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit
import SwiftyJSON
class Wallet: UIViewController {

    @IBOutlet weak var balance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
    }
    private func initialize(){
        let session = Session().data
        
        balance.text = Constant.FUNCTIONS.toMoney(amount: session["wallet"].string!)
    
    }
    @IBAction func withdraw(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
