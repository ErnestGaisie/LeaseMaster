//
//  VerificationViewController.swift
//  LeaseMaster
//
//  Created by user on 22/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
 @IBOutlet weak var phoneNumTextField: UITextField!
 @IBOutlet weak var verificationCodeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setupTextfields(textField: phoneNumTextField)
         setupTextfields(textField: verificationCodeTextField)
       
        
        
    }
    


}
