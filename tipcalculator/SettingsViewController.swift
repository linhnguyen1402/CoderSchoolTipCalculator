//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by linh nguyen on 2/7/17.
//  Copyright © 2017 linh nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let userDefault = UserDefaults.standard
    @IBOutlet weak var tipPercentSettings: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        //Preload setting default
        if let defaultSetting = userDefault.object(forKey: "default_setting") as? Int {
            tipPercentSettings.selectedSegmentIndex = defaultSetting
        }
        
        // Do any additional setup after loading the view.
    }
    /* Understand Lifecycle*/
    //
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    //
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    //
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    //
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Segment change
    @IBAction func tipPercentSettingsValueChange(_ sender: AnyObject) {
        //Save setting default
        userDefault.set(tipPercentSettings.selectedSegmentIndex, forKey: "default_setting")
        userDefault.synchronize()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
