//
//  CellCurrency.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class CellCurrency: UITableViewCell {
    
    //UI
    @IBOutlet weak var lbldescription: UILabel!
    //UI
    
    var id: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(data: Currency) {
        lbldescription.text = data.id + " - " + data.name
    }
    
}
