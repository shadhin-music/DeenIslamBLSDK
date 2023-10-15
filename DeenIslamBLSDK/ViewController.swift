//
//  ViewController.swift
//  DeenIslamExample
//
//  Created by Joy on 20/8/23.
//

import UIKit
import DeenIslamSDK

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //textField.text = "8801954545813"
        textField.text = "8801819841259"
       // textField.text = "8801819841259"
        
    }

    @IBAction func onLoginPressed(_ sender: Any) {
        
        DeenIslamBLSDK.shared.logIn(with: textField.text ?? "" , isBL: true) { result in
            switch result {
            case .success(let success):
                let tab = TabBarVC()
                tab.token = success
                self.navigationController?.pushViewController(tab, animated: true
                )
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

