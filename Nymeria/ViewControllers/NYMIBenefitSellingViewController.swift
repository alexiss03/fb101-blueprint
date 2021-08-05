//
//  NYMIBenefitSellingViewController.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYMIBenefitSellingViewController: NYBaseSpreadsheetViewController, NYMIBenefitSellingViewDelegate {

    var v: NYMIBenefitSellingView?
    
    override func viewDidLoad() {
        
        formId = "NYMIBS"
        formName = "Miscellaneous Ideas Benefit Selling"
        
        v = NYMIBenefitSellingView.fromNib("NYMIBenefitSellingView")
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
        
        self.spreadSheetViews = []
        self.txtFieldReferenceFieldRecordName = v?.U2
        self.setUpMenuItems(v!.navBar, title: "BENEFIT SELLING")
        v?.U4.toolbar.options = ["Family Income", "Spouse Income", "Parent Income"]
        
        self.view = v
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func setUpFieldIds() {
        
        v?.B4.id = "B4"
        v?.B5.id = "B5"
        v?.B6.id = "B6"
        v?.B7.id = "B7"
        
        v?.U2.id = "U2"
        v?.U4.id = "U4"
        v?.U5.id = "U5"
        v?.U6.id = "U6"
        v?.U7.id = "U7"
        
        v?.AL2.id = "AL2"
        
        v?.Z6.id = "Z6"
        v?.Z7.id = "Z7"
        
        v?.B11.id = "B11"
        v?.B12.id = "B12"
        v?.B13.id = "B13"
        v?.B14.id = "B14"
        v?.B15.id = "B15"
        
        v?.B16.id = "B16"
        v?.B17.id = "B17"
        v?.B18.id = "B18"
        v?.B19.id = "B19"
        v?.B20.id = "B20"
        
        v?.G13.id = "G13"
        v?.G14.id = "G14"
        v?.G15.id = "G15"
        v?.G16.id = "G16"
        
        v?.U11.id = "U11"
        v?.U12.id = "U12"
        v?.U13.id = "U13"
        v?.U14.id = "U14"
        v?.U15.id = "U15"
        
        v?.U16.id = "U16"
        v?.U17.id = "U17"
        v?.U18.id = "U18"
        v?.U19.id = "U19"
        v?.U20.id = "U20"
        
        v?.Z11.id = "Z11"
        v?.Z15.id = "Z15"
        v?.Z17.id = "Z17"
        v?.Z19.id = "Z19"
        
        v?.B24.id = "B24"
        v?.B25.id = "B25"
        v?.B26.id = "B26"
        v?.B27.id = "B27"
        v?.B28.id = "B28"
        v?.B29.id = "B29"
        
        v?.B30.id = "B30"
        v?.B31.id = "B31"
        v?.B32.id = "B32"
        v?.B33.id = "B33"
        v?.B34.id = "B34"
        v?.B35.id = "B35"
        v?.B36.id = "B36"
        
        v?.G24.id = "G24"
        v?.G25.id = "G25"
        v?.G26.id = "G26"
        v?.G27.id = "G27"
        v?.G31.id = "G31"
        v?.G33.id = "G33"
        v?.G35.id = "G35"
        
        v?.U24.id = "U24"
        v?.U25.id = "U25"
        v?.U26.id = "U26"
        v?.U27.id = "U27"
        v?.U28.id = "U28"
        v?.U29.id = "U29"
        v?.U30.id = "U30"
        v?.U31.id = "U31"
        v?.U32.id = "U32"
        v?.U33.id = "U33"
        v?.U34.id = "U34"
        v?.U35.id = "U35"
        v?.U36.id = "U36"
        v?.U37.id = "U37"
        v?.U38.id = "U38"
        
        v?.Z24.id = "Z24"
        v?.Z26.id = "Z26"
        v?.Z27.id = "Z27"
        v?.Z28.id = "Z28"
        v?.Z32.id = "Z32"
        v?.Z34.id = "Z34"
        v?.Z37.id = "Z37"
        
        v?.AP5.id = "AP5"
        
    }
    
    override func setUpValidations() {
        
        v?.U6.validations = [(.greaterThanEqual, (v?.AL2)!, "Should be greater than age today not to exceed age 100"), (.lessThanEqual, 100 as AnyObject, "Should be greater than age today not to exceed age 100")]
        v?.B24.validations = [(.lessThanEqual, (v?.AP5)!, "Enter number of years between Retirement Age and Age Today")]
        v?.U24.validations = [(.lessThanEqual, (v?.AP5)!, "Enter number of years between Retirement Age and Age Today")]
        
    }
    
    override func setUpComputations() {
        
        v?.AL2.formula = "IF(U5='';'';ROUNDDOWN((TODAY-U5)/365;0))"
        v?.Z6.formula = "IF(U4='';'';'Age to Retire, '&AP5&' year'&IF(AP5>1;'s from now';' from now'))"
        v?.Z7.formula = "IF(U4='';'';IF(U4='Family Income';'Age of Youngest';IF(U4='Spouse Income';'Age of Spouse';IF(U4='Parent Income';'Age of Parent';''))))"
        
        v?.B13.formula = "IF(OR(B12='';U4='';B11='');'';B11*B12)"
        v?.B14.formula = "IF(OR(B12='';U4='';B11='');'';B13/12)"
        v?.B15.formula = "IF(OR(B12='';B11='');'';IF(OR(U7='';U4='');'';IF(U4='Parent Income';INDEX($v.AJ4:AJ104;U7+1);IF(U4='Spouse Income';INDEX($v.AJ4:AJ104;U7+1);IF(U7>25;'';IF(U7<26;25-U7;''))))))"
//        v?.B15.formula = "IF(OR(B12='';B11='');'';IF(OR(U7='';U4='';$v.AI1='');'';IF(U4='Parent Income';INDEX($v.AJ4:AJ104;U7+1);IF(U4='Spouse Income';INDEX($v.AJ4:AJ104;U7+1);IF(U7>25;'';IF(U7<>25;25-U7;''))))))"
        
        v?.B16.formula = "IF(OR(B15='';B11='');'';B13*B15)"
        v?.B17.formula = "IF(OR(B15='';B11='');'';B11+0)"
        v?.B18.formula = "IF(OR(B15='';B11='');'';SUM(B16:B17))"
        v?.B19.formula = "IF(OR(B7='';B11='';B15='');'';B7+0)"
        v?.B20.formula = "IF(OR(B19='';B15='';B11='');'';B18-B19)"
        
        v?.G13.formula = "IF(U4='Family Income';' Family Income per year';IF(U4='Spouse Income';' Spouse Income per year';IF(U4='Parent Income';' Parent Income per year';'')))"
        v?.G14.formula = "IF(U4='Family Income';' Family Income per month';IF(U4='Spouse Income';' Spouse Income per month';IF(U4='Parent Income';' Parent Income per month';'')))"
        v?.G15.formula = "IF(U4='Family Income';' Youngest Dependency Period';IF(U4='Spouse Income';' Spouse Life Expectancy Years';IF(U4='Parent Income';' Parents Life Expectancy Years';'')))"
        v?.G16.formula = "IF(U4='Family Income';' Total Potential Family Income';IF(U4='Spouse Income';' Total Potential Spouse Income';IF(U4='Parent Income';' Total Potential Parent Income';'')))"
        
        v?.U13.formula = "IF(OR(U11='';U12='';U4='');'';U11*U12)"
        v?.U14.formula = "IF(OR(U11='';U12='';U4='');'';U13/12)"
        v?.U15.formula = "IF(U12='';'';AP15-U6)"
        v?.U16.formula = "IF(OR(U4='';U6='';U13='';U15='');'';U13*U15)"
        v?.U17.formula = "IF(OR(U4='';U6='';U11='';U12='');'';U11+0)"
        v?.U18.formula = "IF(OR(U4='';U6='';U16='';U17='');'';SUM(U16:U17))"
        v?.U19.formula = "IF(OR(U4='';U5='';U6='';B7='';U11='';U12='');'';IF(AP5<1;'';B7*AP5))"
        v?.U20.formula = "IF(U19='';'';U18-U19)"
        
        v?.Z11.formula = "IF(U4='';'';' Projected Fund Value @'&U6)"
        v?.Z15.formula = "IF(U6='';'';' Life Expectancy When You Retire is @'&TEXT(INDEX(v.R4:v.R124;U6+1)+U6;'0'))"
        v?.Z17.formula = "IF(U4='';'';' Plus: Fund Value @'&U6)"
        v?.Z19.formula = "IF(U4='';'';' Less: Total Investment for '&AP5&' year'&IF(AP5>1;'s';''))"
        
        v?.B29.formula = "IF(OR(U4='';B25='';B26='';B27='';B28='';B24='');'';B27*B28)"
        v?.B30.formula = "IF(OR(B25='';B26='';B27='';B28='';U4='';B24='');'';B29/12)"
        v?.B31.formula = "IF(B28='';'';AP36-U6)"
        v?.B32.formula = "IF(OR(U4='';U6='';B29='';B31='');'';B29*B31)"
        v?.B33.formula = "IF(OR(U4='';U6='';B25='';B26='';B27='';B24='';B28='');'';B27+0)"
        v?.B34.formula = "IF(OR(B32='';B33='');'';SUM(B32:B33))"
        v?.B35.formula = "IF(OR(B7='';B24='';B33='');'';B7*B24)"
        v?.B36.formula = "IF(OR(B35='';B24='');'';B34-B35)"
        
        v?.G24.formula = "IF(U4='';'';' Year'&IF(B24>1;'s Invested Premium Holiday';' Invested Premium Holiday'))"
        v?.G25.formula = "IF(U4='';'';' Insurance Benefit Starting on the '&AP25&'th yr.')"
        v?.G26.formula = "IF(U4='';'';' Projected Insurance Benefit @'&U6)"
        v?.G27.formula = "IF(U4='';'';' Projected Fund Value @'&U6)"
        v?.G31.formula = "IF(AP35='';'';' Life Expectancy When You Retire is @'&TEXT(INDEX(v.R4:v.R124;AP26+1)+AP26;'0'))"
        v?.G33.formula = "IF(U4='';'';' Plus: Fund Value @'&U6)"
        v?.G35.formula = "IF(U4='';'';' Less: Total Investment for '&B24&' year'&IF(B24>1;'s';''))"
        
        v?.U30.formula = "IF(OR(U4='';U26='';U27='';U25='';U29='';U24='');'';U28*U29)"
        v?.U31.formula = "IF(OR(U26='';U27='';U25='';U29='';U4='';U24='');'';U30/12)"
        v?.U32.formula = "IF(U29='';'';AP36-U6)"
        v?.U33.formula = "IF(OR(U4='';U6='';U30='';U32='');'';U30*U32)"
        v?.U34.formula = "U28+0"
        v?.U35.formula = "IF(OR(U4='';U5='';U6='';U26='';U27='';U25='';U24='';U29='');'';U25+0)"
        v?.U36.formula = "IF(OR(U33='';U35='');'';SUM(U33:U35))"
        v?.U37.formula = "IF(OR(B7='';U24='';U35='');'';B7*U24)"
        v?.U38.formula = "IF(OR(U37='';U24='');'';U36-U37)"
        
        v?.Z24.formula = "IF(U4='';'';' Year'&IF(U24>1;'s Diagnosed of Critical Illness';' Diagnosed of Critical Illness'))"
        v?.Z26.formula = "IF(U4='';'';' Insurance Benefit Starting on the '&AP33&'th year.')"
        v?.Z27.formula = "IF(U4='';'';' Projected Insurance Benefit @'&U6)"
        v?.Z28.formula = "IF(U4='';'';' Projected Fund Value @'&U6)"
        v?.Z32.formula = "IF(U6='';'';' Life Expectancy @'&TEXT(INDEX(v.R4:v.R124;U6+1)+U6;'0'))"
        v?.Z34.formula = "IF(U4='';'';' Plus: Fund Value @'&U6)"
        v?.Z37.formula = "IF(U4='';'';' Less: Total Investment for '&U24&' year'&IF(U24>1;'s';''))"
        
        v?.AP5.formula = "IF(OR(U5='';U6='');'';U6-AL2)"
        
    }
    
    override func setUpHiddenFields() {
        
        let AP15 = NYTextField()
        AP15.id = "AP15"
        AP15.formula = "IF(AP35='';'';TEXT(INDEX(v.R4:v.R124;U6+1)+U6;'0'))"
        NYParser.shared.willAppendToFields(AP15)
        
        let AP25 = NYTextField()
        AP25.id = "AP25"
        AP25.formula = "IF(B24='';'';B24+1)"
        NYParser.shared.willAppendToFields(AP25)
        
        let AP26 = NYTextField()
        AP26.id = "AP26"
        AP26.formula = "IF(AL2='';'';IF((AL2+B24)>100;'';AL2+B24))"
        NYParser.shared.willAppendToFields(AP26)
        
        let AP27 = NYTextField()
        AP27.id = "AP27"
        AP27.formula = "IF(AP35='';'';TEXT(INDEX(v.R4:v.R124;AP26+1)+AP26;'0'))"
        NYParser.shared.willAppendToFields(AP27)
        
        let AP33 = NYTextField()
        AP33.id = "AP33"
        AP33.formula = "IF(U24='';'';U24+1)"
        NYParser.shared.willAppendToFields(AP33)
        
        let AP35 = NYTextField()
        AP35.id = "AP35"
        AP35.formula = "IF(AL2='';'';IF((AL2+U24)>100;'';AL2+U24))"
        NYParser.shared.willAppendToFields(AP35)
        
        let AP36 = NYTextField()
        AP36.id = "AP36"
        AP36.formula = "IF(AP35='';'';TEXT(INDEX(v.R4:v.R124;U6+1)+U6;'0'))"
        NYParser.shared.willAppendToFields(AP36)
        
    }
    
    override func addLookUpFields() {
        
        var indexLookup = self.getBenefitSellingArr()
        
        for index in 4...124 {
            
            let AJField = NYTextField()
            AJField.id = "v.AJ\(index)"
            AJField.formula = "\(indexLookup[index-4])"
            AJField.text = "\(indexLookup[index-4])"
            AJField.value = "\(indexLookup[index-4])"
            
            NYParser.shared.willAppendToFields(AJField)
            
            let ARField = NYTextField()
            ARField.id = "v.R\(index)"
            ARField.formula = "\(indexLookup[index-4])"
            ARField.text = "\(indexLookup[index-4])"
            ARField.value = "\(indexLookup[index-4])"
            
            NYParser.shared.willAppendToFields(ARField)
            
        }
        
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
