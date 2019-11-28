//
//  PropertiesTableViewCell.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 22/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit


class PropertiesTableViewCell: UITableViewCell {
    var images : [String] = [String]()
    @IBOutlet var carousel: ZKCarousel! = ZKCarousel()
    
    @IBOutlet weak var propertyTypeLabel: UILabel!
    
    @IBOutlet weak var propertyNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCarousel()
    
    }
    
    func setupCarousel(){
        self.carousel.interval = 3
        self.carousel.start()
        }
        
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
