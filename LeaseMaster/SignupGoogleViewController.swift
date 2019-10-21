//
//  SignupGoogleViewController.swift
//  LeaseMaster
//
//  Created by user on 21/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class SignupGoogleViewController: UIViewController {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var SignupMomoButton: UIButton!
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loginStackView.adj
       setupButtonStyle(button:facebookButton)
         setupButtonStyle(button:googleButton)
         setupButtonStyle(button:SignupMomoButton)
        googleButton.layer.borderColor = UIColor.brownGrey.cgColor
        googleButton.layer.borderWidth = 1.0
    }
    

   func setupButtonStyle(button:UIButton){
        button.layer.cornerRadius = 4.0
        
    }


}
