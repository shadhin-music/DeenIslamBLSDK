//
//  TabBarVC.swift
//  DeenIslamExample
//
//  Created by Joy on 20/8/23.
//

import UIKit
import DeenIslamSDK


class TabBarVC: UITabBarController {
    
    var token : String?
    
    init(){
        super.init(nibName: "TabBarVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        let aItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let bItem = UITabBarItem(title: "B", image: UIImage(named: "home"), tag: 1)
        let cItem = UITabBarItem(title: "C", image: UIImage(named: "home"), tag: 2)
        
        let a = HomeVC()
        a.token = token
        let aNav = UINavigationController(rootViewController: a)
        aNav.tabBarItem = aItem
        
        let b = A()
        b.tabBarItem = bItem
        
        let c = C()
        let nav = UINavigationController(rootViewController: c)
        nav.isNavigationBarHidden = true
        nav.tabBarItem = cItem
        viewControllers = [aNav,b,nav]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    

}

extension TabBarVC : DeenIslamSDKNotifier{
    func errorMessage(error: String) {
        
    }
    
    func tokenStatus(token isValid: Bool, error: String?) {
        if isValid{
            print("token is valid")
        }else{
            print(error ?? "error")
        }
    }
}
