//
//  NYMIPesoDollarInvestmentViewController.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYMIPesoDollarInvestmentViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource,
    NYMIPesoDollarInvestmentViewDelegate {
    
    var v: NYMIPesoDollarInvestmentView?
    
    override func viewDidLoad() {
        
        formId = "NYMIPDI"
        formName = "Miscellaneous Ideas Peso Dollar Investment"
        
        self.v = NYMIPesoDollarInvestmentView.fromNib("NYMIPesoDollarInvestmentView")

        v?.scrollView.delegate = self
        v?.delegate = self
        
        if NYConstants.IS_IPAD_PRO_1366 {
            v?.scrollView.minimumZoomScale = 1.33
            v?.scrollView.maximumZoomScale = 2.0
            v?.scrollView.zoomScale = 1.33
        } else {
            v?.scrollView.minimumZoomScale = 1.0
            v?.scrollView.maximumZoomScale = 2.0
        }
        
        
        self.scrollView = v?.scrollView
        self.setUpMenuItems(v!.navBar, title: "PESO VS DOLLAR INVESTMENT")
        
        self.v?.investmentSpreadSheetView.delegate = self
        self.v?.investmentSpreadSheetView.dataSource = self
        
        v?.B4.toolbar.options = ["DOLLAR", "PESO"]
        
        self.view = v
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: NYSpreadsheetViewDataSource methods
    
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        return 8
    }
    
    
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int {
        return 20
    }
    
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        return false
    }
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        switch  column {
        case 0:
            return 0.05
        case 1:
            return 0.06
        case 2:
            return 0.06
        case 3:
            return 0.17
        case 4:
            return 0.17
        case 5:
            return 0.15
        case 6:
            return 0.17
        case 7:
            return 0.17
        default:
            return 0
        }
    }
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        switch spreadSheetView {
            case self.v!.investmentSpreadSheetView:
                switch column {
                    case 0:
                        field!.id = "B\(row+13)"
                        field!.inputType = .year
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        
                        switch row {
                            case 0:
                                field?.formula = "IF(OR(V4='';V5='';B7='');'';1)"
                            default:
                                field?.formula = "IF(OR(V4='';V5='';B7='');'';IF(OR(B\(row+12)=V5;B\(row+12)=0);'';B\(row+12)+1))"
                        }
                    case 1:
                        field!.id = "D\(row+13)"
                        field!.inputType = .year
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';D\(row+12)+1)"
                    case 2:
                        field!.id = "H\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';H\(row+12)+1)"
                    case 3:
                        field!.id = "J\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        
                        switch row {
                            case 0:
                                 field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';IF(B4='DOLLAR';B5*(1+V6);B5*(1+V7)))"
                            default:
                                field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';IF(B4='DOLLAR';J\(row+12)*(1+V6);J\(row+12)*(1+V7)))"
                        }

                    case 4:
                        field!.id = "P\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        
                        switch row {
                            case 0:
                                field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';IF(B4='DOLLAR';B7*(1+V7);B7*(1+V6)))"
                            default:
                                field?.formula = "IF(OR(B\(row+13)='';B4='';B5='';B6='';V4='';V5='');'';IF(B4='DOLLAR';P\(row+12)*(1+V7);P\(row+12)*(1+V6)))"
                        }
                    case 5:
                        field!.id = "V\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = true
                        field!.backgroundColor = UIColor.yellow
                    case 6:
                        field!.id = "AB\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        field?.formula = "IF(OR(B\(row+13)='';P\(row+13)='';V\(row+13)='');'';IF(B4='DOLLAR';P\(row+13)/V\(row+13);P\(row+13)*V\(row+13)))"
                    case 7:
                        field!.id = "AH\(row+13)"
                        field!.inputType = .amount
                        field?.inputAlignment = .center
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                        field?.formula = "IF(OR(B\(row+13)='';AB\(row+13)='');'';AB\(row+13)-J\(row+13))"
                default:
                    break
            }
        default:
            break
        }
        
        return field
    }
    
    override func setUpFieldIds() {
        
        self.v?.AJ2.id = "AJ2"
        
        self.v?.B4.id = "B4"
        self.v?.B5.id = "B5"
        self.v?.B6.id = "B6"
        self.v?.B7.id = "B7"
        
        self.v?.H7.id = "H7"
        
        self.v?.V4.id = "V4"
        self.v?.V5.id = "V5"
        self.v?.V6.id = "V6"
        self.v?.V7.id = "V7"
        
        self.v?.D12.id = "D12"
        
        self.v?.H12.id = "H12"
        self.v?.J10.id = "J10"
        self.v?.P10.id = "P10"
        self.v?.AB10.id = "AB10"
        
    }
    
    override func setUpValidations() {
        
        v?.V5.validations = [(.lessThanEqual, 1000000 as AnyObject, "Enter Numeric Number")]
        
    }
    
    override func setUpComputations() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/Y"
        let convertedDate = dateFormatter.string(from: currentDate)
        dateFormatter.dateFormat = "Y"
        let convertedYear = dateFormatter.string(from: currentDate)
        
        self.v?.AJ2.text = convertedDate
        self.v?.AJ2.value = convertedDate
        
        self.v?.B7.formula = "IF(OR(B4='';B5='';B6='');'';IF(B4='DOLLAR';B5*B6;B5/B6))"
        self.v?.H7.formula = "IF(B4='DOLLAR';'Peso Equivalent';'Dollar Equivalent')"
        
        self.v?.D12.text = convertedYear
        self.v?.D12.value = convertedYear
        
        self.v?.H12.formula = "IF(V4='';'';ROUNDDOWN((TODAY-V4)/365;0))"
        self.v?.J10.formula = "IF(B4='DOLLAR';'DOLLAR\nCURRENCY\nINVESTMENT';'PESO\nCURRENCY\nINVESTMENT')"
        self.v?.P10.formula = "IF(B4='DOLLAR';'PESO\nCURRENCY\nINVESTMENT';'DOLLAR\nCURRENCY\nINVESTMENT')"
        self.v?.AB10.formula = "IF(B4='DOLLAR';'DOLLAR\nREVERSION\nINVESTMENT';'PESO\nREVERSION\nINVESTMENT')"
        
    }
    
}
