//
//  NYRPSavingsFundViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 19/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYRPCapitalFundViewController:
    NYRPBaseViewController {
    
    override func viewDidLoad() {
    
        formId = "NYRPCF"
        formName = "Retirement Planning Capital Funding"
        
        v = NYRPCapitalFundView.fromNib("NYRPCapitalFundView")
        
        self.scrollView = v?.scrollView
        view = v
        
        v?.inventoriesEducational.dataSource = self
        v?.inventoriesEducational.delegate = self
        v?.futureCostTuitionFees.dataSource = self
        v?.futureCostTuitionFees.delegate = self
        
        pageName = "Capital Funding"
        
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
        Q1.id = "v.AC1"
        Q1.formula = "Average"
        Q1.text = "Average"
        Q1.value = "Average"
        NYParser.shared.willAppendToFields(Q1)
        
        
        var vACLookUp = self.getMortalityRateArr()
        
        for index in 4...124 {
            let vAC = NYTextField()
            vAC.id = "v.AC\(index)"
            
            if index - 4  <= vACLookUp.count {
                vAC.formula = "\(vACLookUp[index-4])"
                vAC.text = "\(vACLookUp[index-4])"
                vAC.value = "\(vACLookUp[index-4])"
            } else {
                vAC.formula = "0"
                vAC.text = "0"
                vAC.value = "0"
            }
            NYParser.shared.willAppendToFields(vAC)
        }
    
        
        let AD1 = NYTextField()
        AD1.id = "v.AD1"
        AD1.formula = "Average"
        AD1.text = "Average"
        AD1.value = "Average"
        NYParser.shared.willAppendToFields(AD1)
        
        for index in 4...124 {
            let vX = NYTextField()
            vX.id = "v.AD\(index)"
            vX.formula = "22"
            vX.text = "22"
            vX.value = "22"
            NYParser.shared.willAppendToFields(vX)
        }
    }
    
    
    override func setUpFieldIds() {
        super.setUpFieldIds()
        
        v?.r6TField1.isUserInteractionEnabled = true
        v?.r13TField2.isUserInteractionEnabled = true
    }
    
    
    override func setUpComputations() {
        // Z5
        self.v?.r4TField1.formula = "IF(OR(Z6='';Z7='');'';Z6+Z7)"
        
        // Z6
        self.v?.r5TField1.formula = "IF(AB13='';'';IF(AB13=O13;L9+L38;IF(AND(C9>0;AB13>O13);L9*(1+J9)^MAX(AB13-O13;0)+R38;'')))"
        

        // Z7
        //self.v?.r6TField1.formula = "IF(J16='';'';IF(AND(C9>0;AB13>=O13);L16*(1+AD8)^MAX(AB13-O13;0)*((1-1/E40^MAX(J16;1))/E41*E40);''))"
        
        //AC10
        self.v?.r9Lbl4.formula = "IF(OR($Main.I39='';AB13='';$v.AC1'');'';INDEX($v.AD4:$v.AD124;AB13+1))"
        
        // O13
        self.v?.r10TField3.formula = "IF(C9>0;ROUNDDOWN((TODAY-C9)/365;0);'')"
        
        // AF12
        self.v?.r10Lbl5.formula = "IF(OR(AB13='';$v.AC1='');'';'Life Expectancy @ '&TEXT(INDEX($v.AD4:$v.AD124;AB13+1)+AB13;'0'))"
        
        
        // J14
        self.v?.r11Lbl1.formula = "IF(OR(J13='';C9='');'';O13-J13)"
        
        
        // UL14
        self.v?.r11Lbl3.formula = "IF(OR(AB13='';U13='';C9='');'';MAX(U13-O13;0))"
        
        
        // AB14
        self.v?.r11Lbl4.formula = "IF(OR(AB13='';C9='');'';MAX(AB13-O13;0))"
        
        
        // R16
        self.v?.r13TField3.formula = "IF(J16='';'';IF(U13=AB13;Z7;IF(OR(J16='';U13>=AB13;U13<O13;Z7='');'';Z7/((1-1/E40^MIN(J16;MAX(AB13-U13;0)))/E41*E40)/(1+AD8)^MAX(AB13-U13;0))))"
        
        
        //V16
        self.v?.r13Lbl3.formula = "IF(R16='';'';'/yr. for '&MIN(J16;AB13-U13)&' year'&IF(OR((AB13-U13)>1;J16<1);'s';''))"
        
        
        // L17
        self.v?.r14TField2.formula = "IF(L16='';'';(L16/12))"
        
        
        // L16
        self.v?.r13TField2.formula = "IF(OR(C9='';Z21='');'';IF(OR(J16>AB14;J16=0;Z7='';AB13<=O13);'';Z7/(1+AD8)^MAX(AB13-O13;0)/((1-1/E40^MIN(J16;MAX(AB13-O13;0)))/E41*E40)))"
        
        
        //V17
        self.v?.r14Lbl3.formula = "IF(R16='';'';'/mo. for '&MIN(J16;AB13-U13)&' year'&IF(OR(U13>1;J16<1);'s';''))"
        
        // R17
        self.v?.r14TField3.formula = "IF(R16='';'';R16/12)"
        
        // L20
        self.v?.r16TField1.formula = "IF(Z21='';'';IF(AND(X21>0;Z20>0);Z20/(1+X21)^MAX(AB13-O13;0);''))"
        
        // L21
        self.v?.r17TField1.formula = "IF(L20='';'';L20/12)"
        
        
        //Z19
        self.v?.r15Lbl2.formula = "'Future Value of Income @'&AB13"
        
        // Z20
        self.v?.r16TField2.formula = "IF(OR(AD10='';Z5='');'';Z5/((1-1/E43^AD10)/E44*E43))"
        
        
        // Z21
        self.v?.r17TField3.formula = "IF(Z20='';'';Z20/12)"
        
        //R24
        self.v?.r18Lbl3.formula = "'Value @'&AB13"
        
        
        // L37
        self.v?.r19TField1.formula = "SUM(L25:L37)"
        
        // R37
        self.v?.r19TField2.formula = "SUM(R25:R37)"
        
        
        // L39
        self.v?.r20TField1.formula = "IF(L16='';L9+L38;IF(O13=AB13;Z5;IF(AB13='';'';IF(J16='';(J16*L16+L9+L38);SUM(C40:C79)*L16+L9+L38))))"
        
        // AF41
        self.v?.r20TField2.formula = "IF(Z24='';'';SUM(Z24:Z39)+SUM(AH24:AH39))"
        
        v!.r15Lbl2.preloadedVal =  "Future Value of Income @"
    }


    override func setUpValidations() {
        super.setUpValidations();
        v?.r13TField1.validations = [(.lessThanEqual, v!.r11Lbl4, "Enter number of years to save but not to exceed the number of years until retirement"), (.greaterThanEqual, NSNumber.init(value: 1 as Int32), "Enter number of years to save but not to exceed the number of years until retirement")];
    }
}
