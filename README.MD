## Exercise requirements

Pricing a basket

Write a mobile application and associated unit tests that can price a basket of goods in a number of different currencies.
The goods that can be purchased, which are all priced in USD, are:

*             Peas - 95c per bag
*             Eggs - 2.10 per dozen
*             Milk - 1.30 per bottle
*             Beans - 73c per can

The program should allow the user to add or remove items in a basket. The user can click on a checkout button which will then display the total price for the basket with the option to display the amount in different currencies. For example, if the basket contained Milk and the currency selected was EUR with an exchange rate of 1.5, the total would be $1.95 EUR.

No UI design constraints are enforced so feel free to design the UI in the way you see as most appropriate for the solution.

The list of currencies should be consumed from http://jsonrates.com/currencies.json. To convert to other currencies, you will need to create an account on http://jsonrates.com/.

This will then issue you with an API-Key that permits reading from the various public APIs listed on their site. The exchange rates may change at any time.

The code and design should meet these requirements but be sufficiently flexible to allow for future extensibility. The code should be well structured, suitably commented, have error handling and be tested.


## Exercise notes

## Main specs:

* Developed in SWIFT 3, requires XCode 8.2 to run it
* iOS 9.0 compatible
* CocoaPods
* using MVC
* Network requests in the background
* Network requests cached
* Unit tests
* plist with UIRequiresPersistentWiFi (like Apple's mail app)
* AutoLayout
* Network waiting indicators in status bar
* using SwiftLint to enforce Swift coding style and conventions
* Using as few external libraries as possible:

* Alamofire
* RealmSwift
* SwiftLint

## Requirements to run

* iOS9
* XCode 8.2

## SwiftLint

Is a tool to enforce Swift style coding and conventions
https://github.com/realm/SwiftLint

It is implemented as a run script, if you don't want to install it, comment or remove the run script in the target.

## Problems with End Points

http://jsonrates.com has changed and http://jsonrates.com/currencies.json is not longer available. I must request to the substitute for it, who is at https://currencylayer.com

## SOLID principles

Trying to apply SOLID principles and Clean Code, specially the Single Responsability. Classes must be lightewigth and perform only one task inside his abstraction layer. So it's better to have more classes that one big bloated class

## CACHE

Currencies are cached by one day
Exchanges are cached by 60 mins (as they do in the free tier)

## Database

I have created this RealmSwift tables:

* Basket. Goods added to the basket
* Currency. List of currencies
* CurrencyExchange. Exchange rates
* Goods. List of goods
* Settings. Settings and time stamps for cache

## Network requests failures

This is not a trivial issue, some debate ongoing and as per this docs

Networking Overview
https://developer.apple.com/library/ios/documentation/NetworkingInternetWeb/Conceptual/NetworkingOverview/WhyNetworkingIsHard/WhyNetworkingIsHard.html#//apple_ref/doc/uid/TP40010220-CH13-SW8

WWDC 2012 Session 706, "Networking Best Practices"
https://developer.apple.com/videos/play/wwdc2012-706/

Almofire documentation
https://github.com/Alamofire/Alamofire

So we conclude with this (and it is applied in the exercise):

* Don't use Rechability to determine if a network request should be sent. You should always send the request.
* Analize Reachability if failures. When Reachability is restored, use the event to retry failed network requests. (Even though the network requests may still fail, this is a good moment to retry them.)
* Don't timeout, let the system to do it. There is no good timeout value

## TODO
