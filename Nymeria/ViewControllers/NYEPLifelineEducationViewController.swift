
//
//  NYEPLifelineEducationViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 09/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYEPLifelineEducationViewController:
    NYRPBaseViewController {

    override func viewDidLoad() {
        
        formId = "NYEPLE"
        formName = "Educational Planning Lifeline Education"
        
        self.v = NYEPLifelineEducationView.fromNib("NYEPLifelineEducationView")
        self.scrollView = self.v?.scrollView
        self.view = self.v
        
        self.v?.inventoriesEducational.dataSource = self
        self.v?.inventoriesEducational.delegate = self
        self.v?.futureCostTuitionFees.dataSource = self
        self.v?.futureCostTuitionFees.delegate = self
        
        pageName = "Lifeline Education"
        
        super.viewDidLoad()
        
    }
    
    
   // MARK: NYSpreadheetFormatTemplateViewDelegate methods
    
    override func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        
        switch spreadSheetView {
            case v!.inventoriesEducational:
                switch  column {
                case 0:
                    return 0.388
                case 1:
                    return 0.1
                case 2:
                    return 0.217
                case 3:
                    return 0.102
                case 4:
                    return 0.193
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
    
    
    override func setUpFieldIds() {
        self.v?.r1TField1.id = "L2"
        
        self.v?.r4TField1.id = "Z5"
        
        self.v?.r5TField1.id = "Z6"
        
        self.v?.r6TField1.id = "Z7"
        
        self.v?.r8TField1.id = "C9"
        self.v?.r8TField2.id = "J9"
        self.v?.r8TField3.id = "L9"
        
        self.v?.r7TField1.id = "AD8"
        
        self.v?.r8TField4.id = "AD9"
        
        self.v?.r9TField1.id = "AD10"
        
        self.v?.r9Lbl4.id = "AC10"
        self.v?.r9Lbl4.text = ""
        
        self.v?.r10TField1.id = "C13"
        self.v?.r10TField2.id = "J13"
        self.v?.r10TField3.id = "O13"
        self.v?.r10TField4.id = "U13"
        self.v?.r10TField5.id = "AB13"
        
        self.v?.r10Lbl5.id = "AF12"
        self.v?.r10Lbl5.text = ""
        
        self.v?.r11Lbl1.id = "J14"
        self.v?.r11Lbl2.id = "O14"
        self.v?.r11Lbl3.id = "U14"
        self.v?.r11Lbl4.id = "AB14"
        
        self.v?.r13TField1.id = "J16"
        self.v?.r13TField2.id = "L16"
        self.v?.r13TField3.id = "R16"
        self.v?.r13Lbl3.id = "V16"
        self.v?.r13Lbl3.text = ""
        
        self.v?.r14TField1.id = "J17"
        self.v?.r14TField2.id = "L17"
        self.v?.r14TField3.id = "R17"
        
        self.v?.r14Lbl3.id = "V7"
        self.v?.r14Lbl3.text = ""
        
        self.v?.r15Lbl2.id = "Z19"
        
        self.v?.r16TField1.id = "L20"
        self.v?.r16TField2.id = "Z20"
        
        self.v?.r17TField1.id = "L21"
        self.v?.r17TField2.id = "X21"
        self.v?.r17TField3.id = "Z21"
        
        //self.v?.r18Lbl3.id = "R24"
        
        
        self.v?.r19TField1.id = "L38"
        self.v?.r19TField2.id = "R38"
        
        self.v?.r20TField1.id = "L39"
        self.v?.r20TField2.id = "AF41"
        
        v?.r17TField2.id = "P21"
        
        v?.r17TField4.id = "K21"
        v?.r8TField1.id = "AH2"
        
        v?.r17TField4.toolbar.options =
            ["Tri-Semestral School:",
             "Two Semestral School:",
             "Four Semestral School:",
             "Five Semestral School:"]
        
        v?.r17TField4.value = "Tri-Semestral School:"
        
        
        v?.r17TField1.isUserInteractionEnabled = true
        v?.r13TField2.isUserInteractionEnabled = false
    }
    
    
    override func setUpComputations() {
        // Z5
        self.v?.r4TField1.formula = "IF(OR(AH2='';L21='');'';IF(OR(Z20='';AB13<O13;AD10='');'';Z20*((1-1/E43^AD10)/E44*E43)))"
        
        // Z6
        self.v?.r5TField1.formula = "IF(OR(L21='';AD10='');'';IF(AND(AH2>0;AB13>=O13);L9*(1+J9)^MAX(AB13-O13;0)+R38;''))"
        
        // Z7
        self.v?.r6TField1.formula = "IF(OR(AH2='';L21='');'';IF(OR(Z5='';Z6='');'';MAX(Z5-Z6;0)))"
        
        // O13
        self.v?.r10TField3.formula = "IF(AH2>0;ROUNDDOWN((TODAY-AH2)/365;0);'')"
        
        
        // UL14
        self.v?.r11Lbl3.formula = "IF(OR(AB13='';U13='';AH2='');'';MAX(U13-O13;0))"
        
        
        // AB14
        self.v?.r11Lbl4.formula = "IF(OR(AB13='';AH2='');'';MAX(AB13-O13;0))"
        
        
        // R16
        self.v?.r13TField3.formula = "IF(L16='';'';IF(U13=AB13;Z7;IF(OR(U13='';U13>AB13;Z7='';AB13<U13);'';Z7/((1-1/E40^MIN(J16;MAX(AB13-U13;0)))/E41*E40)/(1+AD8)^MAX(AB13-U13;0))))"
        
        
        
        //V16
        self.v?.r13Lbl3.formula = "IF(R17='';'';'/yr. for '&MIN(J16;AB13-U13)&' year'&IF(OR((AB13-U13)>1;J16<1);'s';''))"
        
        // L16
        self.v?.r13TField2.formula = "IF(OR(AH2='';L21='');'';IF(OR(J16>AB14;J16=0;Z7='';AB13<=O13);'';Z7/(1+AD8)^MAX(AB13-O13;0)/((1-1/E40^MIN(J16;MAX(AB13-O13;0)))/E41*E40)))"

        //
        
    
        // L17
        self.v?.r14TField2.formula = "IF(L16='';'';L16/12)"
        
        
        //V17
        self.v?.r14Lbl3.formula = "IF(R17='';'';'/mo. for '&MIN(J16;AB13-U13)&' year'&IF(OR((AB13-U13)>1;J16<1);'s';''))"

        
        // R17
        self.v?.r14TField3.formula = "IF(R16='';'';R16/12)"
        
        
        // L20
        self.v?.r16TField1.formula = "(IF(K21='Two Semestral School:';L21*2;IF(K21='Tri-Semestral School:';L21*3;IF(K21='Four Semestral School:';L21*4;IF(K21='Five Semestral School:';L21*5;'')))))"
        
        
        //Z19
        self.v?.r15Lbl2.formula = "'Future Value of Tuition Fee Required @'&AB13"
        
        // Z20
        self.v?.r16TField2.formula = "IF(Z21='';'';(IF(K21='Two Semestral School:';Z21*2;IF(K21='Tri-Semestral School:';Z21*3;IF(K21='Four Semestral School:';Z21*4;IF(K21='Five Semestral School:';Z21*5;''))))))"
        
        
        // Z21
        
        self.v?.r17TField3.formula = "IF(OR(AH2='';L21='');'';IF(OR(L21=0;AB13<O13);'';L21*(1+P21)^(AB13-O13)))"
        
        // R24
        self.v?.r18Lbl3.formula = "'Value @'&AB13"
        
        
        // L38
        self.v?.r19TField1.formula = "SUM(L25:L37)"
        
        // R38
        self.v?.r19TField2.formula = "SUM(R25:R37)"
                
        // L39
        self.v?.r20TField1.formula = "IF(L16='';L9+L38;IF(O13=AB13;Z5;IF(AB13='';'';SUM(C40:C79)*L16+L9+L38)))"

        // AF41
        self.v?.r20TField2.formula = "IF(Z24='';'';SUM(Z24:Z37)+SUM(AH24:AH37)+SUM(AQ24:AQ37)+SUM(AY24:AY37))"
        
        v!.r15Lbl2.preloadedVal =  "Future Value of Tuition Fee Required @"
    }
    
    
    override func setUpHiddenFields() {
        
        // E40
        // (1+AD8)/(1+J17)+IF(AD8=J17;0.000000000001;0)
        let E40 = NYTextField()
        E40.id = "E40"
        E40.formula = "(1+AD8)/(1+J17)+IF(AD8=J17;0.000000000001;0)"
        E40.text = "1.1"
        E40.value = "1.1"
        NYParser.shared.willAppendToFields(E40)
        
        
        // E41
        // E40-1
        let E41 = NYTextField()
        E41.id = "E41"
        E41.formula = "E40-1"
        E41.text = "0.1"
        E41.value = "0.1"
        NYParser.shared.willAppendToFields(E41)
        
        
        // E43
        // (1+AD8)/(1+AD9)+IF(AD8=AD9;0.000000000001;0)
        let E43 = NYTextField()
        E43.id = "E43"
        E43.formula = "(1+AD8)/(1+AD9)+IF(AD8=AD9;0.000000000001;0)"
        E43.text = "1"
        E43.value = "1"
        NYParser.shared.willAppendToFields(E43)
        
        
        // E44
        // E43-1
        let E44 = NYTextField()
        E44.id = "E44"
        E44.formula = "E43-1"
        E44.text = "1"
        E44.value = "1"
        NYParser.shared.willAppendToFields(E44)
        
        
        // C40
        // 1
        let C40 = NYTextField()
        C40.id = "C40"
        C40.formula = "1"
        C40.text = "1"
        C40.value = "1"
        NYParser.shared.willAppendToFields(C40)
        
        
        for index in 41...79 {
            let txtField = NYTextField()
            txtField.id = "C\(index)"
            txtField.formula = "IF(COUNTIF(C40:C\(index-1);'>0')<J16;C\(index-1)*(1+J17);0)"
            txtField.text = "0"
            txtField.value = "0"
            NYParser.shared.willAppendToFields(txtField)
        }
        
    }
    
    
    override func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        
        switch spreadSheetView {
        case v!.inventoriesEducational:
            switch column {
            case 0:
                field!.id = "C\(row+25)"
                field!.inputType = .text
                field!.isUserInteractionEnabled = true
                field!.textAlignment = .left
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                field!.backgroundColor = UIColor.yellow
            case 1:
                field!.id = "J\(row+25)"
                field!.inputType = .year
                field!.textAlignment = .center
                field!.isUserInteractionEnabled = true
                field!.textColor = NYConstants.COLOR_RED
                field!.backgroundColor = UIColor.yellow
            case 2:
                field!.id = "L\(row+25)"
                field!.inputType = .amount
                field!.textAlignment = .center
                field!.isUserInteractionEnabled = true
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                field!.backgroundColor = UIColor.yellow
            case 3:
                field!.id = "P\(row+25)"
                field!.inputType = .percent
                field!.textAlignment = .center
                field!.isUserInteractionEnabled = true
                field!.textColor = NYConstants.COLOR_RED
                field!.backgroundColor = UIColor.yellow
            case 4:
                field!.isUserInteractionEnabled = false
                field!.backgroundColor = UIColor.clear
                field!.inputType = .amount
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                field!.id =  "R\(row+25)"
                field!.formula = "IF(P\(row+25)='';'';IF(AND(J\(row+25)>0;L\(row+25)>0;AH$2>0;AB$13>0);L\(row+25)*(1+P\(row+25))^(AB$13-O$13-J\(row+25)+1);''))"
            default:
                break
            }
        case v!.futureCostTuitionFees:
            switch column {
            case 0:
                field!.id = "X\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_RED
                switch row {
                case 0:
                    field!.formula = "AB13+0"
                default:
                    field!.formula = "X\(row+23)+1"
                }
            case 1:
                field!.id = "Z\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                switch row {
                case 0:
                    field!.formula = "IF(AD10='';'';Z20+0)"
                default:
                    field!.formula = "IF(Z\(row+23)='';'';IF(X\(row+24)>(AB$13+AD$10-1);'';Z\(row+23)*(1+AD$9)))"
                    
                }
            case 2:
                field!.id = "AF\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_RED
                switch row {
                case 0:
                    field!.formula = "X39+1"
                default:
                    field!.formula = "AF\(row+23)+1"
                }
            case 3:
                field!.id = "AH\(row+24)"
                field!.isUserInteractionEnabled = false
                field!.textAlignment = .center
                field!.textColor = NYConstants.COLOR_LIGHT_BLUE
                switch row {
                case 0:
                    //field!.formula = "AF24+0"
                    field!.formula = "IF(Z39='';'';IF(AF24>(AB$13+AD$10-1);'';Z39*(1+AD$9)))"
                default:
                    field!.formula = "IF(AH\(row+23)='';'';IF(AF\(row+24)>(AB$13+AD$10-1);'';AH\(row+23)*(1+AD$9)))"
                    
                }
                
            default:
                break
            }
        default:
            break
        }
        
        return field
    }
    
    
    override func setUpValidations() {
        super.setUpValidations();
        v?.r13TField1.validations = [(.lessThanEqual, v!.r11Lbl4, "Enter number of years to save but not to exceed the number of years until retirement"), (.greaterThanEqual, NSNumber.init(value: 1 as Int32), "Enter number of years to save but not to exceed the number of years until retirement")];
    }
    
}

