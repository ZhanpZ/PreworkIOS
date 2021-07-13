//
//  SettingsViewController.swift
//  Prework
//
//  Created by Zhanping Zeng on 7/8/21.
//

import UIKit

class SettingsViewController: UIViewController {

    var vc = ViewController()
    
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var darkMode: UISwitch!
    
    @IBOutlet weak var defaultbillLabel: UILabel!
    @IBOutlet weak var defaultbillAmountTextField: UITextField!
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkSwitch(_ sender: Any) {
        if darkMode.isOn == true{
            view.backgroundColor = UIColor.black
            darkLabel.textColor = UIColor.white
            defaultbillLabel.textColor = UIColor.white
            let defaults = UserDefaults.standard
            defaults.set(true, forKey:"myDark")
            defaults.synchronize()
        }else{
            view.backgroundColor = UIColor.white
            darkLabel.textColor = UIColor.black
            defaultbillLabel.textColor = UIColor.black
            let defaults = UserDefaults.standard
            defaults.set(false, forKey:"myDark")
            defaults.synchronize()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let isDark = SavedDataService.getIsDark()
        if isDark == true{
            view.backgroundColor = UIColor.black
            darkLabel.textColor = UIColor.white
            defaultbillLabel.textColor = UIColor.white
            darkMode.isOn = true
        }
        let defaultBill = SavedDataService.getDefaultBill()
        defaultbillAmountTextField.text = String(defaultBill)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let defaultbill = Double(defaultbillAmountTextField.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(defaultbill, forKey: "myBill")
        defaults.synchronize()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
