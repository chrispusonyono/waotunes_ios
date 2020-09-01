//
//  Login.swift
//  Wao Tunes
//
//  Created by Chrispus Onyono on 25/06/2020.
//  Copyright © 2020 WaoTunes. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift
class Login: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    
    
    
    @IBOutlet weak var username_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var error_message_pane: UILabel!
    @IBOutlet weak var login_btn: UIButton!
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginClicked(_ sender: UIButton) ->Void{
        let username = username_field.text ?? ""
        let password = password_field.text ?? ""
        
        if username.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Username can not be blank", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if password.isEmpty  {
            let alert = UIAlertController(title: "Error", message: "Password can not be blank", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        showLoading(load: true)
        
        let parameters: Parameters=[
            "function":"login",
            "userId":username,
            "device": "IOS",
            "token":UserDefaults(suiteName:"app")!.string(forKey: "deviceToken") ?? "0",
            "password":password
        ]
        Alamofire.request(Constant.URLS.PROJECT+Constant.URLS.LOGIN_URL, method: .post, parameters: parameters).validate().responseJSON {
            response in
            self.showLoading(load: false)
            switch response.result {
            case .success:
                
                  let dataIn = response.result.value as! NSDictionary
                    if((dataIn.value(forKey: "status") as! Int) == 1){
                        Session().start(data: dataIn)
                        self.goHome()
                    }else{
                        self.error_message_pane.text = dataIn.value(forKey: "message") as? String
                    }
                
            case .failure(let error):
                self.error_message_pane.text = "Unable to reach server"
                print(error)
            }
        }
        
    }
    func initializeView() -> Void {
        self.error_message_pane.text = ""
        self.hideKeyboardWhenTappedAround()
        self.login_btn.layer.cornerRadius = 15
    }
    func showLoading(load:Bool) -> Void {
        if load{
            self.view.makeToastActivity(.center)}
        else{
            self.view.hideToastActivity()
        }
    }
    private func goHome() ->Void{

        let mainmenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as!UITabBarController
        mainmenu.selectedIndex=0
        mainmenu.modalPresentationStyle = .fullScreen
        self.present(mainmenu,animated: true, completion:nil)
    }
    @IBAction func goToSignup(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let signup = storyboard.instantiateViewController(withIdentifier: "Signup") as! Signup
        signup.modalPresentationStyle = .fullScreen
        self.present(signup, animated:true, completion:nil)
        
    }
}
