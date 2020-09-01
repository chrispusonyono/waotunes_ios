//
//  MenuLauncher.swift
//  Wao Tunes
//
//  Created by Chrispus Onyono on 31/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

class MenuLauncher: UIViewController {
    
    @IBOutlet weak var goToHome: UIView!
    @IBOutlet weak var goToMyLibrary: UIView!
    @IBOutlet weak var goToWallet: UIView!
    @IBOutlet weak var goToProfile: UIView!
    @IBOutlet weak var goToFeedback: UIView!
    @IBOutlet weak var goToAbout: UIView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    private func initialize(){
        let state = Session()
        
        if(state.loggedIn){
            let session = state.data
            username.text =  session["profile"]["userName"].string!
            email.text =  session["profile"]["email"].string!
            loginBtn.isHidden=true
        }else{
            username.isHidden=true
            email.isHidden=true
        }

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        goToHome.addGestureRecognizer(gesture)
        goToMyLibrary.addGestureRecognizer(gesture)
        goToWallet.addGestureRecognizer(gesture)
        goToProfile.addGestureRecognizer(gesture)
        goToFeedback.addGestureRecognizer(gesture)
        goToAbout.addGestureRecognizer(gesture)
    }
    
    @IBAction func goToLogin(_ sender: Any) {
      let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let mainmenu = storyboard.instantiateViewController(withIdentifier: "Login") as!Login
        mainmenu.modalPresentationStyle = .fullScreen
        self.dismiss(animated:true, completion:nil)
        self.present(mainmenu, animated:true, completion:nil)
        
    }
    

    @objc func checkAction(sender : UITapGestureRecognizer) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let clickedView = sender.view
        switch clickedView {
        case goToAbout:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "About") as!About
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        case goToFeedback:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Feedback") as!Feedback
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        case goToProfile:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Profile") as!Profile
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        case goToWallet:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Wallet") as!Wallet
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        case goToMyLibrary:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Home") as!Home
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        case goToHome:
            let mainmenu = storyboard.instantiateViewController(withIdentifier: "Home") as!Home
            mainmenu.modalPresentationStyle = .fullScreen
            self.dismiss(animated:true, completion:nil)
            self.present(mainmenu, animated:true, completion:nil)
            break
        default: break
            
        }
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
