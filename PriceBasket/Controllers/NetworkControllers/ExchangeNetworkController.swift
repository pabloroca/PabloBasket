//
//  ExchangeNetworkController.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import Alamofire

open class ExchangeNetworkController {
    open func readFromServer(completionHandler: @escaping (_ success: Bool) -> Void) {
        
        if let settings = SettingsDataController().readFirst() {
            guard Date().timeIntervalSince1970 - settings.tsexchange > Constants.cacheExchangeTime else {
                completionHandler(true)
                return
            }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            Alamofire.request(EndPoints.exchangerates, method: .get).responseJSON { (response) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                guard response.result.isSuccess else {
                    completionHandler(false)
                    return
                }
                guard let JSON = response.result.value else {
                    completionHandler(false)
                    return
                }
                ExchangeDataController().addfromJSON(data: JSON as! [String : Any], completionHandler: { (success) in
                    completionHandler(true)
                })
                
            }
            
        }
        
    }
    
}
