//
//  ViewController.swift
//  Tip
//
//  Created by Wichian Ruathaiwat on 9/10/14.
//  Copyright (c) 2014 Wichian Ruathaiwat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var percentSegment: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var divideField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        divideField.text = "1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.10, 0.15, 0.2, 0.25]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentages[percentSegment.selectedSegmentIndex]
        var total = billAmount + tip
        var totaleach = (billAmount + tip) / divideField.text._bridgeToObjectiveC().doubleValue
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachLabel.text = String(format: "$%.2f", totaleach)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

