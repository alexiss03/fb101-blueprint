//
//  NYEPEstateAvoidanceViewController.swift
//  Nymeria
//
//  Created by Mac on 7/9/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYEPEstateAvoidanceViewController: NYBaseSpreadsheetViewController, NYEPEstatePlanningViewDelegate {
    
    var v: NYEPEstatePlanningView?
    
    override func viewDidLoad() {
        
        formId = "NYETAP"
        formName = "Estate Tax Avoidance Planning"
        
        self.v = NYEPEstatePlanningView.fromNib("NYEPEstatePlanningView")
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
        self.txtFieldReferenceFieldRecordName = v?.P2
        self.setUpMenuItems(v!.navBar, title: "ESTATE TAX AVOIDANCE")
        
        v?.AA14.toolbar.options = ["YOU", "SPOUSE"]
        v?.AG68.toolbar.options = ["DISTRIBUTION", "DIVERSIFICATION", "ALLOCATION", "CREATION"]
        
        self.view = self.v
        self.setNegativeFields()
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        v?.mainTitleLabel.text = "ESTATE TAX AVOIDANCE BLUEPRINT OF"
        
        // Planning Method View
        v?.planningMethodTitle.text = "4 Methods in Planning to Conserve Your Estate:"
        v?.planningMethodLabel.text = "1\n2\n3\n4"
        v?.planningMethodContent.text = "Asset DISTRIBUTION Tax Avoidance Planning Method\nAsset DIVERSIFICATION Tax Avoidance Planning Method\nAsset ALLOCATION Tax Avoidance Planning Method\nAsset CREATION Tax Avoidance Planning Method"
        v?.B68.text = "\"Regardless of Which Method YOU Choose, Each Method Requires Thoughtful and Informed Planning\""
        v?.B69.text = "Which Method of Planning to Conserve Your Estate Would You Want to Explore?"
        v?.B70.text = "Assumed Regular Variable Life Basic Annual Premium Rate per Thousand:"
        v?.C71.text = "Most people spend 30 to 40 years building an estate, yet all too often failed to invest a few hours planning on how to conserve it"
        
        self.v?.ecAssetsView.isHidden = true
        self.v?.eaAssetsView.isHidden = false
        
        self.v?.AG14.isHidden = true
        self.v?.AL14.isHidden = false
        
        self.v?.U57.isHidden = true
        self.v?.U58.isHidden = true
        
    }
    
    func setNegativeFields() {
        
        self.v?.AA46.displayType = .negativeRed
        self.v?.AG46.displayType = .negativeRed
        
    }
    
    override func setUpFieldIds() {
        
        self.v?.P2.id = "P2"
        self.v?.AA2.id = "AA2"
        self.v?.AB2.id = "AB2"
        self.v?.AG2.id = "AG2"
        
        self.v?.AA14.id = "AA14"
        self.v?.AG14.id = "AG14"
        self.v?.AG15.id = "AG15"
        self.v?.AL14.id = "AL14"
        
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
        self.v?.Q33.id = "Q33"
        self.v?.M33.id = "M33"
        
        self.v?.O54.id = "O54"
        self.v?.X55.id = "X55"
        
        self.v?.AG68.id = "AG68"
        self.v?.AG69.id = "AG69"
        
        // CHANGING LABELS
        self.v?.D26.id = "D26"
        self.v?.Y38.id = "Y38"
        self.v?.X40.id = "X40"
        self.v?.D41.id = "D41"
        self.v?.D57.id = "D57"
        self.v?.D58.id = "D58"
        
        self.v?.B68.id = "B68"
        self.v?.B69.id = "B69"
        self.v?.B70.id = "B70"
        self.v?.C71.id = "C71"
        
        self.v?.planningMethodTitle.id = "C60"
        self.v?.planningMethodLabel.id = "D61"
        self.v?.planningMethodContent.id = "E61"
        
    }
    
    override func setUpValidations() {
        
        self.v?.P33.validations = [(.lessThanEqual, (self.v?.AA26)!, "Invalid Value")]
        self.v?.S40.validations = [(.lessThanEqual, 100 as AnyObject, "Enter percentage")]
        self.v?.V40.validations = [(.lessThanEqual, 20 as AnyObject, "Enter Numeric Maximum of 20 years")]
        self.v?.X55.validations = [(.lessThanEqual, 100 as AnyObject, "Enter Rate of Estate appreciation")]
        self.v?.AG69.validations = [(.lessThanEqual, 1000 as AnyObject, "Enter Numeric value")]
        
    }
    
    override func setUpComputations() {
        
        self.v?.AA2.formula = "IF(AG2='';'';'Age:')"
        self.v?.AB2.formula = "IF(AG2='';'';ROUNDDOWN((TODAY-AG2)/365;0))"
        
        self.v?.AA14.text = "YOU"
        self.v?.AA14.value = "YOU"
        self.v?.AL14.formula = "IF(AG68='';'';''&AG68&'')"
        self.v?.AG15.formula = "IF(AG68='';'';'Tax Avoidance Method')"
        
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
        
        self.v?.AG16.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';AA16+0;IF(AG68='DIVERSIFICATION';(AA16-(AA16*0.5));IF(AG68='ALLOCATION';IF(AA16='';0;AA16-(AA16*AQ9/AQ8));IF(AA16='';0;AA16-(AA16*AG19/AQ8))))))"
        self.v?.AG17.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';AA17+0;IF(AG68='DIVERSIFICATION';(AA17-(AA17*0.5));IF(AG68='ALLOCATION';IF(AA17='';0;AA17-(AA17*AQ9/AQ8));IF(AA17='';0;AA17-(AA17*AG19/AQ8))))))"
        self.v?.AG18.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';0;IF(AG68='DIVERSIFICATION';(AA18-(AA18*0.5));IF(AG68='ALLOCATION';IF(AA18='';0;AA18-(AA18*AQ9/AQ8));IF(AA18='';0;AA18-(AA18*AG19/AQ8))))))"
        self.v?.AG19.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';(AA19+AA18);IF(AG68='DIVERSIFICATION';((AA16+AA17+AA18)*0.5+AA19);IF(AG68='ALLOCATION';(AQ9+AA19);(AA38*AG69/1000)+AA19))))"
        self.v?.AG20.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';SUM(AG16:AG19);IF(AG68='DIVERSIFICATION';SUM(AG16:AG19);IF(AG68='ALLOCATION';SUM(AG16:AG19);SUM(AG16:AG19)+AA19))))"
        
        self.v?.AG22.formula = "IF(OR(AA14='';AG68='');'';AA22+0)"
        self.v?.AG23.formula = "IF(OR(AA14='';AG68='');'';AA23+0)"
        self.v?.AG24.formula = "IF(OR(AA14='';AG68='');'';SUM(AG22:AG23))"
        
        self.v?.AA26.formula = "IF(AA14='';'';AA20-AA24)"
        self.v?.AG26.formula = "IF(OR(AA14='';AG68='');'';AG20-AG24)"
        
        self.v?.AA29.formula = "IF(AA14='';'';MIN(AA26*0.05;200000))"
        self.v?.AA30.formula = "IF(AA14='';'';IF(AA26>0;500000;0))"
        self.v?.AA31.formula = "IF(AA14='';'';IF(AA26>0;1000000;0))"
        self.v?.AA32.formula = "IF(AA14='';'';IF(AA26>0;1000000;0))"
        self.v?.AA33.formula = "IF(AA26=0;0;IF(AA14='';'';IF(OR(S40='';V40='');Q33*M33;Q33*M33*(1+S40)^V40)))"
        self.v?.AA34.formula = "0"
        self.v?.AA35.formula = "IF(AA14='';'';AA19+0)"
        self.v?.AA36.formula = "IF(AA14='';'';SUM(AA29:AA35))"
        self.v?.AA37.formula = "IF(AA14='';'';MAX((AA26-AA36);0))"
        self.v?.AA38.formula = "IF(AA14='';'';IF(AA37>10000000;1215000+(AA37-10000000)*0.2;IF(AA37>5000000;465000+(AA37-5000000)*0.15;IF(AA37>2000000;135000+(AA37-2000000)*0.11;IF(AA37>500000;15000+(AA37-500000)*0.08;IF(AA37>200000;(AA37-200000)*0.05;0))))))"
        
        self.v?.AG29.formula = "IF(OR(AA14='';AG68='');'';MIN((AG26*0.05);200000))"
        self.v?.AG30.formula = "IF(OR(AA14='';AG68='');'';IF(AG26>0;500000;0))"
        self.v?.AG31.formula = "IF(OR(AA14='';AG68='');'';IF(AG26>0;1000000;0))"
        self.v?.AG32.formula = "IF(AG26=0;0;IF(OR(AA14='';AG68='');'';IF(AA26>0;1000000;0)))"
        self.v?.AG33.formula = "IF(AG26=0;0;IF(OR(AA14='';AG68='');'';AA33+0))"
        self.v?.AG34.formula = "AQ34+0"
        self.v?.AG35.formula = "IF(OR(AA14='';AG68='');'';AG19+0)"
        self.v?.AG36.formula = "IF(OR(AA14='';AG68='');'';SUM(AG29:AG35))"
        self.v?.AG37.formula = "IF(OR(AA14='';AG68='');'';MAX((AG26-AG36);0))"
        self.v?.AG38.formula = "IF(AA14='';'';IF(AG37>10000000;1215000+(AG37-10000000)*0.2;IF(AG37>5000000;465000+(AG37-5000000)*0.15;IF(AG37>2000000;135000+(AG37-2000000)*0.11;IF(AG37>500000;15000+(AG37-500000)*0.08;IF(AG37>200000;(AG37-200000)*0.05;0))))))"
        
        self.v?.AA42.formula = "IF(AA14='';'';AA26-AA38)"
        self.v?.AA43.formula = "IF(AA14='';'';0)"
        self.v?.AA44.formula = "IF(AA14='';'';AA19*0.25)"
        self.v?.AA45.formula = "IF(AA14='';'';AA42+AA44+AA43)"
        self.v?.AA46.formula = "IF(AA14='';'';AA45-AA26)"
        
        self.v?.AG42.formula = "IF(OR(AA14='';AG68='');'';AG26-AG38)"
        self.v?.AG43.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';0;IF(AG68='DIVERSIFICATION';AR43;IF(AG68='ALLOCATION';ROUNDDOWN(AG38;0);ROUNDDOWN(AG38;0)))))"
        self.v?.AG44.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';ROUNDDOWN(AG19*0.25;0);IF(AG68='DIVERSIFICATION';ROUNDDOWN(AG19*0.25;0);IF(AG68='ALLOCATION';ROUNDDOWN(AQ11*0.25;0);ROUNDDOWN(AA19*0.25;0)))))"
        self.v?.AG45.formula = "IF(OR(AA14='';AG68='');'';AG42+AG44+AG43)"
        self.v?.AG46.formula = "IF(OR(AA14='';AG68='');'';AG45-AA45)"
        
        self.v?.AA48.formula = "IF(AA14='';'';AA38*0.25)"
        self.v?.AA49.formula = "IF(AA14='';'';AA38*0.25)"
        self.v?.AA50.formula = "IF(AA14='';'';AA38*0.5)"
        self.v?.AA51.formula = "IF(AA14='';'';SUM(AA48:AA50))"
        self.v?.AA52.formula = "IF(AA14='';'';AA38+AA51)"
        
        self.v?.AG48.formula = "IF(OR(AA14='';AG68='');'';IF(AG46>=0;0;AG46*0.25))"
        self.v?.AG49.formula = "0"
//        self.v?.AG49.formula = "IF(OR(AA14='';AG68='');'';IF(AG47>=0;0;AG46*X50))"
        self.v?.AG50.formula = "IF(OR(AA14='';AG68='');'';IF(AG48>=0;0;AG46*0.5))"
        self.v?.AG51.formula = "IF(OR(AA14='';AG68='');'';SUM(AG48:AG50))"
        self.v?.AG52.formula = "IF(OR(AA14='';AG68='');'';IF(AG46>=0;0;AG46+AG51))"
        
        self.v?.AA54.formula = "IF(AA14='';'';IF(O54>0;AA52*(1.2^O54);AA52+0))"
//        self.v?.AA55.formula = "IF(OR(AA14='';AG68='');'';IF(AG54=0;0;AG26*(1+X55)^O54-AG54))"
        self.v?.AA55.formula = "IF(AA14='';'';IF(AQ55<0;0;AQ55+0))"
        
        self.v?.AG54.formula = "IF(OR(AA14='';AG68='');'';IF(OR(AG52=0;O54>0);AG52*(1.2^O54);AG38+0))"
        self.v?.AG55.formula = "IF(OR(AA14='';AG68='');'';IF(AG54=0;0;(AG26*(1+X55)^O54)-AG54))"
        
        self.v?.AA57.formula = "AA54+0"
        self.v?.AA58.formula = "AA55+0"
        
        self.v?.AG57.formula = "IF(OR(AA14='';AG68='');'';AG45-AG26)"
        self.v?.AG58.formula = "IF(OR(AA14='';AG68='');'';AG45+0)"
        
        self.v?.D26.formula = "IF(OR(S40='';V40='';V40=0);'• NET ASSET BEFORE TAX ( Assets Less Liabilities )';'• NET ASSET BEFORE TAX  ( Increased in Value Over '&V40&' year'&IF(V40>1;'s)';''))"
        self.v?.Y38.formula = "IF(OR(S40='';V40=0;V40='');'ESTATE TAX DUE Today';'ESTATE TAX DUE over '&V40&' year'&IF(V40>1;'s';''))"
        self.v?.X40.formula = "'year'&IF(V40>1;'s';'')"
        self.v?.D41.formula = "IF(AA14='YOU';'• ESTATE VALUE  IN THE EVENT OF YOUR PRE-MATURE DEATH';'• ESTATE VALUE  IN THE EVENT OF YOUR SPOUSE PRE-MATURE DEATH')"
        
        self.v?.planningMethodTitle.formula = "IF(AG68='';'4 Methods in Planning to Conserve Your Estate:';'3 Simple Steps to Conserve Your Estate Through Asset '&AG68&' Avoidance Planning Method:')"
        self.v?.planningMethodLabel.formula = "IF(AG68='';'1\n2\n3\n4\n\n';'1\n2\n3\nPROS:\nCONS:\nApplication:')"
        self.v?.planningMethodContent.formula = "IF(AG68='';'Asset DISTRIBUTION Tax Avoidance Planning Method\nAsset  DIVERSIFICATION  Tax Avoidance Planning Method\nAsset  ALLOCATION  Tax Avoidance Planning Method\nAsset  CREATION  Tax Avoidance Planning Method';IF(AG68='DISTRIBUTION';'DISTRIBUTE absolutely all assets intended to pass on to your heirs while alive and liquify assets needed to hold on\nTransfer all Liquid Assets into Tax-Sheltered Investment Assets using SINGLE PREMIUM VUL\nMake yourself as owner and designate legal age beneficiary as IRREVOCABLE (Two Party Arrangement)\nYou hold NO asset under your name so nothing is subject to Estate Tax when you die.\nYou lost control of your assets and transferring your assets to your heirs is just transferring the risk.\nRecommended for estate owners old enough to manage their estate and willing to distribute assets to heirs while alive.';IF(AG68='DIVERSIFICATION';'DIVERSIFY 50% of your assets by converting idle assets first, P'&(ROUNDDOWN(AR19-AA19;0))&' into Tax-Sheltered Investment Asset\nUsing SINGLE PREMIUM VUL as Tax-Sheltered Investement, you create FREE P'&(ROUNDDOWN(AG44-AA44;0))&' additional estate\nMake yourself as owner and designate legal age beneficiary as IRREVOCABLE (Two Party Arrangement)\nOnly 50% of your estate is being taxed but paid by the 25% free insurance from your Tax-sheltered Investment\nA large amount of asset must be converted into liquid asset that may affect some of your income producing assets\nRecommended for estate owners in good health willing to convert idle assets into Tax-Sheltered Investment Asset';IF(AG68='ALLOCATION';'ALLOCATE in lumpsum 50% of your assets, P'&(ROUNDDOWN(AQ9;0))&' into Tax-Sheltered Investment Asset\nUsing a REGULAR VUL with P'&(ROUNDDOWN(AQ10;0))&' as premium and P'&(ROUNDDOWN(AQ11;0))&' as TOP-UP; you create P'&AS45&' additional estate\nMake yourself as owner and designate legal age beneficiary as IRREVOCABLE (Two Party Arrangement)\nHassle free Tax-Sheltered Investment Asset that creates another estate enough to pay your Estate Tax\nThere is no disadvantage on this method if you have assets that is not working for you\nRecommended for estate owners in good health WITHOUT liquidity problem';'CREATE an Estate by transferring '&AT22&'% of your asset annully, P'&(ROUNDDOWN((AT19-AA19);0))&' into Tax-Sheltered Investment Asset\nUsing REGULAR VUL as Tax-Sheltered Investment Asset, you create P'&(ROUNDDOWN(AG38;0))&' additional estate for Estate Tax\nMake yourself as owner and designate legal age beneficiary as IRREVOCABLE (Two Party Arrangement)\nIt creates liquid asset instantly at death enough to pay your Estate Tax.\nThe diligent installment transfer of assets annually at least for the next 10 years\nRecommended for estate owners in good health WITH liquidity problem'))))"
        
        self.v?.B68.formula = "IF(AG68='';'\"Regardless of Which Method YOU Choose, Each Method Requires Thoughtful and Informed Planning\"';'\"The Key to Effective Conservation Planning is a Proper Arrangement and Strategically Positioning of Assets\"')"
        self.v?.C71.formula = "IF(AG68='';'\"Most people spend 30 to 40 years building an estate, yet all too often failed to invest a few hours planning on how to conserve it\"';IF(AG68='DISTRIBUTION';'\"Some people believe that if they have a Will, they would avoid Probate! The word Will and Probate are synonymous: If thou has a Will, thou shall go through Probate\"';IF(AG68='DIVERSIFICATION';'\"Only in Variable Life Insurance you can tax-shelter your assets with guaranteed protection\"';IF(AG68='ALLOCATION';'\"20/20 hindsight is easy, he who makes provisions for his estates sleeps better at night\"';IF(AG68='CREATION';'\"The most economical and most practical solution to conserve an estate is by creating another estate through regular transfer of assets from one pocket into another pocket\"';'')))))"
    }
    
    override func setUpHiddenFields() {
        
        let AQ5 = NYTextField()
        AQ5.id = "AQ5"
        AQ5.formula = "AG69+0"
        NYParser.shared.willAppendToFields(AQ5)
        
        let AQ6 = NYTextField()
        AQ6.id = "AQ6"
        AQ6.text = "0.08"
        AQ6.value = "0.08"
        NYParser.shared.willAppendToFields(AQ6)
        
        let AQ7 = NYTextField()
        AQ7.id = "AQ7"
        AQ7.formula = "AG69/AQ6"
        NYParser.shared.willAppendToFields(AQ7)
        
        let AQ8 = NYTextField()
        AQ8.id = "AQ8"
        AQ8.formula = "SUM(AA16:AA18)"
        NYParser.shared.willAppendToFields(AQ8)
        
        let AQ9 = NYTextField()
        AQ9.id = "AQ9"
        AQ9.formula = "(AQ7*AA38/1000)"
        NYParser.shared.willAppendToFields(AQ9)
        
        let AQ10 = NYTextField()
        AQ10.id = "AQ10"
        AQ10.formula = "(AG38*AG69/1000)"
        NYParser.shared.willAppendToFields(AQ10)
        
        let AQ11 = NYTextField()
        AQ11.id = "AQ11"
        AQ11.formula = "AQ9-AQ10"
        NYParser.shared.willAppendToFields(AQ11)
        
        let AQ34 = NYTextField()
        AQ34.id = "AQ34"
        AQ34.formula = "IF(OR(AA14='';AG68='');'';IF(AG68='DISTRIBUTION';AG16+AG17;AA34))"
        NYParser.shared.willAppendToFields(AQ34)
        
        let AQ55 = NYTextField()
        AQ55.id = "AQ55"
        AQ55.formula = "AA26*(1+X55)^O54-AA54"
        NYParser.shared.willAppendToFields(AQ55)
        
        let AR19 = NYTextField()
        AR19.id = "AR19"
        AR19.formula = "(AA16+AA17+AA18)*0.5+AA19"
        NYParser.shared.willAppendToFields(AR19)
        
        let AS45 = NYTextField()
        AS45.id = "AS45"
        AS45.formula = "IF(AQ5=0;0;ROUNDDOWN(AQ11*0.25;0)+ROUNDDOWN(AG38;0))"
        NYParser.shared.willAppendToFields(AS45)
        
        let AT19 = NYTextField()
        AT19.id = "AT19"
        AT19.formula = "(AA38*AG69/1000)+AA19"
        NYParser.shared.willAppendToFields(AT19)
        
        let AT22 = NYTextField()
        AT22.id = "AT22"
        AT22.value = "0"
        AT22.formula = "ROUNDDOWN((AQ10/AQ8)*100;2)"
        NYParser.shared.willAppendToFields(AT22)
        
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
