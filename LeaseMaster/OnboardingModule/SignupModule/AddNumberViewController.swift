//
//  AddNumberViewController.swift
//  LeaseMaster
//
//  Created by user on 23/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class AddNumberViewController: UIViewController {
    @IBOutlet weak var phoneNumTextField: UITextField!
   
       @IBOutlet weak var continueButton: UIButton!
          
    override func viewDidLoad() {
        super.viewDidLoad()

       setupTextfields(textField: phoneNumTextField)
        setupButtonStyle(button:continueButton)
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
