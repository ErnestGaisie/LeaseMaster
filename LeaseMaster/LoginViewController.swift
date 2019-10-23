//
//  LoginViewController.swift
//  LeaseMaster
//
//  Created by user on 23/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextfields(textField: emailTextField)
        setupTextfields(textField: passwordTextField)
        setupButtonStyle(button:facebookButton)
        setupButtonStyle(button:googleButton)
        setupButtonStyle(button:loginButton)
        googleButton.layer.borderColor = UIColor.brownGrey.cgColor
        googleButton.layer.borderWidth = 1.0
    }
    

   

}
