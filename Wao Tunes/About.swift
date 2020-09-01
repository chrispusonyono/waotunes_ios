//
//  About.swift
//  Wao Tunes
//
//  Created by Chrispus Onyono on 21/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

class About: UIViewController {
    @IBOutlet weak var about_label_one: UILabel!
    @IBOutlet weak var about_label_two: UILabel!
    @IBOutlet weak var about_label_thr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
    }
    private func initialize(){
        about_label_one.text="WaoTunes App is a mobile application for music videos. For more info visit"
        about_label_two.text="www.waotunes.com\nPrivacy Policy\nTerms and Conditions"
        about_label_thr.text="@ 2020 112 group LTD. All Rights Reserved.\nVersion:" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
        
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
