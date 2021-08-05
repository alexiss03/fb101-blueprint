//
//  NYMIComparativeAnalysisViewController.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYMIComparativeAnalysisViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource,
    NYMIComparativeAnalysisViewDelegate {
    
    var v: NYMIComparativeAnalysisView?
    
    override func viewDidLoad() {
        
        formId = "NYMICA"
        formName = "Miscellaneous Ideas Comparative Analysis"
        
        v = NYMIComparativeAnalysisView.fromNib("NYMIComparativeAnalysisView")
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
        
        self.setUpMenuItems(v!.navBar, title: "INVESTMENT COMPARATIVE ANALYSIS")
        
        v?.investmentSpreadSheetView.dataSource = self
        v?.investmentSpreadSheetView.delegate = self
        
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
        return 21
    }
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        return false
    }
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        switch  column {
            case 0:
                return 0.05
            case 1:
                return 0.07
            case 2:
                return 0.07
            case 3:
                return 0.18
            case 4:
                return 0.18
            case 5:
                return 0.18
            case 6:
                return 0.18
            case 7:
                return 0.09
            default:
                return 0
        }
    }
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        switch column {
            case 0:
                field!.id = "B\(row+12)"
                field!.inputType = .year
                field!.inputAlignment = .center
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(AJ2='';'';0)"
                    default:
                        field!.formula = "IF(AJ2='';'';B\(row+11)+1)"
                }
            case 1:
                field!.id = "D\(row+12)"
                field!.inputType = .year
                field!.inputAlignment = .center
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        let currentDate = Date()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "Y"
                        let convertedDate = dateFormatter.string(from: currentDate)
                        field!.formula = "IF(AJ2='';'';\(convertedDate))"
                    default:
                        field!.formula = "IF(AJ2='';'';D\(row+11)+1)"
                }
            case 2:
                field!.id = "G\(row+12)"
                field!.inputType = .text
                field!.inputAlignment = .center
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(AJ2='';'';ROUNDDOWN((TODAY-AJ2)/365;0))"
                    default:
                        field!.formula = "IF(AJ2='';'';G\(row+11)+1)"
                }
            case 3:
                field!.id = "I\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(B6='';'';B6+0)"
                    default:
                        field!.formula = "IF(B6='';'';I\(row+11)*(1+I10)-(B6*I10*I11))"
                }
            case 4:
                field!.id = "P\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field?.formula = "IF(B6='';'';I\(row+12)-(IF(I\(row+12)>B42;J42+(I\(row+12)-B42)*0.2;IF(I\(row+12)>B41;J41+(I\(row+12)-B41)*0.15;IF(I\(row+12)>B40;J40+(I\(row+12)-B40)*0.11;IF(I\(row+12)>B39;J39+(I\(row+12)-B39)*0.08;J38+(I\(row+12)-B38)*0.05))))))"
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
            
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
            case 5:
                field!.id = "W\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(B6='';'';(B6-B6*W11))"
                    default:
                        field!.formula = "IF(B6='';'';(W\(row+11)-W\(row+11)*AK\(row+11))*(1+W10))"
                }
            case 6:
                field!.id = "AD\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(B6='';'';B6*1.25)"
                    default:
                        field!.formula = "IF(W\(row+12)<(B6*1.25);B6*1.25;W\(row+12)+0)"
                }
            case 7:
                field!.id = "AK\(row+12)"
                field!.inputType = .percent
                field!.inputAlignment = .center
                
                if row%5 == 0 {
                    field?.textColor = NYConstants.COLOR_LIGHT_BLUE
                }
                
                switch row {
                    case 0:
                        field!.formula = "IF(OR(B6='';W11='');'';W11*100)"
                        field!.isUserInteractionEnabled = false
                        field!.backgroundColor = UIColor.clear
                    default:
                        field!.keyboardType = .numberPad
                        field!.isUserInteractionEnabled = true
                        field!.backgroundColor = UIColor.yellow
                }
            default:
                break
            }
        
        return field
    }
    
    override func setUpHiddenFields() {
        
        v?.AJ2.id = "AJ2"
        
        v?.B6.id = "B6"
        v?.I10.id = "I10"
        v?.I11.id = "I11"
        v?.W10.id = "W10"
        v?.W11.id = "W11"
        
        v?.B38.id = "B38"
        
    }
    
    override func setUpComputations() {
        
        v?.B38.text = "200,000"
        v?.B38.value = "200000"
        v?.B38.formula = "200000"
        
        v?.B39.id = "B39"
        v?.B39.text = "500,000"
        v?.B39.value = "500000"
        v?.B39.formula = "500000"
        
        v?.B40.id = "B40"
        v?.B40.text = "2,000,000"
        v?.B40.value = "2000000"
        v?.B40.formula = "2000000"
        
        v?.B41.id = "B41"
        v?.B41.text = "5,000,000"
        v?.B41.value = "5000000"
        v?.B41.formula = "5000000"
        
        v?.B42.id = "B42"
        v?.B42.text = "10,000,000"
        v?.B42.value = "10000000"
        v?.B42.formula = "10000000"
        
        v?.J39.id = "J39"
        v?.J39.text = "15,000"
        v?.J39.value = "15000"
        v?.J39.formula = "15000"
        
        v?.J40.id = "J40"
        v?.J40.text = "135,000"
        v?.J40.value = "135000"
        v?.J40.formula = "135000"
        
        v?.J41.id = "J41"
        v?.J41.text = "465,000"
        v?.J41.value = "465000"
        v?.J41.formula = "465000"
        
        v?.J42.id = "J42"
        v?.J42.text = "1,215,000"
        v?.J42.value = "1215000"
        v?.J42.formula = "1215000"
        
    }
    
    override func setUpPresenterDetails() {
        
        if let user = NYUserSession.current.user {
            
            if !NYUserSession.current.hasPendingOpenOfRecord.0 {
                v?.presenterName.text = user.fullName
                v?.presenterTitle.text = user.userTitle
                v?.presenterEmail.text = user.emailAddress
                v?.presenterContactNo.text  = user.contactNo
                v?.presentationDate.text = NYUtility.getStringFromDate(Date())
            }
            
            v?.presenterName.id = "USER_NAME"
            v?.presenterTitle.id = "USER_TITLE"
            v?.presenterContactNo.id = "USER_CONTACT_NUMBER"
            v?.presenterEmail.id = "USER_EMAIL"
            v?.presentationDate.id = "USER_DATE_PRESENTED"
            v!.presenterName.formula = ""
            v!.presenterTitle.formula = ""
            v!.presenterContactNo.formula = ""
            v!.presenterContactNo.formula = ""
            v!.presentationDate.formula = ""
            
        }
        
    }
    
}
