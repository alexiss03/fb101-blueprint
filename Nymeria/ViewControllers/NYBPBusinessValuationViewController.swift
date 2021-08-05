//
//  NYBPBusinessValuationViewController.swift
//  Nymeria
//
//  Created by Mac on 7/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYBPBusinessValuationViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource,
    NYBPBusinessValuationViewDelegate {
    
    var v: NYBPBusinessValuationView?
    
    override func viewDidLoad() {
        
        formId = "NYBVP"
        formName = "Business Valuation Planning"
        
        v = NYBPBusinessValuationView.fromNib("NYBPBusinessValuationView")
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
        
        self.setUpMenuItems(v!.navBar, title: "BUSINESS VALUATION")
        self.view = v
        
        self.spreadSheetViews = []
        self.txtFieldReferenceFieldRecordName = v?.N2
        
        self.v?.V16.toolbar.options = ["Very Stable", "Average Stability", "Unstable"]
        self.v?.AE46.toolbar.options = ["A", "B", "C", "D", "E"]
        self.v?.T48.toolbar.options = ["Stock Redemption Buy and Sell Agreement", "Cross Purchase Buy and Sell Agreement"]
        
        self.v?.stockOwnerSpreadSheetView.delegate = self
        self.v?.stockOwnerSpreadSheetView.dataSource = self
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: NYSpreadsheetViewDataSource methods
    
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        return 4
    }
    
    
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int {
        return 10
    }
    
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        return false
    }
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        switch  column {
        case 0:
            return 0.42
        case 1:
            return 0.19
        case 2:
            return 0.2
        case 3:
            return 0.19
        default:
            return 0
        }
    }
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        switch spreadSheetView {
        case self.v!.stockOwnerSpreadSheetView:
            switch column {
            case 0:
                field!.id = "J\(row+54)"
                field!.inputType = .text
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
            case 1:
                field!.id = "X\(row+54)"
                field!.inputType = .percent
                field?.inputAlignment = .center
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
            case 2:
                field!.id = "AC54\(row+54)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                field?.formula = "IF(X\(row+54)='';'';AH46*X\(row+54))"
            case 3:
                field!.id = "AH\(row+54)"
                field!.inputType = .amount
                field?.inputAlignment = .right
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                field?.formula = "IF(OR(X\(row+54)='';AH48='';AH48=1);'';IF(T48='Stock Redemption Buy and Sell Agreement';AH46*X\(row+54);IF(T48='Cross Purchase Buy and Sell Agreement';(AH46*X\(row+54))/(AH48-1);0)))"
            default:
                break
            }
        default:
            break
        }
        
        return field
    }
    
    override func setUpFieldIds() {
        
        v?.N2.id = "N2"
        v?.H6.id = "H6"
        v?.AH2.id = "AH2"
        
        v?.N7.id = "N7"
        v?.R7.id = "R7"
        v?.V7.id = "V7"
        v?.Z7.id = "Z7"
        v?.AD7.id = "AD7"
        
        v?.N8.id = "N8"
        v?.N9.id = "N9"
        v?.N10.id = "N10"
        v?.N11.id = "N11"
        v?.N12.id = "N12"
        
        v?.R8.id = "R8"
        v?.R9.id = "R9"
        v?.R10.id = "R10"
        v?.R11.id = "R11"
        v?.R12.id = "R12"
        
        v?.V8.id = "V8"
        v?.V9.id = "V9"
        v?.V10.id = "V10"
        v?.V11.id = "V11"
        v?.V12.id = "V12"
        
        v?.Z8.id = "Z8"
        v?.Z9.id = "Z9"
        v?.Z10.id = "Z10"
        v?.Z11.id = "Z11"
        v?.Z12.id = "Z12"
        
        v?.AD8.id = "AD8"
        v?.AD9.id = "AD9"
        v?.AD10.id = "AD10"
        v?.AD11.id = "AD11"
        v?.AD12.id = "AD12"
        
        v?.AH8.id = "AH8"
        v?.AH9.id = "AH9"
        v?.AH10.id = "AH10"
        v?.AH11.id = "AH11"
        v?.AH12.id = "AH12"
        
        v?.AH14.id = "AH14"
        v?.V16.id = "V16"
        v?.AE46.id = "AE46"
        
        v?.AB19.id = "AB19"
        v?.AB20.id = "AB20"
        v?.AB24.id = "AB24"
        v?.AB28.id = "AB28"
        v?.AB29.id = "AB29"
        v?.AB30.id = "AB30"
        v?.AB31.id = "AB31"
        v?.AB32.id = "AB32"
        v?.AB33.id = "AB33"
        v?.AB34.id = "AB34"
        
        v?.AB41.id = "AB41"
        v?.AB42.id = "AB42"
        
        v?.AH21.id = "AH21"
        v?.AH25.id = "AH25"
        v?.AH36.id = "AH36"
        v?.AH38.id = "AH38"
        v?.AH43.id = "AH43"
        v?.AH46.id = "AH46"
        v?.AH48.id = "AH48"
        
        v?.AH50.id = "AH50"
        v?.T48.id = "T48"
        v?.J53.id = "J53"
        v?.AG50.id = "AG50"
        
    }
    
    override func setUpValidations() {
        
        v?.H6.validations = [(.lessThanEqual, 5 as AnyObject, "Maximum 5 years")]
        v?.AH48.validations = [(.lessThanEqual, 10 as AnyObject, "Maximum 10")]
        
    }
    
    override func setUpComputations() {
        
        // Table Headers
        v?.N7.formula = "IF(H6<5;'';IF(AH2='';'';R7-1))"
        v?.R7.formula = "IF(H6<4;'';IF(AH2='';'';V7-1))"
        v?.V7.formula = "IF(H6<3;'';IF(AH2='';'';Z7-1))"
        v?.Z7.formula = "IF(H6<2;'';IF(AH2='';'';AD7-1))"
//        v?.AD7.formula = "IF(OR(H6='';AH2='');'';AH2-365)"
        v?.AD7.formula = "IF(OR(H6='';AH2='');'';2016)"
        
        v?.N12.formula = "IF(N7='';'';N10-N11)"
        v?.R12.formula = "IF(R7='';'';R10-R11)"
        v?.V12.formula = "IF(V7='';'';V10-V11)"
        v?.Z12.formula = "IF(Z7='';'';Z10-Z11)"
        v?.AD12.formula = "IF(AD7='';'';AD10-AD11)"
        
        v?.AH8.formula = "IF(H6='';0;IF(H6=1;AD8/H6;IF(H6=2;(Z8+AD8)/H6;IF(H6=3;(V8+Z8+AD8)/H6;IF(H6=4;(N8+R8+V8+Z8+AD8)/H6;IF(H6=5;(N8+R8+V8+Z8+AD8)/H6;0))))))"
        v?.AH9.formula = "IF(H6='';0;IF(H6=1;AD9/H6;IF(H6=2;(Z9+AD9)/H6;IF(H6=3;(V9+Z9+AD9)/H6;IF(H6=4;(N9+R9+V9+Z9+AD9)/H6;IF(H6=5;(N9+R9+V9+Z9+AD9)/H6;0))))))"
        v?.AH10.formula = "IF(H6='';0;IF(H6=1;AD10/H6;IF(H6=2;(Z10+AD10)/H6;IF(H6=3;(V10+Z10+AD10)/H6;IF(H6=4;(N10+R10+V10+Z10+AD10)/H6;IF(H6=5;(N10+R10+V10+Z10+AD10)/H6;0))))))"
        v?.AH11.formula = "IF(H6='';0;IF(H6=1;AD11/H6;IF(H6=2;(Z11+AD11)/H6;IF(H6=3;(V11+Z11+AD11)/H6;IF(H6=4;(N11+R11+V11+Z11+AD11)/H6;IF(H6=5;(N11+R11+V11+Z11+AD11)/H6;0))))))"
        v?.AH12.formula = "IF(OR(AH2='';H6='');0;IF(H6=1;(AD12/H6);IF(H6=2;(Z12+AD12)/H6;IF(H6=3;(V12+Z12+AD12)/H6;IF(H6=4;(N12+R12+V12+Z12+AD12)/H6;IF(H6=5;(N12+R12+V12+Z12+AD12)/H6;0))))))"
        
        v?.AB19.formula = "AH8*1"
        v?.AB20.formula = "AH14*1"
        v?.AB24.formula = "AH12*1"
        v?.AB28.formula = "AH12*1"
        v?.AB29.formula = "AH9*1"
        v?.AB30.formula = "AB28-AB29"
        v?.AB31.formula = "IF(AH21='';0;AH21*1)"
        v?.AB32.formula = "AB31*AO16"
        v?.AB33.formula = "AB30-AB32"
        v?.AB34.formula = "AB33/AO15"
        
        v?.AH21.formula = "IF(OR(AH2='';H6='');0;AB19-AB20)"
        v?.AH25.formula = "IF(OR(AH2='';H6='');0;AB24/AO15)"
        v?.AH36.formula = "IF(OR(AH2='';H6='');0;AH21+AB34)"
        v?.AH38.formula = "IF(OR(AH2='';H6='');0;(AH21+AH25+AH36)/3)"
        v?.AH43.formula = "IF(OR(AH2='';H6='');0;SUM(AB41:AB42)/2)"
        v?.AH46.formula = "IF(AE46='';0;IF(AE46='A';AH21+0;IF(AE46='B';AH25+0;IF(AE46='C';AH36+0;IF(AE46='D';AH38+0;IF(AE46='E';AH43*0;10000))))))"
        
        v?.AH50.formula = "IF(AH48<1;0;IF(T48='Stock Redemption Buy and Sell Agreement';AH48+0;IF(T48='Cross Purchase Buy and Sell Agreement';(AH48-1)*AH48;0)))"
        v?.AG50.formula = "IF(T48='Cross Purchase Buy and Sell Agreement';'Number of policies ( '&(IF(AH48<2;0;AH48-1))&' '&(IF(AH48>2;'policies';'policy'))&' for every party involved )';'Number of policies ( 1 policy for every stockholder involved)')"
        v?.J53.formula = "''&T48"
        
    }
    
    override func setUpHiddenFields() {
        
        let AO15 = NYTextField()
        AO15.id = "AO15"
        AO15.formula = "IF(V16='Very Stable';0.1;IF(V16='Average Stability';0.15;IF(V16='Unstable';0.2;0.1)))"
        NYParser.shared.willAppendToFields(AO15)
        
        let AO16 = NYTextField()
        AO16.id = "AO16"
        AO16.formula = "IF(V16='Very Stable';0.08;IF(V16='Average Stability';0.1;IF(V16='Unstable';0.12;0.08)))"
        NYParser.shared.willAppendToFields(AO16)
        
        let AO53 = NYTextField()
        AO53.id = "AO53"
        AO53.formula = "SUM(X54:X63)"
        NYParser.shared.willAppendToFields(AO53)
        
        let AQ15 = NYTextField()
        AQ15.id = "AQ15"
        AQ15.formula = "'Assumed capitalized value rate of business based on stability of the business:' &AO15"
        NYParser.shared.willAppendToFields(AQ15)
        
        let AQ16 = NYTextField()
        AQ16.id = "AQ16"
        AQ16.formula = "'Assumed fair return on net tangible assets based on stability of the business:' &AO16"
        NYParser.shared.willAppendToFields(AQ16)
        
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
