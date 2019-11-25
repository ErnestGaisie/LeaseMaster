//
//  TableViewCell.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 22/10/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var slider: customSlideView!
    
    @IBOutlet weak var roomInfoLabel: UILabel!

    @IBOutlet weak var roomDescriptionLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

