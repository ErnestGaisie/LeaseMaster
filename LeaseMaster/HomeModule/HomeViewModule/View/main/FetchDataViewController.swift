//
//  FetchDataViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 18/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class FetchDataViewController: UIViewController  {

    @IBAction func moveToLandingPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "HomeModuleStoryboard", bundle: nil)
                   let controller = (storyboard.instantiateViewController(withIdentifier: "HomeModuleStoryboard") as? LandingPageViewController)!
                   
                   controller.propertiesArrayList = propertiesArrayList
                   navigationController?.pushViewController(controller, animated: true)
           
    }
    
    var presenter: ViewToPresenterProtocol?
    lazy var propertiesArrayList: Array<anotherDict> = Array()
    var counter: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
//                   CircularSpinner.show()
                 self.presenter?.StartFetchingProperties()
            
             }
        
       
    }
    
}
    

extension FetchDataViewController: DummyPresenterToViewProtocol{
    func ShowProperties(propertyArray: Array<anotherDict>) {
      
        if propertyArray.count > 1 {
            self.propertiesArrayList.removeAll()
            self.propertiesArrayList = propertyArray
            print(propertiesArrayList)
            print("biscuit")
       
        
                let storyboard = UIStoryboard(name: "HomeModuleStoryboard", bundle: nil)
                                  let controller = (storyboard.instantiateViewController(withIdentifier: "HomeModuleStoryboard") as? LandingPageViewController)!
                                  
                                  controller.propertiesArrayList = propertiesArrayList
                                  navigationController?.pushViewController(controller, animated: true)
            
           
                   
        }
        
        else {
            print("somtehing")
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
}
