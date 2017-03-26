//
//  Constants.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 25/03/2017.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation

/// Constants for the App
public struct Constants {
    
    /// cache time for currency (in seconds)
    /// set to 1 day
    static let cacheCurrencyTime: Double = 60*60*24
    
    /// cache time for exchange (in seconds)
    /// free plan is 60 minutes
    static let cacheExchangeTime: Double = 60*60
    
    // free plan does not allow GBP, moving to USD
    static let defaultCurency: String = "USD"
}
