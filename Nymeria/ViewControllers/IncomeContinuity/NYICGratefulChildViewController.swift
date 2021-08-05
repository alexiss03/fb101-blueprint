//
//  NYICGratefulChildViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 01/08/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYICGratefulChildViewController: NYICBaseViewController {

    override func viewDidLoad() {
        
        formId = "NYICGC"
        formName = "Income Continuity Grateful Child"
        
        super.viewDidLoad()
        
    }
    
    override func setUpFieldIds() {
        super.setUpFieldIds()
        
        self.v!.B2.text = "PARENT INCOME BLUEPRINT OF:"
        self.v!.AC2.text = "Profile: Grateful Child"
        self.v!.B3.text = "What provision have you started to help your parent/s to enjoy the sunset days of their lives?"
        self.v!.B4.text = "PARENT INCOME CONTINUITY PLANNING…"
        
        self.v!.R4.text = "My Parent's Income Fund Storehouse"
        self.v!.V5.text = "Total Parent Income Fund Needed"
        self.v!.V6.attributedText = NSAttributedString.init(string: "Less: Savings, Liquid Assets & Insurance")
        self.v!.V7.attributedText = NSAttributedString.init(string: "New Parent Income Fund Required")
        self.v!.AF10.text = "Parent's Dependency Period"
        self.v!.N14.text = "Parent's Age:"
        self.v!.O17.text = "Required Savings for  Parent's Income Fund"
        self.v!.Z17.text = "My Parent's Current Expense Objective"
        self.v!.AD18.attributedText = NSAttributedString.init(string: "Monthly Parent Expense \nObjective")
        self.v!.AD19.text = "Less: Other Sources of Income"
        self.v!.AD20.attributedText = NSAttributedString.init(string: "Add'l Monthly Parent Expenses \nRequired")
        self.v!.AD21.attributedText = NSAttributedString.init(string:"Add'l Annual Parent Expenses \nRequired")
        self.v!.C24.text = "Deduct from Total Parent Income Fund Needed"
        self.v!.C33.text = "Add to Total Parent Income Fund Needed"
        
    }

}
