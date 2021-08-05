//
//  NYRPSavingsFundViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 19/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYRPSavingsFundViewController:
    NYRPBaseViewController {

    override func viewDidLoad() {
        
        formId = "NYRPSF"
        formName = "Retirement Planning Savings Funding"
        
        v = NYRPSavingsFundView.fromNib("NYRPSavingsFundView")
        
        self.scrollView = v?.scrollView
        view = v
        
        v?.inventoriesEducational.dataSource = self
        v?.inventoriesEducational.delegate = self
        v?.futureCostTuitionFees.dataSource = self
        v?.futureCostTuitionFees.delegate = self
        
        pageName = "Savings Funding"
 
        super.viewDidLoad()
        
    }
    
    override func addLookUpFields() {
        
        let MainI39 = NYTextField()
        MainI39.id = "Main.I39"
        MainI39.formula = "2001"
        MainI39.text = "2001"
        MainI39.value = "2001"
        NYParser.shared.willAppendToFields(MainI39)
        
        let W1 = NYTextField()
        W1.id = "W1"
        W1.formula = "Average"
        W1.text = "Average"
        W1.value = "Average"
        NYParser.shared.willAppendToFields(W1)
        
        
        var vXLookUp = self.getMortalityRateArr()
        
        for index in 4...124 {
            
            let vX = NYTextField()
            vX.id = "v.X\(index)"

            if index - 4  <= vXLookUp.count {
                vX.formula = "\(vXLookUp[index-4])"
                vX.text = "\(vXLookUp[index-4])"
                vX.value = "\(vXLookUp[index-4])"
            } else {
                vX.formula = "0"
                vX.text = "0"
                vX.value = "0"
            }
            
            NYParser.shared.willAppendToFields(vX)
        }
    }
    
    override func setUpFieldIds() {
        super.setUpFieldIds()
        v!.r15Lbl2.preloadedVal =  "Future Value of Income Required @"
    }
    
    
    override func setUpValidations() {
        super.setUpValidations()
        v?.r13TField1.validations = [(.lessThanEqual, v!.r11Lbl4, "Enter number of years to save but not to exceed the number of years until stop working"), (.greaterThanEqual, NSNumber.init(value: 1 as Int32), "Enter number of years to save but not to exceed the number of years until stop working")];
    }
}
