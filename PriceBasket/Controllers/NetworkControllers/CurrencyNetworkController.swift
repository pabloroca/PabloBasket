//
//  CurrencyNetworkController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import Alamofire

open class CurrencyNetworkController {
    open func readFromServer(completionHandler: @escaping (_ success: Bool) -> Void) {
        
        if let settings = SettingsDataController().readFirst() {
            guard Date().timeIntervalSince1970 - settings.tscurrency > Constants.cacheCurrencyTime else {
                completionHandler(true)
                return
            }
            
            Alamofire.request(EndPoints.currencylist, method: .get).responseJSON { (response) in
                guard response.result.isSuccess else {
                    completionHandler(false)
                    return
                }
                guard let JSON = response.result.value else {
                    completionHandler(false)
                    return
                }
                CurrencyDataController().addfromJSON(data: JSON as! [String : Any], completionHandler: { (success) in                    completionHandler(true)
                })
                
            }
            
        }
        
    }
    
}
