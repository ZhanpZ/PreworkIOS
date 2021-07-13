//
//  ViewController.swift
//  Prework
//
//  Created by Zhanping Zeng on 7/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let isDark = SavedDataService.getIsDark()
        if isDark == true{
            view.backgroundColor = UIColor.black
            tipAmountLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            viewLabel.textColor = UIColor.white
            totalAmountLabel.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
        }else if isDark == false{
            view.backgroundColor = UIColor.white
            tipAmountLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            viewLabel.textColor = UIColor.black
            totalAmountLabel.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
        }
        
        let defaultBill = SavedDataService.getDefaultBill()
        billAmountTextField.text = String(defaultBill)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
}

