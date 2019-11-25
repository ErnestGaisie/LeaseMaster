//
//  LandingPageViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 22/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit
import SVProgressHUD

class LandingPageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var propertiesTableView: UITableView!
    var presenter: ViewToPresenterProtocol?
    lazy var propertiesArrayList: Array<anotherDict> = Array()
    var counter: Int = 0
   
    var isRefreshInProgress = false
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//           CircularSpinner.hide()
//        DispatchQueue.main.async {
//              CircularSpinner.show()
//            self.presenter?.StartFetchingProperties()
//        }
//      
         
        self.propertiesTableView.backgroundView = nil
        self.propertiesTableView.backgroundColor = UIColor.clear
//        self.propertiesTableView.addSubview(self.refreshControl)
      
//          self.propertiesTableView.reloadData()
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
      
//        propertiesTableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//
        searchField.addShadowToTextField(color: .gray, cornerRadius: 3)
        setupTextfields(textField: searchField)
//        print("==========================Printing Properties===========================")
        propertiesTableView.separatorStyle = .none
     
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //self.title = "NEWS"
//        self.presenter?.StartFetchingProperties()
//         // self.propertiesTableView.reloadData()
//
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//     // self.propertiesTableView.reloadData()
//
//    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        if isRefreshInProgress {
            
            return
        }
        isRefreshInProgress = true
//        self.presenter!.resetArticleList()
        //self.propertiesTableView.reloadData()
        
    }


//    @objc func loadList(notification: NSNotification){
//        //load data here
//        self.propertiesTableView.reloadData()
//    }

//override func viewWillAppear(_ animated: Bool)
//{
//    super.viewWillAppear(animated)
//    propertiesTableView.reloadData()
//     presenter?.StartFetchingProperties()
//
//}
    
    func showLoader(_ status: Bool) {
        if status {
            SVProgressHUD.setDefaultStyle(.light)
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.setDefaultAnimationType(.native)
            SVProgressHUD.show(withStatus: "Loading..")
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
}
extension LandingPageViewController: PresenterToViewProtocol{
    func showLoaderView(_ status: Bool) {
        if refreshControl.isRefreshing {
            
            return
        }
        self.showLoader(status)
    }
    

        
        func ShowProperties(propertyArray: Array<anotherDict>) {
          
            print("hdbkflnsm")
//            if propertyArray.count > 0 {
//                self.propertiesArrayList.removeAll()
//                self.propertiesArrayList = propertyArray
//                print(propertiesArrayList)
//
//               CircularSpinner.hide()
//                    //Not working
//
//
//            }
            
//            print("=================this is so amazing==================")
//            print(self.propertiesArrayList)
//            print("================just making sure though==================")
//            print(propertyArray.count)
           // print("this is working and i am very sure of it")
            //print(propertyArray[0])
           // reloadTable()
        
           // print(propertyArray)
           
    }
    
    func reloadTable()  {
        propertiesTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        return 1
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print("===========Amen===========")
        
      //  print(self.propertiesArrayList)
        
       // print("=========Nkatie============")
        self.counter =  self.counter + 1
        print("this is counter  \(self.counter)")
        
        print( self.propertiesArrayList.count)
        
        return  self.propertiesArrayList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Counter from the cell \(counter)")
        if indexPath.row == 0 {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
           return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! SliderTableViewCell

            cell.amountLabel.text = "400"

            return cell
         }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter?.showPropertiesDetailViewController(navigationController: navigationController!)
    }
    
     
        
       
    func showError() {
            let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
