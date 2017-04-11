//
//  CheckOutViewController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class CheckOutViewController: UITableViewController {

    //UI
    @IBOutlet weak var viewTable: UITableView!

    @IBOutlet weak var lblTotalBasket: UILabel!
    @IBOutlet weak var lblTotalBasketAmount: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblCurrencyValue: UILabel!
    //UI
    
    // MARK: - View livecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = NSLocalizedString("Checkout_Title", comment: "")
        
        ExchangeNetworkController().readFromServer(completionHandler: { [weak self] (succes) in
            self?.lblTotalBasketAmount.text = String(format: "%.2f", BasketDataControler().calculateBasket())
            self?.lblCurrencyValue.text = SettingsDataController().nameforCurrencySelected()
        })

        lblTotalBasketAmount.text = String(format: "%.2f", BasketDataControler().calculateBasket())
        lblCurrencyValue.text = SettingsDataController().nameforCurrencySelected()
    }

    // MARK: - Custom methods
    
    func setUpUI() {
        lblTotalBasket.text = NSLocalizedString("lblTotalBasket_Text", comment: "")
        lblCurrency.text = NSLocalizedString("lblCurrency_Text", comment: "")
    }

}
