//
//  CreatePasswordViewController.swift
//  LeaseMaster
//
//  Created by user on 23/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var reTypePasswordTextField: UITextField!
       
       @IBOutlet weak var createPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

      setupTextfields(textField: newPasswordTextField)
          setupTextfields(textField: reTypePasswordTextField)
           setupButtonStyle(button:createPasswordButton)
        
    }
    

   

}
