# DeenIslamBLSDK
[![Version](https://img.shields.io/cocoapods/v/DeenIslamBLSDK)](https://github.com/shadhin-music/DeenIslamBLSDK)
[![License](https://img.shields.io/github/license/shadhin-music/DeenIslamBLSDK)](https://github.com/shadhin-music/DeenIslamBLSDK)

## Installation

DeenIslamBLSDK is available through [CocoaPods](https://github.com/shadhin-music/DeenIslamBLSDK). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DeenIslamBLSDK’
```
## SDK Initilization 
In Appdelegate SDK initilization process with token and call back delegate 
```ruby
import DeenIslamSDK


func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
application.beginReceivingRemoteControlEvents()
 	return true
}

override func remoteControlReceived(with event: UIEvent?) {
if let event = event {
 		DeenIslamBLSDK.shared.eventRegister(with: event)
}

}
func applicationWillTerminate(_ application: UIApplication) {
         DeenIslamBLSDK.shared.terminate()

}
  
```
In Info.plist file
```ruby
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
<key> Application can be killed immediately when user is shutting down or logging out</key>
<false/>

```

DeenIslamSDKNotifier
```
func errorMessage(error: String)

func tokenStatus(token isValid: Bool, error: String?) {
        if isValid{
            print("token is valid")
        }else{
            print(error ?? "error")
        }
 }
```
SDK initializer with  Tabbar,navigationBar,delegate,token and isBL number or not
isBL is optional 
```
DeenIslamBLSDK.shared.initialize(with: UITabBarController?, nav: UINavigationController, delegate: DeenIslamSDKNotifier, token: String, isBL: Bool)
```
direct open sdk 
```
DeenIslamBLSDK.shared.gotoHome()
```
sdk open feature wise 
```
DeenIslamBLSDK.shared.goto(feature: .home)
DeenIslamBLSDK.shared.goto(feature: .islamicName)
DeenIslamBLSDK.shared.goto(feature: .tasbeeh)
DeenIslamBLSDK.shared.goto(feature: .dua)
DeenIslamBLSDK.shared.goto(feature: .hadith)
DeenIslamBLSDK.shared.goto(feature: .prayerTime)
DeenIslamBLSDK.shared.goto(feature: .qibla)
DeenIslamBLSDK.shared.goto(feature: .zakat)
DeenIslamBLSDK.shared.goto(feature: .alQuaran)
      
```
sdk open from rcCode 
```
func openFromRC(code: String)

```
check is prayerNotification is enabled or not 
```
func isPrayerNotificationEnabled() -> Bool

```
clear all pending notification
```
func clearAllPrayerNotification()
```

prayer notification enable or disable 
```
func prayerNotification(isEnable: Bool)

```
## NB: 
For xcode 15
```
Target -> Build setting -> ENABLE_USER_SCRIPT_SANDBOXING = false
```
## FAQ 
Rezwan(rezwan.gakk@gmail.com)(+8801717230976)


## Company

[Gakk Media](https://gakkmedia.com)

## License

DeenIslamBLSDK is available under the MIT license. See the LICENSE file for more info
