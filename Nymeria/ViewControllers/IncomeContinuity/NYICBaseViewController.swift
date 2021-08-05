//
//  NYICBaseViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 01/08/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYICBaseViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDelegate,
    NYSpreadsheetViewDataSource  {

    var v: NYICBaseView?
    
    override func viewDidLoad() {
        
        v = NYICFamilyProviderView.fromNib("NYICFamilyProviderView")
        
        self.scrollView = v?.scrollView
        view = v
        
        v?.inventoriesEducational.dataSource = self
        v?.inventoriesEducational.delegate = self
        v?.futureCostTuitionFees.dataSource = self
        v?.futureCostTuitionFees.delegate = self
        
        self.setUpMenuItems(self.v!.navBar, title: self.formName)
        
        super.viewDidLoad()
        
        
        v?.scrollView.delegate = self
        
        if NYConstants.IS_IPAD_PRO_1366 {
            v?.scrollView.minimumZoomScale = 1.33
            v?.scrollView.maximumZoomScale = 2.0
            v?.scrollView.zoomScale = 1.33
        } else {
            v?.scrollView.minimumZoomScale = 1.0
            v?.scrollView.maximumZoomScale = 2.0
        }
        
        self.spreadSheetViews = []
        self.spreadSheetViews?.append(v!.inventoriesEducational)
        self.spreadSheetViews?.append(v!.futureCostTuitionFees)
        
        txtFieldReferenceFieldRecordName = v?.M2
    }
    
    
    // MARK: NYSpreadsheetViewDataSource methods
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            return 2
        case v!.futureCostTuitionFees:
            return 4
        default:
            return 1
        }
        
    }
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            switch  column {
            case 0:
                return 0.755
            case 1:
                return 0.245
            default:
                return 0
            }
        case v!.futureCostTuitionFees:
            switch  column {
            case 0:
                return 0.15
            case 1:
                return 0.35
            case 2:
                return 0.15
            case 3:
                return 0.35
            default:
                return 0
            }
        default:
            return 0
        }
        
    }
    
    
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            return 5
        case v!.futureCostTuitionFees:
            return 15
        default:
            return 1
        }
        
    }
    
    
    func headerForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> String {
        switch spreadSheetView {
        case v!.inventoriesEducational:
            switch column {
            case 0:
                return "Type"
            case 1:
                return "Year"
            case 2:
                return "Amount"
            case 3:
                return "ROI"
            case 4:
                return "Value @ 19"
            default:
                return ""
            }
        case v!.futureCostTuitionFees:
            return "Header"
        default:
            return ""
        }
        
    }
    
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            return false
        case v!.futureCostTuitionFees:
            return false
        default:
            return false
        }
    }
    
    
    override func setUpFieldIds() {
        self.v!.M2.id = "M2"
        self.v!.R5.id = "R5"
        self.v!.R6.id = "R6"
        self.v!.R7.id = "R7"
        self.v!.C9.id = "C9"
        self.v!.J9.id = "J9"
        self.v!.AD8.id = "AD8"
        self.v!.AD9.id = "AD9"
        
        self.v!.AC10.id = "AC10"
        self.v!.AD10.id = "AD10"
        self.v!.C13.id = "C13"
        self.v!.J13.id = "J13"
        self.v!.J14.id = "J14"
        self.v!.O13.id = "O13"
        self.v!.O14.id = "O14"
        self.v!.U13.id = "U13"
        self.v!.U14.id = "U14"
        self.v!.AB13.id = "AB13"
        self.v!.AB14.id = "AB14"
        
        
        self.v!.AK13.id = "AK13"
        self.v!.AK14.id = "AK14"
        
        self.v!.J18.id = "J18"
        self.v!.L18.id = "L18"
        self.v!.L19.id = "L19"
        
        self.v!.R18.id = "R18"
        self.v!.V18.id = "V18"
        self.v!.R20.id = "R20"
        self.v!.V20.id = "V20"
        self.v!.Z18.id = "Z18"
        self.v!.Z19.id = "Z19"
        self.v!.Z20.id = "Z20"
        self.v!.Z21.id = "Z21"
        self.v!.R30.id = "R30"
        self.v!.R34.id = "R34"
        self.v!.R35.id = "R35"
        self.v!.R36.id = "R36"
        self.v!.R37.id = "R37"
        self.v!.R38.id = "R38"
        self.v!.L40.id = "L40"
        self.v!.AF40.id = "AF40"
        
        self.v!.V18.text = ""
        self.v!.V20.text = ""
        self.v!.AC10.text = ""
        
    }
    
    override func setUpComputations() {
        self.v!.Z19.value = "0"
        
        self.v!.R5.formula = "IF(Z18='';'';IF(OR(C9='';AD10='';Z21=0);0;Z21*((1-1/E44^AD10)/E45*E44))+R38)"
        self.v!.R6.formula = "IF(OR(Z18='';C9='');'';J9+R30)"
        self.v!.R7.formula = "IF(OR(Z18='';C9='';AD10='');'';MAX(R5-R6;0))"
        
        self.v!.AC10.formula = "IF(OR(O14='';v.AI1='');'';IF(N14='Parents Age:';INDEX(v.AJ4:v.AJ104;O14+1);IF(N14='Spouse Age:';INDEX(v.AJ4:v.AJ104;O14+1);IF(O14>25;'';IF(O14=25;'';25-O14)))))"
        
        self.v!.J14.formula = "IF(OR(J13='';C9='');'';O13-J13)"
        self.v!.O13.formula = "IF(C9>0;ROUNDDOWN((TODAY-C9)/365;0);'')"
        
        self.v!.U14.formula = "IF(OR(AB13='';U13='';C9='');'';MAX(U13-O13;0))"
        self.v!.AB14.formula = "IF(OR(AB13='';C9='');'';MAX(AB13-O13;0))"
        self.v!.AK13.formula = "IF(OR(O13='';v.AI1='');'';TEXT(INDEX(v.AJ4:v.AJ124;O13+1)+O13;'0'))"
        self.v!.AK14.formula = "IF(OR(AK13='';J9='');'';MAX(AK13-O13;0))"
        
        self.v!.L18.formula = "IF(OR(AD10='';J18='');'';IF(AD8='';R7/J18;IF(Z21=0;'';IF(R7='';'';IF(J18>0;R7/((1-1/(1+AD8)^J18)/AD8*(1+AD8))/(1+AD8)^J18;'')))))"
        self.v!.L19.formula = "IF(L18='';'';L18/12)"
        
        self.v!.R18.formula = "IF(AW18<=0;R7;IF(OR(U13='';AD10='';J18='');'';IF(AD8='';R7/AW18;IF(Z21=0;'';IF(R7='';'';IF(AW18>0;R7/((1-1/(1+AD8)^AW18)/AD8*(1+AD8))/(1+AD8)^AW18;''))))))"
        self.v!.V18.formula = "IF(OR(R19='';U13='');'';'/yr. for '&MIN(J18;AW18)&' yr'&IF(OR((AB13-U13)>1;J18<1);'s.';''))"
        self.v!.R20.formula = "IF(U13='';'';R7+0)"
        self.v!.V20.formula = "IF(U13='';'';'Lump Sum Ben.')"
        
        self.v!.Z20.formula = "IF(Z18='';'';MAX(Z18-Z19;0))"
        self.v!.Z21.formula = "IF(Z18='';'';Z20*12)"
        
        self.v!.R30.formula = "SUM(R25:R29)"
        self.v!.R38.formula = "SUM(R34:R37)"
        
        self.v!.L40.formula = "IF(OR(C9='';R7='');'';J9+R30+IF(J18>0;L18*J18;0))"
        self.v!.AF40.formula = "IF(C9='';'';SUM(Z24:Z38)+SUM(AH24:AH37)+SUM(AQ24:AQ38)+SUM(AY24:AY38))"
        
    }
    
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            switch column {
            case 0:
                field!.id = "C\(row+25)"
                field!.inputType = .text
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
                field!.textColor = UIColor.init(red: 34, green: 68, blue: 180)
            case 1:
                field!.id = "R\(row+25)"
                field!.inputType = .year
                field!.isUserInteractionEnabled = true
                field!.backgroundColor = UIColor.yellow
                field!.textAlignment = .center
                field!.textColor = UIColor.init(red: 34, green: 68, blue: 180)
                field!.inputType = .amount
            default:
                break
            }
        case v!.futureCostTuitionFees:
            switch column {
            case 0:
                field!.id = "X\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.text = "1"
                field!.value = "1"
                field!.formula = "1"
                field!.textColor = NYConstants.COLOR_RED
                field!.textAlignment = .center
                switch row {
                case 0:
                    field!.formula = "O13-O13+1"
                default:
                    field!.formula = "X\(23+row)+1"
                    
                }
            case 1:
                field!.id = "Z\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                switch row {
                case 0:
                    field!.formula = "IF(AND(AD10>0;Z21>0);Z21+0;'')"
                default:
                    field!.formula = "IF(Z\(row+23)='';'';IF(X\(row+24)>AD$10;'';Z\(23+row)*(1+AD$9)))"
                    
                    
                }
            case 2:
                field!.id = "AF\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textColor = NYConstants.COLOR_RED
                field!.textAlignment = .center
                switch row {
                case 0:
                    field!.formula = "X38+1"
                default:
                    field!.formula = "AF\(row+23)+1"
                }
            case 3:
                field!.id = "AH\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                field!.textAlignment = .center
                switch row {
                case 0:
                    field!.formula = "IF(Z38='';'';IF(AF24>AD$10;'';Z38*(1+AD$9)))"
                default:
                    field!.formula = "IF(AH\(row+23)='';'';IF(AF\(row+24)>AD$10;'';AH\(row+23)*(1+AD$9)))"
                }
                
            default:
                break
            }
        default:
            break
        }
        
        return field
    }
    
    
    override func setUpHiddenFields() {
        let AO12 = NYTextField()
        AO12.id = "AO12"
        AO12.formula = "IF(OR(O13='';v.AI1='');'';'Life Expectancy @ '&TEXT(INDEX(v.AJ4:v.AJ124;O13+1)+O13;'0'))"
        AO12.text = ""
        AO12.value = ""
        NYParser.shared.willAppendToFields(AO12)
        
        
        let AO15 = NYTextField()
        AO15.id = "AO15"
        AO15.formula = "IF(OR(C9='';O14='';AT$2='');'';IF(AT$2='Family Provider';'Youngest Dependency Period:';IF(AT$2='Grateful Child';'Parents Dependency Period:';IF(AT$2='Loving Spouse';'Spouse Dependency Period:'))))"
        AO15.text = ""
        AO15.value = ""
        NYParser.shared.willAppendToFields(AO15)
        
        let AT2 = NYTextField()
        AT2.id = "AT2"
        AT2.formula = "Family Provider"
        AT2.text = ""
        AT2.value = ""
        NYParser.shared.willAppendToFields(AT2)
        
        
        let AO2 = NYTextField()
        AO2.id = "AO2"
        AO2.formula = "Family"
        AO2.text = ""
        AO2.value = ""
        NYParser.shared.willAppendToFields(AO2)
        
        let AW18 = NYTextField()
        AW18.id = "AW18"
        AW18.formula = "IF(U13='';'';J18-U14)"
        AW18.text = ""
        AW18.value = ""
        NYParser.shared.willAppendToFields(AW18)
        
        
        let AO3 = NYTextField()
        AO3.id = "AO3"
        AO3.formula = "What provision have you started to guarantee the maintenance of your family's lifestyle?"
        AO3.text = ""
        AO3.value = ""
        NYParser.shared.willAppendToFields(AO3)
        
        let vAI1 = NYTextField()
        vAI1.id = "v.AI1"
        vAI1.formula = "Average"
        vAI1.text = "Average"
        vAI1.value = "Average"
        NYParser.shared.willAppendToFields(vAI1)
        
        
        var vAJLookUp = self.getMortalityRateArr()
        
        for index in 4...124 {
            let vAJ = NYTextField()
            vAJ.id = "v.AJ\(index)"
            
            if index - 4  <= vAJLookUp.count {
                vAJ.formula = "\(vAJLookUp[index-4])"
                vAJ.text = "\(vAJLookUp[index-4])"
                vAJ.value = "\(vAJLookUp[index-4])"
            } else {
                vAJ.formula = "0"
                vAJ.text = "0"
                vAJ.value = "0"
            }
            NYParser.shared.willAppendToFields(vAJ)
        }
        
        
        let AO = NYTextField()
        AO.id = "AO24"
        AO.formula = "AF37+1"
        AO.text = ""
        AO.value = ""
        NYParser.shared.willAppendToFields(AO)
        
        let J19 = NYTextField()
        J19.id = "J19"
        J19.formula = ""
        J19.text = ""
        J19.value = ""
        NYParser.shared.willAppendToFields(J19)
        
        let AW24 = NYTextField()
        AW24.id = "AW24"
        AW24.formula = "A037+1"
        AW24.text = ""
        AW24.value = ""
        NYParser.shared.willAppendToFields(AW24)
        
        for index in 0...17 {
            let AO = NYTextField()
            AO.id = "AO\(index+25)"
            AO.formula = "AO\(index+24)+1"
            AO.text = ""
            AO.value = ""
            NYParser.shared.willAppendToFields(AO)
        }
        
        let AQ24 = NYTextField()
        AQ24.id = "AQ24"
        AQ24.formula = "IF(AH37='';'';IF(AO24>AD$10;'';AH37*(1+AD$9)))"
        AQ24.text = ""
        AQ24.value = ""
        NYParser.shared.willAppendToFields(AQ24)
        
        
        for index in 0...17 {
            let AQ = NYTextField()
            AQ.id = "AQ\(index+25)"
            AQ.formula = "IF(AQ\(24+index)='';'';IF(AO\(index+2)>AD$10;'';A\(index+24)*(1+AD$9)))"
            AQ.text = ""
            AQ.value = ""
            NYParser.shared.willAppendToFields(AQ)
        }
        
        
        let AY24 = NYTextField()
        AY24.id = "AY24"
        AY24.formula = "IF(AQ37='';'';IF(AW24>AD$10;'';AQ37*(1+AD$9)))"
        AY24.text = ""
        AY24.value = ""
        NYParser.shared.willAppendToFields(AY24)
        
        
        for index in 0...17 {
            let AY = NYTextField()
            AY.id = "AY\(index+25)"
            AY.formula = "IF(AY\(index+24)='';'';IF(AW\(index+25)>AD$10;'';AY\(index+24)*(1+AD$9)))"
            AY.text = ""
            AY.value = ""
            NYParser.shared.willAppendToFields(AY)
        }
        
        
        let E41 = NYTextField()
        E41.id = "E41"
        E41.formula = "(1+AD8)/(1+J19)+IF(AD8=J19;0.000000000001;0)"
        E41.text = "1.1"
        E41.value = "1.1"
        NYParser.shared.willAppendToFields(E41)
        
        
        let E42 = NYTextField()
        E42.id = "E41-1"
        E42.formula = ""
        E42.text = "0.1"
        E42.value = "0.1"
        NYParser.shared.willAppendToFields(E42)
        
        
        let E44 = NYTextField()
        E44.id = "E44"
        E44.formula = "(1+AD8)/(1+AD9)+IF(AD8=AD9;0.000000000001;0)"
        E44.text = ""
        E44.value = ""
        NYParser.shared.willAppendToFields(E44)
        
        
        let E45 = NYTextField()
        E45.id = "E45"
        E45.formula = "E44-1"
        E45.text = ""
        E45.value = ""
        NYParser.shared.willAppendToFields(E45)
        
        let C41 = NYTextField()
        C41.id = "C41"
        C41.formula = "1"
        C41.text = "1"
        C41.value = "1"
        NYParser.shared.willAppendToFields(C41)
        
        
        for index in 42...79 {
            let txtField = NYTextField()
            txtField.id = "C\(index)"
            txtField.formula = "IF(COUNTIF(C$41:C\(index-1);'>0')<J$18;C\(index-1)*(1+J$19);'0')"
            txtField.text = "0"
            txtField.value = "0"
            NYParser.shared.willAppendToFields(txtField)
        }
        
    }
    
    
    override func setUpValidations() {
        super.setUpValidations();
        v?.J18.validations = [(.lessThanEqual, NSNumber.init(value: 20 as Int32), "Maximum number of years to save is 20"), (.greaterThanEqual, NSNumber.init(value: 1 as Int32), "Maximum number of years to save is 20")];
    }
    
    override func setUpPresenterDetails() {
        
        if let user = NYUserSession.current.user {
            
            if !NYUserSession.current.hasPendingOpenOfRecord.0 {
                v?.presenterNameLbl.text = user.fullName
                v?.roleLbl.text = user.userTitle
                v?.emailAddressLbl.text = user.emailAddress
                v?.contactNumberLbl.text  = user.contactNo
                v?.datePresentedLbl.text = NYUtility.getStringFromDate(Date())
            }
            
            
            v?.presenterNameLbl.id = "USER_NAME"
            v?.roleLbl.id = "USER_ROLE"
            v?.contactNumberLbl.id = "USER_CONTACT_NUMBER"
            v?.emailAddressLbl.id = "USER_EMAIL"
            v?.datePresentedLbl.id = "USER_DATE_PRESENTED"
            v?.presenterNameLbl.formula = ""
            v?.roleLbl.formula = ""
            v?.contactNumberLbl.formula = ""
            v?.emailAddressLbl.formula = ""
            v?.datePresentedLbl.formula = ""
            
        }
    }

}
