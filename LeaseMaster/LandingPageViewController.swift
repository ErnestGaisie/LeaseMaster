//
//  LandingPageViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 22/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var propertiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.propertiesTableView.delegate = self
        self.propertiesTableView.dataSource = self

        searchField.addShadowToTextField(color: .gray, cornerRadius: 3)
        
        self.propertiesTableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
      
    }
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
           return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            return cell
        }
        
        
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
