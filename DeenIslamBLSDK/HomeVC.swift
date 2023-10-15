//
//  HomeVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import DeenIslamSDK

class HomeVC: UIViewController {
    
    init(){
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sessionTimeButton: UIButton!
    
    @IBOutlet weak var sessionTimeTV: UITextField!
    
    private var dataSource : [String] = ["Home","Islamic Name","Tasbeeh","Daily Dua","Hadith","PrayerTime","Qibla", "Zakat","Al Quran"]
    var token : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onKeyboardDone))
        toolbar.setItems([done], animated: true)
        textField.delegate = self
        textField.inputAccessoryView = toolbar
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sessionTimeButton.isEnabled = true
        DeenIslamBLSDK.shared.initialize(with: self.tabBarController, nav: self.navigationController!, delegate: self, token: self.token ?? "", isBL: true)
    }
    @objc func onKeyboardDone(){
        textField.resignFirstResponder()
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 0.2) {
                self.bottomConstraint.constant = keyboardHeight
            }
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.2) {
            
            self.bottomConstraint.constant = 16
        }
    }

   
    @IBAction func onButtonPressed(_ sender: Any) {
        //guard let code = textField.text else {return}
        //ShadhinBL.shared.openPatch(patchID: code, navigationController: self.navigationController!, tabController: self.tabBarController)
    }
    
    @IBAction func onSessionTimeSetPressed(_ sender: Any) {
//        guard let tt = sessionTimeTV.text, let time = Double(tt) else {return}
//        ShadhinBL.shared.setSessionPulesTimer(second: time)
//        sessionTimeButton.isEnabled = false
        
    }
}

extension HomeVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = dataSource[indexPath.row]
            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
            cell.textLabel?.text = dataSource[indexPath.row]
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let type =  FeatureType(rawValue: indexPath.row)!
        switch indexPath.row{
        case 0:
            DeenIslamBLSDK.shared.gotoHome()
        case 1:
            DeenIslamBLSDK.shared.goto(feature: .islamicName)
        case 2:
            DeenIslamBLSDK.shared.goto(feature: .tasbeeh)
        case 3:
            DeenIslamBLSDK.shared.goto(feature: .dua)
        case 4:
            DeenIslamBLSDK.shared.goto(feature: .hadith)
        case 5:
            DeenIslamBLSDK.shared.goto(feature: .prayerTime)
        case 6:
            DeenIslamBLSDK.shared.goto(feature: .qibla)
        case 7:
            DeenIslamBLSDK.shared.goto(feature: .zakat)
        case 8:
            DeenIslamBLSDK.shared.goto(feature: .alQuaran)
        default:
            DeenIslamBLSDK.shared.goto(feature: .home)
        }
        
        
    }
}

extension HomeVC : UITextFieldDelegate{
    
}
extension HomeVC : DeenIslamSDKNotifier{
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
