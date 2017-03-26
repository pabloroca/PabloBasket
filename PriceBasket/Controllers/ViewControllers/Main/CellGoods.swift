//
//  CellGoods.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class CellGoods: UITableViewCell {

    //UI
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblunits: UILabel!
    @IBOutlet weak var stepPlusMinus: UIStepper!
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

    func configureCell(data: Goods) {
        //aqui
        id = data.id
        lbldescription.text = data.name
        lblprice.text = "\(data.price)"
        
        if let basket = BasketDataControler().readforKey(fkid: data.id) {
            stepPlusMinus.value = Double(basket.units)
            lblunits.text = "\(basket.units)"
        } else {
            stepPlusMinus.value = 0.0
            lblunits.text = ""
        }

    }
    
}
