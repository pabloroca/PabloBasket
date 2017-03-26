//
//  EndPoints.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

/// End Points
struct EndPoints {
    
    /// https protocol
    static let httpprotocol = "http"
    
    /// https protocol
    static let httpsprotocol = "https"
    
    /// Exchange Access Key
    static let exchangeAccesskey = "1b20a681ac8233b31b6f7ca5888ee0ab"
    
    /// goods
    static let goods = "\(httpsprotocol)://dl.dropboxusercontent.com/s/o684h2rgz0iwxik/goods.json"
    
    /// currency list
    static let currencylist = "\(httpprotocol)://apilayer.net/api/list?access_key=\(exchangeAccesskey)"
    
    /// exchange
    static let exchangerates = "\(httpprotocol)://www.apilayer.net/api/live?access_key=\(exchangeAccesskey)"
    
}
