//
//  CurrencyViewController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class CurrencyViewController: UITableViewController {

    //UI
    @IBOutlet weak var viewTable: UITableView!
    //UI

    var arrCurrency: [Currency] = []

    // MARK: - View livecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        arrCurrency = CurrencyDataController().readAllSorted()
        viewTable.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currency = arrCurrency[indexPath.row]
        SettingsDataController().setDefaultCurrency(currency: currency.id)
        
        //Fixed in Xcode 8.3
        self.navigationController?.popViewController(animated: true)
    }
    
}
