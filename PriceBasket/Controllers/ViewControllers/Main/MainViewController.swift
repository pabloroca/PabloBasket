//
//  MainViewController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //UI
    @IBOutlet weak var btnCheckout: UIBarButtonItem!
    @IBOutlet weak var viewTable: UITableView!
    //UI
    
    var arrGoods: [Goods] = []

    // MARK: - View livecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTable.delegate = self
        viewTable.dataSource = self
        viewTable.tableFooterView = UIView()
        self.setUpUI()
        
        arrGoods = GoodsDataController().readAll()
        viewTable.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = NSLocalizedString("Main_Title", comment: "")
    }
    
    // MARK: - Custom methods

    func setUpUI() {
        btnCheckout.title = NSLocalizedString("btnCheckout_Title", comment: "")
    }
    
    @IBAction func setpMinusPlus(_ sender: UIStepper) {
        let point = sender.convert(CGPoint(x: 0, y: 0), to: viewTable)
        let indexPath = viewTable.indexPathForRow(at: point)!
        let item = arrGoods[indexPath.row]
        BasketDataControler().update(fkid: item.id, units: Int(sender.value))
        
        viewTable.beginUpdates()
        viewTable.reloadRows(at: [indexPath], with: .none)
        viewTable.endUpdates()
    }

    // we restore to default currency
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueid = segue.identifier {
            if segueid == "checkout" {
                SettingsDataController().setDefaultCurrencyToDefault()
            }
        }
    }
    
}

