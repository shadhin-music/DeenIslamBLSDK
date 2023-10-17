iOS SDK Documentation 
Initialize the SDK
Podfile
pod ‘DeenIslamBLSDK’

[N.B:- Before release please update pod to latest build. Pod version link(https://github.com/shadhin-music/DeenIslamBLSDK). Always use latest version (pod update)]

iOS SDK Sample App
A sample app is provided if more clarification is needed please refer to the link(https://github.com/shadhin-music/DeenIslamBLSDK).

Configure iOS SDK
In AppDelegate class file

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

In Info.plist file
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
<key> Application can be killed immediately when user is shutting down or logging out</key>
<false/>


Project target Signing & Capabilities 
add Background Mood and select 'Audio,Airplay, and picture in picture','Background Processing'
Delegate `DeenIslamSDKNotifier`
This delegate is notifier from sdk 

// error message return if anything wrong 
Func errorMessage(error : String) 
//login token status validation 
Func tokenStatus(token isValid : Bool, error : String) 

//SDK initializer with  Tabbar,navigationBar,delegate,token and isBL number or not
//isBL is optional 
DeenIslamBLSDK.shared.initialize(with: UITabBarController?, nav: UINavigationController, delegate: DeenIslamSDKNotifier, token: String, isBL: Bool) 

//direct open sdk 
func gotoHome()
//sdk open feature wise 
func goto(feature : AppFeature)
//sdk open from rcCode 
func openFromRC(code: String)
//check is prayerNotification is enabled or not 
func isPrayerNotificationEnabled() -> Bool
//clear all pending notification
func clearAllPrayerNotification()

///prayer notification enable or disable 
func prayerNotification(isEnable: Bool)

Add azan file to your main project for prayer notification sound. You can get this file in example project. 

NB: 
For xcode 15
Target -> Build setting -> ENABLE_USER_SCRIPT_SANDBOXING = false

## Author

MD Azizur Rahman, azizur.gakk@gmail.com

## Company

[Gakk Media](https://gakkmedia.com)

## License

DeenIslamBLSDK is available under the MIT license. See the LICENSE file for more info

