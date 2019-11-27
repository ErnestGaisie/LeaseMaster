//
//  propertiesDetailViewController.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 28/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit
import Kingfisher

class propertiesDetailViewController: UIViewController {
      var images: [ZKCarouselSlide] = [ZKCarouselSlide]()

    @IBOutlet weak var imageSlider: ZKCarousel!
    var getDetailedProperty: property?
    var getDetailedPropertyName: String?
    var getDetailedDescription: String?
    var getDetailedOccupants: String?
    
    @IBOutlet weak var bottomView: UIView!
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        bottomView.layer.shadowOpacity = 0.1
        print("hamcheesegoatmilk")
        print(getDetailedPropertyName)
        print(getDetailedProperty)
        print(getDetailedProperty?.bedrooms)
        
        for imagePath in getDetailedProperty!.paths{
        
                  print(imagePath)

                  KingfisherManager.shared.retrieveImage(with: URL(string: imagePath)!, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                    let slide = ZKCarouselSlide(image: image!, title: "", description: "")
                    
                    self.images += [slide]
                    self.imageSlider.slides = self.images
                  
                  })
                     
                      
            
                  
              
        }
//        imageSlider.imgArray = imgArray
        
    }
    
    @IBAction func didPressRequestContact(_ sender: Any) {
        
        
    }
    
    
    
}


 
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
   
}

