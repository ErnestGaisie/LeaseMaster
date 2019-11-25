//
//  FirstPageViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 18/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireImage
import ZKCarousel

class FirstPageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let newimages: [String] = [ "img1-1","img2-1","img2-1"]
    var carouselIimages: [ZKCarouselSlide] = [ZKCarouselSlide]()
  
    
    @IBOutlet weak var allPropertiesTableView: UITableView!
    
    @IBOutlet weak var propertySearchTextfield: UITextField!
    
    var properties = [anotherDict]()
    var images = [ImagesDetails]()
    var mImages = [UIImage]()
    var someArray = [String]()
    var slide = imageSliderCell()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CircularSpinner.show()
        
      
        allPropertiesTableView.delegate = self
        allPropertiesTableView.dataSource = self
        allPropertiesTableView.separatorStyle = .none
        
        allPropertiesTableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        allPropertiesTableView.register(UINib.init(nibName: "PropertiesTableViewCell", bundle: nil), forCellReuseIdentifier: "tCell")
        
        setupTextfields(textField: propertySearchTextfield)
        propertySearchTextfield.addShadowToTextField(color: .gray, cornerRadius: 3)
        
        
        
                Alamofire.request(APIConstants.Properties_JSON_URL).responseJSON { response in
                    
                    if(response.response?.statusCode == 200){
                        if let json = response.result.value as AnyObject? {
                            let arrayResponse = json["data"] as! NSDictionary
                            let innerResponse = arrayResponse["data"] as! NSArray
//
                            let saveJSON = JSON(arrayResponse)
                            //let mJSON = JSON(innerResponse)
                            //print("===========my json===========")
//                            print(mJSON)
                            
       
                            if let arrayobject = Mapper<anotherDict>().mapArray(JSONObject:saveJSON.dictionaryObject?["data"]){
                                
                                
                               
                                
                            self.properties = arrayobject
                                
//                                for i in 0..<self.properties.count{
//                                    self.images = self.properties[i].images!
//                                    for a in 0..<self.images.count{
//
//                                         print(self.images[a].path!)
//                                    }
//                               print("/////////////////try it out/////////")
//                            }

                }
                           
                            
                             self.allPropertiesTableView.reloadData()
        
                            
                        }
                    }
                    else {
                        alertMessager(title: "error", message: "Error while retrieving data")
                    }
                }
                
                
            }
    

  
    
    
    

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count + 1
      }
    
    
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if indexPath.row == 0 {
              
          let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
             return cell
          }
          else
          {
              let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! PropertiesTableViewCell
            
            
            
           
            //cell.images = newimages
            
                    
            
            
            //cell.slider.addImages(images:)
//            cell.amountLabel.text = properties[indexPath.row-1].price
//            cell.roomDescriptionLabel.text = properties[indexPath.row-1].name
            
            for i in 0..<self.properties.count{
            self.images = self.properties[i].images!
            
            print(images)
                //someArray.append(<#T##newElement: String##String#>)
            
                for a in 0..<self.images.count{
                    someArray.append(self.images[a].path!)
                        }
//                            cell.slider.addImages(imageArray: someArray)
                          // print(someArray)
                addImages(imageArray: someArray)
                
                print("this is the array of images")
                print(mImages)
                
                for i in mImages{
                    let slide = ZKCarouselSlide(image: i, title: "first image", description: "Some image")
                    carouselIimages.append(slide)
                }
                cell.carousel.slides = carouselIimages
                        
                
                  //mImages.removeAll()
                  someArray.removeAll()
                  }
                return cell
           }
        
        
      }
    
        public func addImages(imageArray: [String]){
            for i in 0 ..< imageArray.count {
                        
                Alamofire.request(imageArray[i]).responseImage { response in
                    if let image = response.result.value {
                        self.mImages.append(image)
                    }
                   
                    //print("***********this is the array containing the real images***************")
                    //print(self.mImages)
                    
            }
               
        }
    }
    
  
}

