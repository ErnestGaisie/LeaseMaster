//
//  ViewController.swift
//  LeaseMaster
//
//  Created by user on 21/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var signupLabelButtonSpace: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextfields(textField: emailTextField)
        setupTextfields(textField: fullnameTextField)
        setupTextfields(textField: passwordTextField)
        signupLabel.adjustsFontSizeToFitWidth = true
         varyConstraints()
    }


    func varyConstraints()
        {
            // iphone 5s,SE screen height 567
            // iphone 6,6s,7,etc height 667
            // iphone 7 plus, 8 plus, xs max,etc height 896
            if (self.view.frame.height < 570) {
                signupLabelButtonSpace.constant = 5
                
               
                
                
            } else if (self.view.frame.height > 600 && self.view.frame.height < 730) {
                
                signupLabelButtonSpace.constant = 35
                
            } else if (self.view.frame.height > 730 && self.view.frame.height < 800) {
                
               signupLabelButtonSpace.constant = 44
            }
            
            else if (self.view.frame.height > 800) {
                
                 signupLabelButtonSpace.constant = 44
            }

    }

func setupTextfields(textField:UITextField){
    textField.layer.cornerRadius = 4.0
    textField.layer.borderWidth = 1.0
    textField.layer.borderColor = UIColor.veryLightPink.cgColor
    
     // Create a padding view for padding on left
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
    textField.leftViewMode = .always
           
    // Create a padding view for padding on right
    textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
    textField.rightViewMode = .always
   
}

@objc func dismissKeyboard()
{
    emailTextField.resignFirstResponder()
     fullnameTextField.resignFirstResponder()
    view.endEditing(true)
}

@objc func keyboardWillHide(notification: NSNotification) {
    // countryPicker.isHidden = false
    if self.view.frame.origin.y != 0 {
        self.view.frame.origin.y += 0
    }
}

    
}
