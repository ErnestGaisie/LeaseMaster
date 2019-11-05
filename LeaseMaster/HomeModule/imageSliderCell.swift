//
//  imageSliderCell.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 28/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class imageSliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage! {
        didSet {
            imageView.image = image
        }
    }
    
}
