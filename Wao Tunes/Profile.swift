//
//  Profile.swift
//  Wao Tunes
//
//  Created by Chrispus Onyono on 21/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

class Profile: UIViewController {
    @IBOutlet weak var full_name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var purchased: UILabel!
    @IBOutlet weak var uploads: UILabel!
    @IBOutlet weak var live: UILabel!
    @IBOutlet weak var withdrawal_holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
    }
    
    private func initialize(){
        withdrawal_holder.setBorder(radius: 7, color: UIColor.white)
        let session = Session().data
        full_name.text =  session["profile"]["userName"].string!
        email.text =  session["profile"]["email"].string!
        purchased.text =  "\(session["library"]["purchased"].arrayValue.count)"
        uploads.text =  "\(session["library"]["uploads"].arrayValue.count)"
        live.text =  "\(session["library"]["uploads"].arrayValue.count)"
    }
    @IBAction func logout(_ sender: UIButton) {
        Session().end()
        goLogin()
    }

        private func goLogin() ->Void{
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Login") as!Login
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            
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
extension UIView{

    func setBorder(radius:CGFloat, color:UIColor = UIColor.clear) -> UIView{
        let roundView:UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }
}
