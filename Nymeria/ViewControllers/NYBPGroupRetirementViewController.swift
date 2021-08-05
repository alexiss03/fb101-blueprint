//
//  NYBPGroupRetirementViewController.swift
//  Nymeria
//
//  Created by Mac on 7/5/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYBPGroupRetirementViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource,
    NYBPGroupRetirementViewDelegate {
    
    var v: NYBPGroupRetirementView?
    
    override func viewDidLoad() {
        
        formId = "NYBPGR"
        formName = "Business Planning Group Retirement Planning"
        
        self.v = NYBPGroupRetirementView.fromNib("NYBPGroupRetirementView")
        v?.delegate = self
        
        v?.scrollView.delegate = self
        self.scrollView = v?.scrollView
        
        if NYConstants.IS_IPAD_PRO_1366 {
            v?.scrollView.minimumZoomScale = 1.33
            v?.scrollView.maximumZoomScale = 2.0
            v?.scrollView.zoomScale = 1.33
        } else {
            v?.scrollView.minimumZoomScale = 1.0
            v?.scrollView.maximumZoomScale = 2.0
        }
        
        
        self.setUpMenuItems(v!.navBar, title: "GROUP RETIREMENT")
        self.view = v
        
        v?.Z5.toolbar.options = ["Age to Retire", "Years to Retire"]
        
        v?.employeeSpreadsheetView.delegate = self
        v?.employeeSpreadsheetView.dataSource = self
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: NYSpreadsheetViewDataSource methods
    
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        return 14
    }
    
    
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int {
        return 15
    }
    
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        return false
    }
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        switch  column {
        case 0:
            return 0.04
        case 1:
            return 0.12
        case 2:
            return 0.1
        case 3:
            return 0.1
        case 4:
            return 0.08
        case 5:
            return 0.04
        case 6:
            return 0.04
        case 7:
            return 0.04
        case 8:
            return 0.04
        case 9:
            return 0.08
        case 10:
            return 0.08
        case 11:
            return 0.08
        case 12:
            return 0.08
        case 13:
            return 0.08
        default:
            return 0
        }
    }
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        
        switch column {
        case 0:
            // No
            field!.id = "B\(row+13)"
            field!.inputType = .amount
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            
            switch row {
            case 0:
                field?.formula = "IF(AA4='';'';1)"
            default:
                field?.formula = "IF(AA4='';'';IF(OR(B\(row+12)=AA4;B\(row+12)=0);'';B\(row+12)+1))"
            }
        case 1:
            // Employee Name / ID
            field!.id = "C\(row+13)"
            field!.inputType = .text
            field!.isUserInteractionEnabled = true
            field!.backgroundColor = UIColor.yellow
        case 2:
            // Date of Birth
            field!.id = "J\(row+13)"
            field!.inputType = .date
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = true
            field!.backgroundColor = UIColor.yellow
        case 3:
            // Date Hired
            field!.id = "M\(row+13)"
            field!.inputType = .date
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = true
            field!.backgroundColor = UIColor.yellow
        case 4:
            // Present Basic Monthly Salary
            field!.id = "P\(row+13)"
            field!.inputType = .amount
            field?.inputAlignment = .right
            field?.keyboardType = .numberPad
            field!.isUserInteractionEnabled = true
            field!.backgroundColor = UIColor.yellow
        case 5:
            // Age Today
            field!.id = "S\(row+13)"
            field!.inputType = .year
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(J\(row+13)='';0;ROUNDDOWN((TODAY-J\(row+13))/365;0))"
        case 6:
            // Past Service
            field!.id = "U\(row+13)"
            field!.inputType = .year
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(M\(row+13)='';0;ROUNDDOWN((TODAY-M\(row+13))/365;0))"
        case 7:
            // Future Service
            field!.id = "W\(row+13)"
            field!.inputType = .year
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(OR(B\(row+13)='';M\(row+13)='');0;IF(Z5='Years to Retire';AA5+0;IF(OR(B\(row+13)='';M\(row+13)='';S\(row+13)>AA5);0;AA5-S\(row+13))))"
        case 8:
            // Total Years of Service
            field!.id = "Y\(row+13)"
            field!.inputType = .year
            field?.inputAlignment = .center
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(U\(row+13)='';'';U\(row+13)+W\(row+13))"
        case 9:
            // Final Monthly Salary
            field!.id = "AA\(row+13)"
            field!.inputType = .amount
            field?.inputAlignment = .right
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(P\(row+13)>0;P\(row+13)*(1+AA6)^W\(row+13);0)"
        case 10:
            field!.id = "AD\(row+13)"
            field!.inputType = .amount
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(OR(AT8=0;AM4='');0;AR\(row+13)/(AT8*AM4))"
        case 11:
            field!.id = "AG\(row+13)"
            field!.inputType = .amount
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(AD\(row+13)='';'';AD\(row+13)*(1+AA8)^W\(row+13))"
        case 12:
            field!.id = "AJ\(row+13)"
            field!.inputType = .amount
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(OR(W\(row+13)=0;Z5='';AA5='');0;AS\(row+13)-AG\(row+13))"
        case 13:
            field!.id = "AM\(row+13)"
            field!.inputType = .amount
            field!.isUserInteractionEnabled = false
            field!.backgroundColor = UIColor.clear
            field?.formula = "IF(OR(W\(row+13)=0;AA7='');0;AJ\(row+13)/((1-1/AT6^MIN(W\(row+13);AM5))/(AT7*AT6))/AT4^W\(row+13)/12)"
        default:
            break
        }
        
        return field
    }
    
    override func setUpFieldIds() {
        
        v?.Z5.id = "Z5"
        
        v?.AM2.id = "AM2"
        
        v?.AA4.id = "AA4"
        v?.AA5.id = "AA5"
        v?.AA6.id = "AA6"
        v?.AA7.id = "AA7"
        v?.AA8.id = "AA8"
        
        v?.AM4.id = "AM4"
        v?.AM5.id = "AM5"
        v?.AM6.id = "AM6"
        v?.AM7.id = "AM7"
        v?.AM8.id = "AM8"
        
    }
    
    override func setUpValidations() {
        
        v?.AA4.validations = [(.lessThanEqual, 15 as AnyObject, "Maximum is 15")]
        v?.AA5.validations = [(.lessThanEqual, 100 as AnyObject, "Enter numeric value")]
        v?.AA6.validations = [(.lessThanEqual, 100 as AnyObject, "Invalid Value")]
        v?.AA7.validations = [(.lessThanEqual, 1000 as AnyObject as AnyObject, "Invalid Value")]
        v?.AA8.validations = [(.lessThanEqual, 100 as AnyObject, "Invalid Value")]
        
        v?.AM5.validations = [(.lessThanEqual, 100 as AnyObject, "Invalid Value")]
        v?.AM6.validations = [(.lessThanEqual, 100 as AnyObject, "Invalid Value")]
        
    }
    
    override func setUpComputations() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/Y"
        let convertedDate = dateFormatter.string(from: currentDate)
        
        v?.AM2.text = convertedDate
        v?.AM2.value = convertedDate
        v?.AM2.formula = "TODAY"
        
        v?.AM7.formula = "AM8*12"
        v?.AM8.formula = "IF(B13='';'';SUM(AM13:AM27))"
        
    }
    
    override func setUpHiddenFields() {
        
        let AT4 = NYTextField()
        AT4.id = "AT4"
        AT4.formula = "(1+AA8)+IF(AA8=AM6;0.000000000001;0)"
        NYParser.shared.willAppendToFields(AT4)
        
        let AT6 = NYTextField()
        AT6.id = "AT6"
        AT6.formula = "AT4/(1+AM6)"
        NYParser.shared.willAppendToFields(AT6)
        
        let AT7 = NYTextField()
        AT7.id = "AT7"
        AT7.formula = "AT6-1"
        NYParser.shared.willAppendToFields(AT7)
        
        let AT8 = NYTextField()
        AT8.id = "AT8"
        AT8.formula = "SUM(AR13:AR27)"
        NYParser.shared.willAppendToFields(AT8)
        
        for index in 13...27 {
            
            let AR = NYTextField()
            AR.id = "AR\(index)"
            AR.formula = "IF(W\(index)=0;0;AS\(index)/(1+AA8)^W\(index))"
            NYParser.shared.willAppendToFields(AR)
            
            let AS = NYTextField()
            AS.id = "AS\(index)"
            AS.formula = "IF(AA7='';0;AA\(index)*Y\(index)*AA7)"
            NYParser.shared.willAppendToFields(AS)
            
        }
        
    }
    
}
