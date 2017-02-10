//
//  ViewController.swift
//  tipcalculator
//
//  Created by linh nguyen on 2/7/17.
//  Copyright © 2017 linh nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let userDefault = UserDefaults.standard
    
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var bilField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Preload setting default
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        setTipDefaut()
        calculateTipValue()
    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTipValue()
    }
    
    func calculateTipValue(){
        //init data
        let tipPercents = [0.18, 0.2, 0.25]
        let bill = Double(bilField.text!) ?? 0
        let tip = bill * tipPercents[tipPercentControl.selectedSegmentIndex]
        let total = tip + bill
        
        //binding data
        tipField.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)
        
        //Save setting default
        userDefault.set(tipPercentControl.selectedSegmentIndex, forKey: "default_setting")
        userDefault.synchronize()
    }
    
    func setTipDefaut() {
        if let defaultSetting = userDefault.object(forKey: "default_setting") as? Int{
            self.tipPercentControl.selectedSegmentIndex = defaultSetting
        }
    }
}

