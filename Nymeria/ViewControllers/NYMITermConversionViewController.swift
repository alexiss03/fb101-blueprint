//
//  NYMITermCoversionViewController.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYMITermConversionViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource,
    NYMITermConversionViewDelegate {
    
    var v: NYMITermConversionView?
    
    override func viewDidLoad() {
        
        formId = "NYMITC"
        formName = "Miscellaneous Ideas Term Conversion"
        
        v = NYMITermConversionView.fromNib("NYMITermConversionView")
        v?.delegate = self
        
        v?.insuranceSpreadsheetView.delegate = self
        v?.insuranceSpreadsheetView.dataSource = self
        
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
        
        self.spreadSheetViews = []
        self.spreadSheetViews?.append((v?.insuranceSpreadsheetView)!)
        self.txtFieldReferenceFieldRecordName = v?.M2
        self.setUpMenuItems(v!.navBar, title: "TERM CONVERSION")
        v?.AJ4.toolbar.options = ["Permanent", "Variable"]
        
        self.view = v
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: NYSpreadsheetViewDataSource methods
    
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        return 9
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
            return 0.05
        case 2:
            return 0.13
        case 3:
            return 0.13
        case 4:
            return 0.12
        case 5:
            return 0.13
        case 6:
            return 0.13
        case 7:
            return 0.13
        case 8:
            return 0.13
        default:
            return 0
        }
    }
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        switch column {
            case 0:
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                field!.id = "B\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .center
                
                switch row {
                    case 0:
                        field?.formula = "IF(AJ2='';'';1)"
                    default:
                        field?.formula = "B\(row+11)+1"
                }
            case 1:
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                field!.id = "D\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .center
                
                switch row {
                case 0:
                    field?.formula = "IF(AJ2='';'';ROUNDDOWN((TODAY-AJ2)/365;0))"
                default:
                    field?.formula = "IF(D\(row+11)='';'';D\(row+11)+1)"
                }
            case 2:
                field!.id = "F\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field?.keyboardType = .numberPad
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
            case 3:
                field!.id = "K\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field?.keyboardType = .numberPad
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
            case 4:
                field!.id = "P\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field?.formula = "IF(OR(F\(row+12)='';K\(row+12)='');'';F\(row+12)-K\(row+12))"
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
            case 5:
                field!.id = "U\(row+12)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row == 0 {
                    field?.formula = "P\(row+12)+0"
                } else {
                    field?.formula = "IF(OR(P\(row+12)='';U\(row+11)='');'';(U\(row+11)+P\(row+12))*(1+X10))"
                }
            case 6:
                field!.id = "Z\(row+12)"
                field!.displayType = .negativeRed
                field!.inputType = .amount
                field!.inputAlignment = .right
                field!.keyboardType = .numberPad
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
            case 7:
                field!.id = "AE\(row+12)"
                field!.inputType = .amount
                field!.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                
                if row == 0 {
                    field?.formula = "IF(Z\(row+12)='';'';Z\(row+12)+0)"
                } else {
                    field?.formula = "IF(OR(Z\(row+12)='';Z\(row+11)='');'';Z\(row+12)-Z\(row+11))"
                }
            case 8:
                field?.id = "AJ\(row+12)"
                field?.inputType = .amount
                field?.inputAlignment = .right
                field?.isUserInteractionEnabled = false
                field?.backgroundColor = UIColor.clear
                field?.formula = "IF(OR(AE\(row+12)='';P\(row+12)='');'';AE\(row+12)-P\(row+12))"
            default:
                break
        }
        
        return field
    }
    
    override func setUpFieldIds() {
        
        v?.M2.id = "M2"
        v?.AJ2.id = "AJ2"
        v?.AJ4.id = "AJ4"
        v?.AJ5.id = "AJ5"
        v?.X10.id = "X10"
        
        v?.AC2.id = "AC2"
        v?.AI4.id = "AI4"
        v?.AI5.id = "AI5"
        
        v?.B6.id = "B6"
        v?.F7.id = "F7"
        v?.Z7.id = "Z7"
        v?.AE7.id = "AE7"
        
        v?.B33.id = "B33"
        v?.C34.id = "C34"
        v?.C35.id = "C35"
        
        v?.C36.id = "C36"
        v?.C37.id = "C37"
        v?.C38.id = "C38"
        v?.C39.id = "C39"
        v?.C40.id = "C40"
        v?.C41.id = "C41"
        v?.C42.id = "C42"
        v?.C43.id = "C43"
        
        v?.B45.id = "B45"
        
    }
    
    override func setUpComputations() {
        
        
        v?.AC2.formula = "IF(AJ2='';'';ROUNDDOWN((TODAY-AJ2)/365;0))"
        
        
        v?.AI4.formula = "IF(AJ4='';'';IF(AJ4='Permanent';'Have you missed the power of a permanent life insurance policy?';'Have you missed the tremendous advantages of the regular variable life policy?'))"
        v?.AI5.formula = "IF(AJ4='';'';'Sum Assured')"
        
        v?.B6.formula = "IF(AJ4='';'';IF(AJ4='Permanent';'The Cost and the Monetary Benefits of Converting Term Insurance into Permanent Life Insurance Plan';'The Cost and the Monetary Benefits of Converting Term Insurance into Regular Variable Life Insurance Plan'))"
        
        v?.F7.formula = "IF(AJ4='Permanent';'Permanent\nLevel Annual\nPremium';'Variable Life\nLevel Annual\nPremium')"
        v?.Z7.formula = "IF(AJ4='Permanent';'Total\nCash\nValue';'Total\nFund\nValue')"
        v?.AE7.formula = "IF(AJ4='Permanent';'Annual\nIncrease\nin Total\nCash Value';'Annual\nIncrease\nin Total\nFund Value')"
        
        v?.B33.formula = "IF(AJ4='';'';IF(AJ4='Permanent';'The Power of a Permanent Plan';'The Tremendous Advantages of Regular Variable Life'))"
        v?.C34.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 1. The cost of a permanent insurance is only on the 1st four years, afterwards its already profit';' 1. Regular variable life policy is a buying term and invest the difference concept'))"
        v?.C35.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 2. Although it is more expensive during the first few years it provides cash values that makes it cheaper in the long run';' 2. You don’t have to open another investment account whenever you have the fund to invest'))"
        
        v?.C36.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 3. Permanent insurance should be the solution for a permanent problem';' 3. It is like having a regular savings account with an investment feature (top-up).'))"
        v?.C37.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 4. In case of premium default, cash value prevent the policy to lapse when failed to pay after the grace period';' 4. Transparency and Accessibility of your investment is available any time'))"
        v?.C38.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 5. Permanent plan has guaranteed cash values and dividends (participating) for future emergencies and contingencies';' 5. Allows you to switch investment options based on your risk appetite and market trend'))"
        v?.C39.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 6. Term insurance premiums are expenses while permanent insurance premiums are forced savings';' 6. Regular variable life policy is taking advantage of investing through cost averaging'))"
        v?.C40.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 7. Permanent insurance is more expensive initially but much more cheaper in the long run';' 7. You avail of the expertise of the companys fund managers - Hassle-free investing.'))"
        v?.C41.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 8. Since premium of a term insurance is increasing, therefore premium difference when buying permanent policy is diminishing';' 8. The fund values prevent the term insurance to lapsed - Premium Holiday'))"
        
        v?.C42.formula = "IF(AJ4='';'';IF(AJ4='Permanent';' 9. You have to invest the premium difference at 9% for you to come up even with the Total Cash Values of a permanent plan';' 9. Fund values are withdrawable and not loanable. Therefore no interest charge.'))"
        v?.C43.formula = "IF(AJ4='';'';IF(AJ4='Permanent';'10. Permanent life insurance policy forces you to save money regularly';'10. You enjoy the flexibility of your investment portfolio at the same time having peace of mind with the protection it provides'))"
        
        v?.B45.formula = "IF(AJ4='';'';IF(AJ4='Permanent';'You buy Permanent Insurance not only in the hope that you are going to die during the period of your term plan but also in the hope that you live long after the term expires';'You buy Term Insurance for the unexpected that you might die soon. You buy Regular Variable Life in the hope that you are going to live long'))"
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
