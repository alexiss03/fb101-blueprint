//
//  NYEPEstateConservationViewController.swift
//  Nymeria
//
//  Created by Mac on 7/7/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYEPEstateConservationViewController: NYBaseSpreadsheetViewController, NYEPEstatePlanningViewDelegate {
    
    var v: NYEPEstatePlanningView?
    
    override func viewDidLoad() {
        
        formId = "NYETCP"
        formName = "Estate Tax Conservation Planning"
        
        self.v = NYEPEstatePlanningView.fromNib("NYEPEstatePlanningView")
        v?.delegate = self
        
        v?.scrollView.delegate = self
        
        if NYConstants.IS_IPAD_PRO_1366 {
            v?.scrollView.minimumZoomScale = 1.33
            v?.scrollView.maximumZoomScale = 2.0
            v?.scrollView.zoomScale = 1.33
        } else {
            v?.scrollView.minimumZoomScale = 1.0
            v?.scrollView.maximumZoomScale = 2.0
        }
        
        self.scrollView = v?.scrollView
        
        self.txtFieldReferenceFieldRecordName = v?.P2
        
        self.spreadSheetViews = []
        self.setUpMenuItems(v!.navBar, title: "ESTATE CONSERVATION")
        
        v?.AA14.toolbar.options = ["YOU", "SPOUSE"]
        v?.AG14.toolbar.options = ["YOU", "SPOUSE"]
        
        self.view = self.v
        self.setNegativeFields()
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.v?.mainTitleLabel.text = "ESTATE CONSERVATION BLUEPRINT OF"
        
        // Planning Method View
        self.v?.planningMethodTitle.text = "3 Simple Steps to Conserve Your Estate Through Asset CREATION Avoidance Planning Method:"
        self.v?.planningMethodLabel.text = "1\n2\n3\nPROS:\nCONS:\nApplication:"
        self.v?.planningMethodContent.text = "CREATE an Estate by transferring approx. 1% of your asset annually into your a Tax-Sheltered Investment Asset.\nUsing REGULAR VUL as your Tax-Sheltered Investment Asset, you create insurance estate to pay your Estate Tax.\nMake yourself as owner and designate legal age beneficiary as IRREVOCABLE (Two Party Arrangement)\nIt creates liquid asset instantly at death enough to pay your Estate Tax.\nThe diligent installment transfer of assets annually at least for the next 10-15 years\nRecommended for estate owners in good health WITH liquidity problem"
        self.v?.B68.text = "The Key to Effective Conservation Planning is a Proper Arrangement and Strategically Positioning of Assets"
        self.v?.B69.text = "Which Method of Planning to Conserve Your Estate Have You or Would You Want to Explore?"
        self.v?.B70.text = ""
        self.v?.C71.text = "The most economical and most practical solution to conserve an estate is by creating another estate through regular transfer of assets from one pocket into another pocket"
        
        self.v?.ecAssetsView.isHidden = false
        self.v?.eaAssetsView.isHidden = true
        
        self.v?.AA57.isHidden = true
        self.v?.AA58.isHidden = true
        self.v?.AG57.isHidden = true
        self.v?.AG58.isHidden = true
        self.v?.AG68.isHidden = true
        self.v?.AG69.isHidden = true
        
    }
    
    func setNegativeFields() {
        
        self.v?.AA46.displayType = .negativeRed
        self.v?.AG46.displayType = .negativeRed
        
    }
    
    override func setUpFieldIds() {
        
        self.v?.B68.id = "B68"
        self.v?.B69.id = "B69"
        self.v?.B70.id = "B70"
        self.v?.C71.id = "C71"
        
        self.v?.P2.id = "P2"
        self.v?.AA2.id = "AA2"
        self.v?.AB2.id = "AB2"
        self.v?.AG2.id = "AG2"
        
        self.v?.AA14.id = "AA14"
        self.v?.AG14.id = "AG14"
        
        self.v?.K16.id = "K16"
        self.v?.K17.id = "K17"
        self.v?.K18.id = "K18"
        self.v?.K19.id = "K19"
        self.v?.K20.id = "K20"
        
        self.v?.K22.id = "K22"
        self.v?.K23.id = "K23"
        self.v?.K24.id = "K24"
        
        self.v?.P16.id = "P16"
        self.v?.P17.id = "P17"
        self.v?.P18.id = "P18"
        self.v?.P19.id = "P19"
        self.v?.P20.id = "P20"
        
        self.v?.P22.id = "P22"
        self.v?.P23.id = "P23"
        self.v?.P24.id = "P24"
        
        self.v?.U16.id = "U16"
        self.v?.U17.id = "U17"
        self.v?.U18.id = "U18"
        self.v?.U19.id = "U19"
        self.v?.U20.id = "U20"
        
        self.v?.U22.id = "U22"
        self.v?.U23.id = "U23"
        self.v?.U24.id = "U24"
        
        self.v?.AA16.id = "AA16"
        self.v?.AA17.id = "AA17"
        self.v?.AA18.id = "AA18"
        self.v?.AA19.id = "AA19"
        self.v?.AA20.id = "AA20"
        
        self.v?.AA22.id = "AA22"
        self.v?.AA23.id = "AA23"
        self.v?.AA24.id = "AA24"
        
        self.v?.AG16.id = "AG16"
        self.v?.AG17.id = "AG17"
        self.v?.AG18.id = "AG18"
        self.v?.AG19.id = "AG19"
        self.v?.AG20.id = "AG20"
        
        self.v?.AG22.id = "AG22"
        self.v?.AG23.id = "AG23"
        self.v?.AG24.id = "AG24"
        
        self.v?.AA26.id = "AA26"
        self.v?.AG26.id = "AG26"
        
        self.v?.AA29.id = "AA29"
        self.v?.AA30.id = "AA30"
        self.v?.AA31.id = "AA31"
        self.v?.AA32.id = "AA32"
        self.v?.AA33.id = "AA33"
        self.v?.AA34.id = "AA34"
        self.v?.AA35.id = "AA35"
        self.v?.AA36.id = "AA36"
        self.v?.AA37.id = "AA37"
        self.v?.AA38.id = "AA38"
        
        self.v?.AA42.id = "AA42"
        self.v?.AA43.id = "AA43"
        self.v?.AA44.id = "AA44"
        self.v?.AA45.id = "AA45"
        self.v?.AA46.id = "AA46"
        
        self.v?.AA48.id = "AA48"
        self.v?.AA49.id = "AA49"
        self.v?.AA50.id = "AA50"
        self.v?.AA51.id = "AA51"
        self.v?.AA52.id = "AA52"
        
        self.v?.AA54.id = "AA54"
        self.v?.AA55.id = "AA55"
        
        self.v?.AG29.id = "AG29"
        self.v?.AG30.id = "AG30"
        self.v?.AG31.id = "AG31"
        self.v?.AG32.id = "AG32"
        self.v?.AG33.id = "AG33"
        self.v?.AG34.id = "AG34"
        self.v?.AG35.id = "AG35"
        self.v?.AG36.id = "AG36"
        self.v?.AG37.id = "AG37"
        self.v?.AG38.id = "AG38"
        
        self.v?.AG42.id = "AG42"
        self.v?.AG43.id = "AG43"
        self.v?.AG44.id = "AG44"
        self.v?.AG45.id = "AG45"
        self.v?.AG46.id = "AG46"
        
        self.v?.AG48.id = "AG48"
        self.v?.AG49.id = "AG49"
        self.v?.AG50.id = "AG50"
        self.v?.AG51.id = "AG51"
        self.v?.AG52.id = "AG52"
        
        self.v?.AG54.id = "AG54"
        self.v?.AG55.id = "AG55"
        
        self.v?.AA57.id = "AA57"
        self.v?.AA58.id = "AA58"
        self.v?.AG57.id = "AG57"
        self.v?.AG58.id = "AG58"
        
        self.v?.S40.id = "S40"
        self.v?.V40.id = "V40"
        
        self.v?.K33.id = "K33"
        self.v?.P33.id = "P33"
        self.v?.U33.id = "U33"
        
        self.v?.O54.id = "O54"
        self.v?.X55.id = "X55"
        
        self.v?.U57.id = "U57"
        self.v?.U58.id = "U58"
        
        self.v?.AG68.id = "AG68"
        self.v?.AG69.id = "AG69"
        
        // CHANGING LABELS
        self.v?.D26.id = "D26"
        self.v?.Y38.id = "Y38"
        self.v?.X40.id = "X40"
        self.v?.D41.id = "D41"
        self.v?.D57.id = "D57"
        self.v?.D58.id = "D58"
    
    }
    
    override func setUpValidations() {
        
        self.v?.K33.validations = [(.lessThanEqual, (v?.AA26)!, "Invalid Value")]
        self.v?.P33.validations = [(.lessThanEqual, (v?.AG26)!, "Invalid Value")]
        self.v?.U33.validations = [(.lessThanEqual, 100 as AnyObject, "Invalid Value")]
        
        self.v?.S40.validations = [(.lessThanEqual, 100 as AnyObject, "Enter percentage")]
        self.v?.V40.validations = [(.lessThanEqual, 20 as AnyObject, "Enter Numeric Maximum of 20 years")]
        self.v?.X55.validations = [(.lessThanEqual, 100 as AnyObject, "Enter Rate of Estate appreciation")]
        
    }
    
    
    override func setUpComputations() {
        
        self.v?.AA2.formula = "IF(AG2='';'';'Age:')"
        self.v?.AB2.formula = "IF(AG2='';'';ROUNDDOWN((TODAY-AG2)/365;0))"
        
        self.v?.AA14.text = "YOU"
        self.v?.AA14.value = "YOU"
        self.v?.AG14.text = "SPOUSE"
        self.v?.AG14.value = "SPOUSE"
        
        self.v?.K20.formula = "SUM(K16:K19)"
        self.v?.K24.formula = "SUM(K22:K23)"
        self.v?.P20.formula = "SUM(P16:P19)"
        self.v?.P24.formula = "SUM(P22:P23)"
        self.v?.U20.formula = "SUM(U16:U19)"
        self.v?.U24.formula = "SUM(U22:U23)"
        
        self.v?.AA16.formula = "IF(AA14='';0;IF(AA14='YOU';K16+0;P16+0)+U16/2)*(1+S40)^V40"
        self.v?.AA17.formula = "IF(AA14='';0;IF(AA14='YOU';K17+0;P17+0)+U17/2)*(1+S40)^V40"
        self.v?.AA18.formula = "IF(AA14='';0;IF(AA14='YOU';K18+0;P18+0)+U18/2)*(1+S40)^V40"
        self.v?.AA19.formula = "IF(AA14='';0;IF(AA14='YOU';K19+0;P19+0)+U19/2)*(1+S40)^V40"
        self.v?.AA20.formula = "IF(AA14='';'';SUM(AA16:AA19))"
        
        self.v?.AA22.formula = "IF(AA14='';0;IF(AA14='YOU';K22+0;P22+0)+U22/2)*(1-S40)^V40"
        self.v?.AA23.formula = "IF(AA14='';0;IF(AA14='YOU';K23+0;P23+0)+U23/2)*(1-S40)^V40"
        self.v?.AA24.formula = "IF(AA14='';'';SUM(AA22:AA23))"
        
        self.v?.AG16.formula = "IF(AG14='';0;IF(AG14='YOU';K16+0;P16+0)+U16/2)*(1+S40)^V40"
        self.v?.AG17.formula = "IF(AG14='';0;IF(AG14='YOU';K17+0;P17+0)+U17/2)*(1+S40)^V40"
        self.v?.AG18.formula = "IF(AG14='';0;IF(AG14='YOU';K18+0;P18+0)+U18/2)*(1+S40)^V40"
        self.v?.AG19.formula = "IF(AG14='';0;IF(AG14='YOU';K19+0;P19+0)+U19/2)*(1+S40)^V40"
        self.v?.AG20.formula = "IF(AG14='';'';SUM(AG16:AG19))"
        
        self.v?.AG22.formula = "IF(AG14='';0;IF(AG14='YOU';K22+0;P22+0)+U22/2)*((1-S40)^V40)"
        self.v?.AG23.formula = "IF(AG14='';0;IF(AG14='YOU';K23+0;P23+0)+U23/2)*((1-S40)^V40)"
        self.v?.AG24.formula = "IF(AG14='';'';SUM(AG22:AG23))"
        
        self.v?.AA26.formula = "IF(AA14='';'';AA20-AA24)"
        self.v?.AG26.formula = "IF(AG14='';'';AG20-AG24)"
        
        self.v?.AA29.formula = "IF(AA14='';'';MIN(AA26*0.05;200000))"
        self.v?.AA30.formula = "IF(AA14='';'';IF(AA26>0;500000;0))"
        self.v?.AA31.formula = "IF(AA14='';'';IF(AA26>0;1000000;0))"
        self.v?.AA32.formula = "IF(AA14='';'';IF(AA26>0;1000000;0))"
        self.v?.AA33.formula = "IF(AA26=0;0;IF(AA14='';'';IF(OR(S40='';V40='');K33*U33;K33*U33*(1+S40)^V40)))"
        self.v?.AA34.formula = "0"
        self.v?.AA35.formula = "IF(AA14='';'';AA19+0)"
        self.v?.AA36.formula = "IF(AA14='';'';SUM(AA29:AA35))"
        self.v?.AA37.formula = "IF(AA14='';'';MAX((AA26-AA36);0))"
        self.v?.AA38.formula = "IF(AA14='';'';IF(AA37>10000000;1215000+(AA37-10000000)*0.2;IF(AA37>500000;465000+(AA37-500000)*0.15;IF(AA37>2000000;135000+(AA37-2000000)*0.11;IF(AA37>500000;15000+(AA37-500000)*0.08;IF(AA37>200000;(AA37-200000)*0.05;0))))))"

        self.v?.AG29.formula = "IF(AG14='';'';MIN(AA26*0.05;200000))"
        self.v?.AG30.formula = "IF(AG14='';'';IF(AA26>0;500000;0))"
        self.v?.AG31.formula = "IF(AG14='';'';IF(AA26>0;1000000;0))"
        self.v?.AG32.formula = "IF(AG14='';'';IF(AA26>0;1000000;0))"
        self.v?.AG33.formula = "IF(AG26=0;0;IF(AG14='';'';IF(OR(S40='';V40='');P33*U33;P33*U33*(1+S40)^V40)))"
        self.v?.AG34.formula = "0"
        self.v?.AG35.formula = "IF(AA14='';'';AA19+0)"
        self.v?.AG36.formula = "IF(AG14='';'';SUM(AG29:AG35))"
        self.v?.AG37.formula = "IF(AG14='';'';MAX(AG26-AG36;0))"
        self.v?.AG38.formula = "IF(AG14='';'';IF(AG37>10000000;1215000+(AG37-10000000)*0.2;IF(AG37>500000;465000+(AG37-500000)*0.15;IF(AG37>2000000;135000+(AG37-2000000)*0.11;IF(AG37>500000;15000+(AG37-500000)*0.08;IF(AG37>200000;(AG37-200000)*0.05;0))))))"
        
        self.v?.AA42.formula = "IF(AA14='';'';AA26-AA38)"
        self.v?.AA43.formula = "IF(AA14='';'';0)"
        self.v?.AA44.formula = "IF(AA14='';'';AA19*0.25)"
        self.v?.AA45.formula = "IF(AA14='';'';AA42+AA44+AA43)"
        self.v?.AA46.formula = "IF(AA14='';'';AA45-AA26)"
        
        self.v?.AG42.formula = "IF(AG14='';'';AG26-AG38)"
        self.v?.AG43.formula = "IF(AG14='';'';0)"
        self.v?.AG44.formula = "IF(AG14='';'';AG19*0.25)"
        self.v?.AG45.formula = "IF(AG14='';'';AG42+AG44+AG43)"
        self.v?.AG46.formula = "IF(AG14='';'';AG45-AG26)"
        
        self.v?.AA48.formula = "IF(AA14='';'';AA38*0.25)"
        self.v?.AA49.formula = "IF(AA14='';'';AA38*0.25)"
        self.v?.AA50.formula = "IF(AA14='';'';AA38*0.5)"
        self.v?.AA51.formula = "IF(AA14='';'';SUM(AA48:AA50))"
        self.v?.AA52.formula = "IF(AA14='';'';AA38+AA51)"
        
        self.v?.AG48.formula = "IF(AG14='';'';AG38*0.25)"
        self.v?.AG49.formula = "IF(AG14='';'';AG38*0.25)"
        self.v?.AG50.formula = "IF(AG14='';'';AG38*0.5)"
        self.v?.AG51.formula = "IF(AG14='';'';SUM(AG48:AG50))"
        self.v?.AG52.formula = "IF(AG14='';'';AG38+AG51)"
        
        self.v?.AA54.formula = "IF(AA14='';'';IF(O54>0;AA52*(1.2^O54);AA52+0))"
        self.v?.AA55.formula = "IF(AA14='';'';IF(AW55<0;'';AW55+0))"
        
        self.v?.AG54.formula = "IF(AG14='';'';IF(O54>0;AG52*(1.2^O54);AG52+0))"
        self.v?.AG55.formula = "IF(AG14='';'';IF(AW54<0;'';AW54+0))"
        
        self.v?.U57.formula = "AA54+AG54"
        self.v?.U58.formula = "IF(OR(AW54<=0;AW55=0);0;AA55+AG55)"
        
        self.v?.AG68.formula = "'Creation'"
        self.v?.AG69.formula = "55"
        
        self.v?.D26.formula = "IF(OR(S40='';V40='';V40=0);'• NET ASSET BEFORE TAX ( Assets Less Liabilities )';'• NET ASSET BEFORE TAX  ( Increased in Value Over '&V40&' year'&IF(V40>1;'s)';''))"
        self.v?.Y38.formula = "IF(OR(S40='';V40=0;V40='');'ESTATE TAX DUE Today';'ESTATE TAX DUE over '&V40&' year'&IF(V40>1;'s';''))"
        self.v?.X40.formula = "'year'&IF(V40>1;'s';'')"
        self.v?.D41.formula = "IF(AA14='YOU';'• ESTATE VALUE  IN THE EVENT OF YOUR PRE-MATURE DEATH';'• ESTATE VALUE  IN THE EVENT OF YOUR SPOUSE PRE-MATURE DEATH')"
        
    }
    
    override func setUpHiddenFields() {
        
        let AW5 = NYTextField()
        AW5.id = "AW5"
        AW5.formula = "AO69+0"
        NYParser.shared.willAppendToFields(AW5)
        
        let AW6 = NYTextField()
        AW6.id = "AW6"
        AW6.text = "0.08"
        AW6.value = "0.08"
        NYParser.shared.willAppendToFields(AW6)
        
        let AW7 = NYTextField()
        AW7.id = "AW7"
        AW7.formula = "AO69/AW6"
        NYParser.shared.willAppendToFields(AW7)
        
        let AW8 = NYTextField()
        AW8.id = "AW8"
        AW8.formula = "SUM(AA16:AA18)"
        NYParser.shared.willAppendToFields(AW8)
        
        let AW9 = NYTextField()
        AW9.id = "AW9"
        AW9.formula = "(AW7*AA38/1000)"
        NYParser.shared.willAppendToFields(AW9)
        
        let AW10 = NYTextField()
        AW10.id = "AW10"
        AW10.formula = "(AO38*AO69/1000)"
        NYParser.shared.willAppendToFields(AW10)
        
        let AW11 = NYTextField()
        AW11.id = "AW11"
        AW11.formula = "AW9-AW10"
        NYParser.shared.willAppendToFields(AW11)
        
        let AW54 = NYTextField()
        AW54.id = "AW54"
        AW54.formula = "(AG26*(1+X55)^O54)-AG54"
        NYParser.shared.willAppendToFields(AW54)
        
        let AW55 = NYTextField()
        AW55.id = "AW55"
        AW55.formula = "(AA26*(1+X55)^O54)-AA54"
        NYParser.shared.willAppendToFields(AW55)
        
        let AO29 = NYTextField()
        AO29.id = "AO29"
        AO29.formula = "IF(AA26='';AG26;AA26+AG26)"
        NYParser.shared.willAppendToFields(AO29)
        
        let AO54 = NYTextField()
        AO54.id = "AO54"
        AO54.formula = "AA54+AG54"
        NYParser.shared.willAppendToFields(AO54)
        
    }
    
    override func setUpPresenterDetails() {
        
        if let user = NYUserSession.current.user {
            
            if !NYUserSession.current.hasPendingOpenOfRecord.0 {
                v?.presenterName.text = user.fullName
                v?.presenterTitle.text = user.userTitle
                v?.presenterEmail.text = user.emailAddress
                v?.presenterContactNo.text  = user.contactNo
                v?.currentDate.text = NYUtility.getStringFromDate(Date())
            }
            
            v?.presenterName.id = "USER_NAME"
            v?.presenterTitle.id = "USER_TITLE"
            v?.presenterContactNo.id = "USER_CONTACT_NUMBER"
            v?.presenterEmail.id = "USER_EMAIL"
            v?.currentDate.id = "USER_DATE_PRESENTED"
            v!.presenterName.formula = ""
            v!.presenterTitle.formula = ""
            v!.presenterContactNo.formula = ""
            v!.presenterContactNo.formula = ""
            v!.currentDate.formula = ""
            
        }
        
    }
}

