//
//  LandingViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 22/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var searchBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBox.addShadowToTextField(color: .gray, cornerRadius: 3)

        // Do any additional setup after loading the view.
    }
    

    
}


extension UITextField {

    func addShadowToTextField(color: UIColor = UIColor.gray, cornerRadius: CGFloat) {

    self.backgroundColor = UIColor.white
    self.layer.masksToBounds = false
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
    self.layer.shadowOpacity = 1.0
    self.backgroundColor = .white
    self.layer.cornerRadius = cornerRadius
   }
}
