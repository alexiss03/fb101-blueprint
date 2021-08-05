//
//  NYICLovingSpouseViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 31/07/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYICLovingSpouseViewController: NYICBaseViewController {

    override func viewDidLoad() {
        
        formId = "NYICLS"
        formName = "Income Continuity Loving Spouse"
        
        super.viewDidLoad()
    
    }
    
    override func setUpFieldIds() {
        super.setUpFieldIds()
        
        self.v!.B2.text = "SPOUSE INCOME BLUEPRINT OF:"
        self.v!.AC2.text = "Profile: Loving Spouse"
        self.v!.B3.text = "What provision have you started to prevent your widow from begging from her children for support?"
        self.v!.B4.text = "SPOUSE INCOME CONTINUITY PLANNING…"
        

        self.v!.R4.text = "My Spouse' Income Fund Storehouse"
        self.v!.V5.text = "Total Spouse Income Fund Needed"
        self.v!.V6.attributedText = NSAttributedString.init(string: "Less: Savings, Liquid Assets &\nInsurance")
        self.v!.V7.attributedText = NSAttributedString.init(string: "New Spouse Income Fund \nRequired")
        self.v!.AF10.text = "Spouse' Dependency Period"
        self.v!.N14.text = "Spouse' Age:"
        self.v!.O17.text = "Required Savings for Spouse' Income Fund"
        self.v!.Z17.text = "My Spouse' Current Expense Objective"
        self.v!.AD18.attributedText = NSAttributedString.init(string: "Monthly Surviving Spouse Expense\nObjective")
        self.v!.AD19.text = "Less: Other Sources of Income"
        self.v!.AD20.attributedText = NSAttributedString.init(string: "Add'l Monthly Spouse Expen\nRequired")
        self.v!.AD21.attributedText = NSAttributedString.init(string:"Add'l Annual Spouse Expenses\nRequired")
        self.v!.C24.text = "Deduct from Total Spouse Income Fund Needed"
        self.v!.C33.text = "Add to Total Spouse Income Fund Needed"
        
    }

}
