//
//  ViewController.swift
//  TipCalculator
//
//  Created by Richard Du on 12/18/16.
//  Copyright © 2016 Richard Du. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipField: UITextField!
    
    @IBOutlet weak var twoSplit: UILabel!
    @IBOutlet weak var threeSplit: UILabel!
    @IBOutlet weak var fourSplit: UILabel!
    @IBOutlet weak var fiveSplit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults  = UserDefaults.standard
        let formatter = NumberFormatter()
        billField.placeholder = formatter.currencySymbol
        tipField.placeholder = "%"
        if(defaults.value(forKey: "defaultTipIndex") != nil) {
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
        }
        if(tipControl.selectedSegmentIndex == 3) {
            tipField.isUserInteractionEnabled = true
            tipField.backgroundColor = UIColor.white
            if(defaults.value(forKey: "defaultCustomText") != nil) {
                tipField.text = defaults.object(forKey: "defaultCustomText") as! String?
            }
        } else
        {
            tipField.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
            tipField.isUserInteractionEnabled = false
        }
        
        calculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true)
    }

    @IBAction func showCustom(_ sender: AnyObject) {
        if(tipControl.selectedSegmentIndex == 3) {
            
            tipField.isUserInteractionEnabled = true
            tipField.backgroundColor = UIColor.white
            tipField.becomeFirstResponder()
        } else
        {
            
            tipField.isUserInteractionEnabled = false
            tipField.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
            view.endEditing(true)
        }
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let customTip = Double(tipField.text!) ?? 0
        let tipPercentages = [0.18, 0.20, 0.25, customTip/100]
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        tipLabel.text = formatter.string(from: NSNumber.init(value: tip))
        totalLabel.text = formatter.string(from: NSNumber.init(value: total))
        twoSplit.text = formatter.string(from: NSNumber.init(value: total/2))
        threeSplit.text = formatter.string(from: NSNumber.init(value: total/3))
        fourSplit.text = formatter.string(from: NSNumber.init(value: total/4))
        fiveSplit.text = formatter.string(from: NSNumber.init(value: total/5))
    }
}

