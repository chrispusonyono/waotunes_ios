//
//  Signup.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 13/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

import UIKit
import Alamofire
import Toast_Swift
class Signup: UIViewController {
let session = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    
    
    
    @IBOutlet weak var full_name: UITextField!
    @IBOutlet weak var mobile_number: UITextField!
    @IBOutlet weak var email_address: UITextField!
    @IBOutlet weak var password_label: UITextField!
    @IBOutlet weak var error_message_pane: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpClicked(_ sender: UIButton) ->Void{
        let fullname = full_name.text ?? ""
        let mobile = mobile_number.text ?? ""
        let email = email_address.text ?? ""
        let password = password_label.text ?? ""
        
        if fullname.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Fullname can not be blank", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if mobile.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Mobile can not be blank", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if email.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Email can not be blank", preferredStyle: UIAlertController.Style.alert)
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
            "function":"signup",
            "fullName":fullname,
            "mobile": mobile,
            "email": email,
            "device": "IOS",
            "password":password
        ]
        Alamofire.request(Constant.URLS.PROJECT+Constant.URLS.LOGIN_URL, method: .post, parameters: parameters).validate().responseJSON {
            response in
            self.showLoading(load: false)
            switch response.result {
            case .success:
                
                  let dataIn = response.result.value as! NSDictionary
                    if((dataIn.value(forKey: "status") as! Int) == 1){
                        self.loginUser()
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
        self.registerBtn.layer.cornerRadius = 15
    }
    func loginUser() -> Void {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let Login = storyboard.instantiateViewController(withIdentifier: "Login") as! Login
        Login.modalPresentationStyle = .fullScreen
        self.present(Login, animated:true, completion:nil)
    }
    
    func showLoading(load:Bool) -> Void {
        if load{
            self.view.makeToastActivity(.center)}
        else{
            self.view.hideToastActivity()
        }
    }
    @IBAction func goToLogin(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
