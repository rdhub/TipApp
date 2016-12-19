//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Richard Du on 12/18/16.
//  Copyright © 2016 Richard Du. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults  = UserDefaults.standard
        
        if(defaults.value(forKey: "defaultTipIndex") != nil) {
            defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
        }
        
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateDefaultTip(_ sender: AnyObject) {
        
        let defaults  = UserDefaults.standard
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        
        defaults.synchronize()
    }
    
}
