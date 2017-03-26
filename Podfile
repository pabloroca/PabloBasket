source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def pods_to_install
  pod 'Alamofire', '~> 4.4'
  pod 'AlamofireImage', '~> 3.1'
  pod 'RealmSwift'
  pod 'SwiftLint'
end

target 'PriceBasket' do
  pods_to_install
end

target 'PriceBasketTests' do
  pods_to_install
end

target 'PriceBasketUITests' do
  pods_to_install
end

post_install do |installer|
   installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
         config.build_settings['SWIFT_VERSION'] = '3.0'
      end
   end
end