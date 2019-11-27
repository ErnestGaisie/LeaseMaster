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
//import ZKCarousel
import Kingfisher


class FirstPageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  
//    var carouselIimages: [ZKCarouselSlide] = [ZKCarouselSlide]()
  
    var properties: [property] = [property]()
    
    @IBOutlet weak var allPropertiesTableView: UITableView!
    
    @IBOutlet weak var propertySearchTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        CircularSpinner.show()
        
      
        allPropertiesTableView.delegate = self
        allPropertiesTableView.dataSource = self
        allPropertiesTableView.separatorStyle = .none
        
//        allPropertiesTableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        allPropertiesTableView.register(UINib.init(nibName: "PropertiesTableViewCell", bundle: nil), forCellReuseIdentifier: "tCell")

        setupTextfields(textField: propertySearchTextfield)
//        propertySearchTextfield.addShadowToTextField(color: .gray, cornerRadius: 3, opacity: 0.5)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onPropertiesRecieved(notification:)), name: Notification.Name("Properties Recieved"), object: nil)
        
                Alamofire.request(APIConstants.Properties_JSON_URL).responseJSON { response in
                    
                    //print(response)
                    if let data = response.data{
                        
                        do {
                            let json = try JSON(data: data)
                            
                            let innerData = json["data"]
                            
                            let anotherData = innerData["data"]
                            
                            self.processProperties(json: anotherData)
                            
                           
                        }
                        catch{
                            print("JSON error: \(error)")
                        }
                    }
                    

        }

                           }
                        

    
    @objc func onPropertiesRecieved(notification: Notification) {
        if let properties: [property] = notification.object as? [property]{
            self.properties = properties
            self.allPropertiesTableView.reloadData()
        }
    }
     


    
    func processProperties(json: JSON) {
        var properties: [property] = [property]()
        
        for (key, item): (String, JSON) in json {
            var prop = property()
            
            let name = item["name"]
            prop.name = name.string!
            
            let price = item["price"]
            prop.price = price.string!
            
            let arrayImages = item["images"]
            
            let meta = item["meta"]
            prop.occupants = meta["occupants"].int!
            prop.bathrooms = meta["bathroom"].int!
            prop.bedrooms = meta["bedroom"].int!
            
            
            
            var propertyPaths: [String] = []
            
            for (innerKey, innerItem): (String, JSON) in arrayImages {
                var propertyImages = images()
                
                let path = innerItem["path"].string!
                propertyImages.path = path
                
                propertyPaths += [propertyImages.path]
                prop.paths = propertyPaths
            }
            
            properties += [prop]
        }
        
        if properties.count > 0 {
            NotificationCenter.default.post(name: Notification.Name("Properties Recieved"), object: properties)
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
                    
//                      let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! PropertiesTableViewCell
//
                                    let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as! PropertiesTableViewCell
                    
                    
                    
                    let mProperties = properties[indexPath.row-1]
                    
                    //print(mProperties)
                    
//                    cell.roomDescriptionLabel.text = mProperties.name
//                    cell.amountLabel.text = mProperties.price
                    
                    
                    
                    
                    var images: [ZKCarouselSlide] = [ZKCarouselSlide]()
                    //var images: [UIImage] = [UIImage]()
                    print(mProperties.paths)
                    for item in mProperties.paths{
                        

                        KingfisherManager.shared.retrieveImage(with: URL(string: item)!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                           
                            let slide = ZKCarouselSlide(image: image!, title: "", description: "")
                            
                            images += [slide]
                            cell.carousel.slides = images
                        
                        })
                           
                         
                  
                        
                    }
       
      
           
                    return cell
                   }
                
                
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let vc = (storyboard?.instantiateViewController(withIdentifier: "detailView") as? propertiesDetailViewController)!
        
        let detailedProperty = properties[indexPath.row - 1]
        let detailedPropertyName = properties[indexPath.row - 1].name
        let detailedDescription = properties[indexPath.row - 1].description
        
        
        vc.getDetailedProperty = detailedProperty
        vc.getDetailedPropertyName = detailedPropertyName
        vc.getDetailedDescription = detailedDescription
        
//        vc?.imageSlider.slides = properties[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
//        self.present(vc!, animated: true, completion: nil)
    }
    
                       
   

      
    


}
        

