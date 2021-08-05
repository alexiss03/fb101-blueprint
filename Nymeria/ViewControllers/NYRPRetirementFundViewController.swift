//
//  NYRPSavingsFundViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 19/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYRPRetirementFundViewController:
    NYRPBaseViewController {
    
    override func viewDidLoad() {
        
        formId = "NYRPRF"
        formName = "Retirement Planning Retirement Funding"
        
        v = NYRPRetirementFundView.fromNib("NYRPRetirementFundView")
        
        self.scrollView = v?.scrollView
        view = v
        
        v?.inventoriesEducational.dataSource = self
        v?.inventoriesEducational.delegate = self
        v?.futureCostTuitionFees.dataSource = self
        v?.futureCostTuitionFees.delegate = self
        
        pageName = "Retirement Funding"
        
        super.viewDidLoad()
    }
    

    override func addLookUpFields() {
        let MainI39 = NYTextField()
        MainI39.id = "Main.I39"
        MainI39.formula = "2001"
        MainI39.text = "2001"
        MainI39.value = "2001"
        NYParser.shared.willAppendToFields(MainI39)
        
        let Q1 = NYTextField()
        Q1.id = "Q1"
        Q1.formula = "Average"
        Q1.text = "Average"
        Q1.value = "Average"
        NYParser.shared.willAppendToFields(Q1)
        
        
        var vRLookUp = self.getMortalityRateArr()
        
        for index in 4...124 {
            
            let vR = NYTextField()
            vR.id = "v.R\(index)"
            
            if index - 4  <= vRLookUp.count {
                vR.formula = "\(vRLookUp[index-4])"
                vR.text = "\(vRLookUp[index-4])"
                vR.value = "\(vRLookUp[index-4])"
            } else {
                vR.formula = "0"
                vR.text = "0"
                vR.value = "0"
            }
            
            NYParser.shared.willAppendToFields(vR)
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
        
        self.v?.r18Lbl3.id = "R24"
        
        
        self.v?.r19TField1.id = "L38"
        self.v?.r19TField2.id = "R38"
        
        self.v?.r20TField1.id = "L39"
        self.v?.r20TField2.id = "AF41"
        
        
        v?.r17TField1.isUserInteractionEnabled = true
        v?.r13TField2.isUserInteractionEnabled = false
        v?.r17TField1.backgroundColor = UIColor.yellow
        
        v?.r17TField2.id = "P21"
    }
    
    
    override func setUpComputations() {
        //super.setUpComputations()
        
        // Z5
        self.v?.r4TField1.formula = "IF(OR(C9='';L21='');'';IF(OR(Z20='';AB13<O13;AD10='');'';Z20*((1-1/E43^AD10)/E44*E43)))"
        
        // Z6
        self.v?.r5TField1.formula = "IF(OR(L21='';AD10='');'';IF(AND(C9>0;AB13>=O13);L9*(1+J9)^MAX(AB13-O13;0)+R38;''))"
        
        // Z7
        self.v?.r6TField1.formula = "IF(OR(C9='';L21='');'';IF(OR(Z5='';Z6='');'';MAX(Z5-Z6;0)))"
        
        //AC10
        self.v?.r9Lbl4.formula = "IF(OR($Main.I39='';AB13='';$v.Q1='');'';INDEX($v.R4:$v.R124;AB13+1))"
        
        // O13
        self.v?.r10TField3.formula = "IF(C9>0;ROUNDDOWN((TODAY-C9)/365;0);'')"
        
        // AF12
        self.v?.r10Lbl5.formula = "IF(OR(AB13='';$v.W1='');'';'Life Expectancy @ '&TEXT(INDEX($v.R4:$v.R124;AB13+1)+AB13;'0'))"

        // J14
        self.v?.r11Lbl1.formula = "IF(OR(J13='';C9='');'';O13-J13)"
        
        
        // UL14
        self.v?.r11Lbl3.formula = "IF(OR(AB13='';U13='';C9='');'';MAX(U13-O13;0))"
        
        
        // AB14
        self.v?.r11Lbl4.formula = "IF(OR(AB13='';C9='');'';MAX(AB13-O13;0))"
        
        
        //L16
        self.v?.r13TField2.formula = "IF(OR(C9='';L21='');'';IF(OR(J16>AB14;J16=0;Z7='';AB13<=O13);'';Z7/(1+AD8)^MAX(AB13-O13;0)/((1-1/E40^MIN(J16;MAX(AB13-O13;0)))/E41*E40)))"
        
        // R16
        self.v?.r13TField3.formula = "IF(L16='';'';IF(U13=AB13;Z7;IF(OR(U13='';U13>AB13;Z7='';AB13<U13);'';Z7/((1-1/E40^MIN(J16;MAX(AB13-U13;0)))/E41*E40)/(1+AD8)^MAX(AB13-U13;0))))"
        
        
        //V16
        self.v?.r13Lbl3.formula = "IF(R17='';'';'/yr. for '&MIN(J16;AB13-U13)&' year'&IF(OR((AB13-U13)>1;J16<1);'s';''))"

        
        // L17
        self.v?.r14TField2.formula = "IF(L16='';'';(L16/12))"
        
        //V17
        self.v?.r14Lbl3.formula = "IF(R17='';'';'/mo. for '&MIN(J16;AB13-U13)&' year'&IF(OR((AB13-U13)>1;J16<1);'s';''))"
        //"IF(R16='';'';'/mo. for '&MIN(J16;AB13-U13)&' year'&IF(OR(U13>1;J16<1);'s';''))"
        //=IF(R16="","","/mo. for "&MIN(J16,AB13-U13)&" year"&IF(OR(AB13-U13>1,J16<1),"s",""))
        
        // R17
        self.v?.r14TField3.formula = "IF(R16='';'';R16/12)"
        
        
        // L20
        self.v?.r16TField1.formula = "IF(L21='';'';L21*12)"
        
        // L21
        self.v?.r17TField1.formula = "IF(L20='';'';L20/12)"
        
        
        //Z19
        self.v?.r15Lbl2.formula = "'Future Retirement Income Required @'&AB13"
        
        // Z20
        self.v?.r16TField2.formula = "IF(Z21='';'';Z21*12)"
        
        
        // Z21
        self.v?.r17TField3.formula = "IF(OR(C9='';L21='');'';IF(OR(L21=0;AB13<O13);'';L21*(1+P21)^(AB13-O13)))"
        
        // R24
        self.v?.r18Lbl3.formula = "'Value @'&AB13"
        
        
        // L38
        self.v?.r19TField1.formula = "SUM(L25:L37)"
        
        // R38
        self.v?.r19TField2.formula = "SUM(R25:R37)"
        
        
        // L39
        self.v?.r20TField1.formula = "IF(L16='';L9+L38;IF(O13=AB13;Z5;IF(AB13='';'';IF(J16='';(J16*L16+L9+L38);SUM(C40:C79)*L16+L9+L38))))"
        
        // AF39
        self.v?.r20TField2.formula = "IF(Z24='';'';SUM(Z24:Z39)+SUM(AH24:AH39))"
        
        
        v!.r15Lbl2.preloadedVal =  "Future Retirement Income Required @"

    }
    
    
    override func setUpValidations() {
        super.setUpValidations();
        v?.r13TField1.validations = [(.lessThanEqual, v!.r11Lbl4, "Enter number of years to save but not to exceed the number of years until retirement"), (.greaterThanEqual, NSNumber.init(value: 1 as Int32), "Enter number of years to save but not to exceed the number of years until retirement")];
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
                field!.formula = "IF(P\(row+25)='';'';IF(AND(J\(row+25)>0;L\(row+25)>0;C$9>0;AB$13>0);L\(row+25)*(1+P\(row+25))^(AB$13-O$13-J\(row+25)+1);''))"
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

}
