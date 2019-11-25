//
//  SliderCell.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 23/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

public class SliderCell: UICollectionViewCell {

    @IBOutlet weak var slideImage: UIImageView!
    
     public var image:UIImage! {
           didSet {
               slideImage.image = image
           }
       }
    
    }



