//
//  ViewController.swift
//  Wao Tunes
//
//  Created by Nick Kilesi on 25/06/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
         initialize()
    }
    private func initialize(){
        goLogin()
    }

    private func goLogin() ->Void{
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
//        let mainmenu = storyboard.instantiateViewController(withIdentifier: "Login") as!Login
//        mainmenu.modalPresentationStyle = .currentContext
//        self.present(mainmenu, animated:true, completion:nil)
        
        let mainmenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as!UITabBarController
        mainmenu.selectedIndex=0
        mainmenu.modalPresentationStyle = .currentContext
        self.present(mainmenu,animated: true, completion:nil)
        
    }

}

extension UIViewController {
    
    func setTitle(_ title: String, subtitle: String) {
        let appearance = UINavigationBar.appearance()
        let textColor = appearance.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor ?? .black
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.headline)
        titleLabel.textColor = textColor
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        subtitleLabel.textColor = textColor.withAlphaComponent(0.75)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        self.navigationItem.titleView = stackView
        let logo = UIImage(named: "logo_flat.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
}
