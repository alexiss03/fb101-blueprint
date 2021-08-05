//
//  NYBPBusinessPlanningViewController.swift
//  Nymeria
//
//  Created by Mac on 7/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYBPBusinessPlanningViewController: NYBaseSpreadsheetViewController, NYBPBusinessPlanningViewDelegate {
    
    var v: NYBPBusinessPlanningView?
    
    override func viewDidLoad() {
        
        formId = "NYBP"
        formName = "Business Planning"
        
        v = NYBPBusinessPlanningView.fromNib("NYBPBusinessPlanningView")
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
        
        self.setUpMenuItems(v!.navBar, title: "BUSINESS PLANNING")
        self.view = v
        
        v?.AH3.toolbar.options = ["Proprietor", "Partner", "Stockholder"]
        v?.AH4.toolbar.options = ["Retain It", "Sell It", "Liquidate It"]
        v?.AH5.toolbar.options = ["As Owner", "As Employer", "As Individual"]
        
        self.txtFieldReferenceFieldRecordName = v!.L2
        
        self.scrollView = v!.scrollView
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func setUpFieldIds() {
        
        v?.C4.id = "C4"
        v?.C5.id = "C5"
        
        v?.AH2.id = "AH2"
        v?.AH3.id = "AH3"
        v?.AH4.id = "AH4"
        v?.AH5.id = "AH5"
        
        v?.D6.id = "D6"
        v?.D7.id = "D7"
        
        v?.AH33.id = "AH33"
        v?.AH39.id = "AH39"
        v?.AH45.id = "AH45"
        v?.AH51.id = "AH51"
        v?.AH57.id = "AH57"
        
        v?.AH60.id = "AH60"
        v?.AH61.id = "AH61"
        v?.AH62.id = "AH62"
        v?.AH63.id = "AH63"
        
        v?.Y63.id = "Y63"
        v?.AC61.id = "AC61"
        v?.AD63.id = "AD63"
        
        v?.AB2.id = "AB2"
        
        v?.L2.id = "L2"
        
    }
    
    override func setUpComputations() {
        
        v?.D6.formula = "IF(AH3='Partner';'The Law of Partnership';IF(AH3='Proprietor';'The Legal Position of the Sole Proprietor';IF(AH3='Stockholder';'On The Death of a Stockholder';'')))"
        
        v?.D7.formula = "IF(AH3='Proprietor';'      The sole proprietor and his business are inseparable. The success of proprietorship is primarily due to the personality and ability of the owner. The owner’s prosperity depends mainly on the progress of the business, which is generally his most important personal asset.\n      When the owner dies, the business and his property pass on to the legal representative of his estate. In the probate\nprocedure all claims against the estate, both business and personal, must be met. If other assets are insufficient,\nthe business must be sold or liquidated.\n      Should the business survive the probate procedure, it may still have to be disposed of by sale or liquidation,\nproprietor’s Will does not give the executor specific authority to continue its operations. Even with this authority the\nexecutor will face very serious problems during his temporary operation until the estate is settled.\n      Without a plan of disposition (Will, Living Trust, or Buy & Sell), agreed upon while the owner is alive, with adequate\nsafeguards set up in advance, the estate is faced with two hazardous alternatives when the owner dies\n           1. FORCED LIQUIDATION or SALE with certainty of shrinkage\n           2. CONTINUATION OF BUSINESS under extremely difficult circumstances.\n      In the face of these difficulties, sale or liquidation of the business, with the inevitable shrinkage, may be necessary,\nunless adequate measures have been taken during the owner\'s life to facilitate the orderly transfer of the business\nto the ultimate owners, without undue loss to the heirs.\n      Every Proprietorship is faced with a multitude of often conflicting problems and solutions. This conflict arises\nbecause a Sole Proprietor has three different roles AS OWNER, AS EMPLOYER and AS INDIVIDUAL';IF(AH3='Partner';'      There is no distinction between personal asset and business asset on partnership. They are one and the same. The law of partnership provides that at the death of a partner the status of the surviving partner and the heirs of the deceased is as follows\n      1.  Partnership is automatically dissolved unless a special agreement, previously made, renders this unnecessary.\n      2.  Surviving partner must wind up the business within a reasonable time and pay to the administrator or executor\n           of the deceased partner his share of the net proceed of such sales.\n      3.  If the surviving partner fail to do this, the court will appoint a receiver to liquidate it for them.\n      4.  This compulsory liquidation (unless obviated by a proper agreement) results inevitably in substantial losses\n           to all interested parties.\n      5.  If the asset of the partnership, at the time of death, is insufficient to pay firm's debt, the surviving partner,\n           as well as the estate of the deceased, are liable for such debt.\n      6.  If one partner dies, the surviving partner have no prior right to buy the business. As liquidating trustee,\n           they are compelled to convert everything into cash at the best price obtainable. Otherwise, they are personally\n           liable to the executor or administrator of the deceased for any losses incurred.\n      7.  The only alternative to liquidation procedure is reorganization of the partnership. But choice of liquidation or\n           reorganization lies with the heirs.\n      Every Partnership is faced with a multitude of often–conflicting problems and solutions. This conflict arises\nbecause a  Business Partner has three different roles AS OWNER, AS EMPLOYER and AS INDIVIDUAL';IF(AH3='Stockholder';'      Personal assets are separated from business assets. Personal assets can not be part of the obligation of the corporation. When a stockholder in a corporation dies, the legal structure of the corporation remain unchanged. The surviving stockholders will, however, face the following problems\n        •   The \"LIVING INTEREST\", as represented by the surviving stockholders, will be looking to the future.\n             They will strive for growth and progress. They will regard profit as the means to expand operations,\n             enlarged merchandising facilities and increased sales. Dividends will be of secondary interest.\n        •   The \"ESTATE INTEREST\" as represented by the executor and the deceased stockholders heirs, must be\n              concerned with the need and desire for present income and will consider dividends of primary importance.\n             Unless the Will directs otherwise, the primary concern of the Executors will be to conserve the estate assets\n             and protect the heirs interests.\n     This natural conflict between interests so basically opposed is virtually unavoidable – sometimes presenting\nitself at once – sometimes later.\n     The problem is that WITHOUT a PREARRANGED PLAN for corporate continuity at death, a DOMINO principle called the \"alphabet effect\" takes over immediately and automatically  ATTORNEYS begin probate proceedings BANKERS restrict credits CREDITORS want to be paid DEBTORS withhold payments EMPLOYEES get nervous FAMILY members need cash GOVERNMENT demand taxes.\n      Every Incorporator is faced with a multitude of often–conflicting problems and solutions. This conflict arises\nbecause a Corporate Stockholder has three different roles AS OWNER, AS EMPLOYER and AS INDIVIDUAL';'')))"
        
        v?.C4.formula = "IF(AV3='SP';BE2;IF(AV3='BP';BE3;IF(AV3='S';BE4;'')))"
        v?.C5.formula = "IF(AH4='';'';IF(AV3='SP';BG2;IF(AV3='BP';BG3;IF(AV3='S';BG4;''))))"
        
        v?.AB2.formula = "AV2+0"
        
        v?.AH60.formula = "IF(OR(AH3='';AH4='');'';AH33+AH39+AH45+AH51+AH57)"
        v?.AH61.formula = "IF(OR(AH3='';AH4='');'';AC61+0)"
        v?.AH62.formula = "IF(OR(AH3='';AH4='');'';AH60-AH61)"
        v?.AH63.formula = "IF(OR(AH3='';AH4='';Y63='');0;IF(Y63>0;AW63+0;''))"
        
//        v?.D6.formula = "IF(OR(AH4='';AH5='');'';BE5)"
        
        v?.Y63.validations = [(.lessThanEqual, 20 as AnyObject, "You have exceed 20 which is the assumed number of years to save")]
        
        
        
        // Hidden Fields
//        let AV2 = NYTextField()
//        AV2.id = "AV2"
//        AV2.formula = "IF(AH2>0;ROUNDDOWN((TODAY-AH2)/365;0);'')"
//        NYParser.shared.willAppendToFields(AV2)
//        
//        let AV3 = NYTextField()
//        AV3.id = "AV3"
//        AV3.formula = "IF(AH3='Proprietor';'SP';IF(AH3='Partner';'BP';IF(AH3='Stockholder';'S';'BP')))"
//        NYParser.shared.willAppendToFields(AV3)
//
//        let AV4 = NYTextField()
//        AV4.id = "AV4"
//        AV4.formula = "IF(AH4='Retain It';'R';IF(AH4='Sell It';'S';IF(AH4='Liquidate It';'L';'L')))"
//        NYParser.shared.willAppendToFields(AV4)
//        
//        let AV5 = NYTextField()
//        AV5.id = "AV5"
//        AV5.formula = "IF(AH5='As Owner';'O';IF(AH5='As Employer';'E';IF(AH5='As Individual';'I';'O')))"
//        NYParser.shared.willAppendToFields(AV5)
//        
//        // Legends
//        
//        let AY3 = NYTextField()
//        AY3.id = "AY3"
//        AY3.text = "0"
//        AY3.value = "0"
//        AY3.formula = "IF(AND(AV3='SP';AV4='R');'SPR')"
//        NYParser.shared.willAppendToFields(AY3)
//        
//        let AY4 = NYTextField()
//        AY4.id = "AY4"
//        AY4.text = "0"
//        AY4.value = "0"
//        AY4.formula = "IF(AND(AV3='SP';AV4='S');'SPS';'0')"
//        NYParser.shared.willAppendToFields(AY4)
//        
//        let AY5 = NYTextField()
//        AY5.id = "AY5"
//        AY5.text = "0"
//        AY5.value = "0"
//        AY5.formula = "IF(AND(AV3='SP';AV4='L');'SPL';'0')"
//        NYParser.shared.willAppendToFields(AY5)
//        
//        
//        let BA2 = NYTextField()
//        BA2.id = "BA2"
//        BA2.text = "Business Partner"
//        BA2.value = "Business Partner"
//        BA2.formula = "'Business Partner'"
//        NYParser.shared.willAppendToFields(BA2)
//        
//        let BA3 = NYTextField()
//        BA3.id = "BA3"
//        BA3.text = "0"
//        BA3.value = "0"
//        BA3.formula = "IF(AND(AV3='BP';AV4='R');'BPR';'0')"
//        NYParser.shared.willAppendToFields(BA3)
//        
//        let BA4 = NYTextField()
//        BA4.id = "BA4"
//        BA4.text = "0"
//        BA4.value = "0"
//        BA4.formula = "IF(AND(AV3='BP';AV4='S');'BPS';'0')"
//        NYParser.shared.willAppendToFields(BA4)
//        
//        let BA5 = NYTextField()
//        BA5.id = "BA5"
//        BA5.text = "BPL"
//        BA5.value = "BPL"
//        BA5.formula = "IF(AND(AV3='BP';AV4='L');'BPL';'BPL')"
//        NYParser.shared.willAppendToFields(BA5)
//        
//        let BC2 = NYTextField()
//        BC2.id = "BC2"
//        BC2.text = "Stockholder"
//        BC2.value = "Stockholder"
//        BC2.formula = "'Stockholder'"
//        NYParser.shared.willAppendToFields(BC2)
//        
//        let BC3 = NYTextField()
//        BC3.id = "BC3"
//        BC3.text = "0"
//        BC3.value = "0"
//        BC3.formula = "IF(AND(AV3='S';AV4='R');'SR';'0')"
//        NYParser.shared.willAppendToFields(BC3)
//        
//        let BC4 = NYTextField()
//        BC4.id = "BC4"
//        BC4.text = "0"
//        BC4.value = "0"
//        BC4.formula = "IF(AND(AV3='S';AV4='S');'SS';'0')"
//        NYParser.shared.willAppendToFields(BC4)
//        
//        let BC5 = NYTextField()
//        BC5.id = "BC5"
//        BC5.text = "0"
//        BC5.value = "0"
//        BC5.formula = "IF(AND(AV3='S';AV4='L');'SL';'0')"
//        NYParser.shared.willAppendToFields(BC5)
//        
//        // LINES
//        let BE2 = NYTextField()
//        BE2.id = "BE2"
//        BE2.text = "What do you like to happen to your BUSINESS in the event of your pre-mature death?"
//        BE2.value = "What do you like to happen to your BUSINESS in the event of your pre-mature death?"
//        BE2.formula = "'What do you like to happen to your BUSINESS in the event of your pre-mature death?'"
//        NYParser.shared.willAppendToFields(BE2)
//        
//        let BE3 = NYTextField()
//        BE3.id = "BE3"
//        BE3.text = "What do you like to happen to your SHARE in the event of your pre-mature death?"
//        BE3.value = "What do you like to happen to your SHARE in the event of your pre-mature death?"
//        BE3.formula = "'What do you like to happen to your SHARE in the event of your pre-mature death?'"
//        NYParser.shared.willAppendToFields(BE3)
//        
//        let BE4 = NYTextField()
//        BE4.id = "BE4"
//        BE4.text = "What do you like to happen to your STOCK in the event of your pre-mature-death?"
//        BE4.value = "What do you like to happen to your STOCK in the event of your pre-mature-death?"
//        BE4.formula = "'What do you like to happen to your STOCK in the event of your pre-mature-death?'"
//        NYParser.shared.willAppendToFields(BE4)
//        
//        let BE5 = NYTextField()
//        BE5.id = "BE5"
//        BE5.formula = "IF(AV3='BP';'The Law of Partnership';IF(AV3='SP';'The Legal Position of the Sole Proprietor';IF(AV3='S';'On The Death of a Stockholder';'')))"
//        NYParser.shared.willAppendToFields(BE5)
//
//        // QUESTIONS
//        let BG2 = NYTextField()
//        BG2.id = "BG2"
//        BG2.text = "What role as Sole Proprietor would you want to face and solve when conflict arises?"
//        BG2.value = "What role as Sole Proprietor would you want to face and solve when conflict arises?"
//        BG2.formula = "'What role as Sole Proprietor would you want to face and solve when conflict arises?'"
//        NYParser.shared.willAppendToFields(BG2)
//        
//        let BG3 = NYTextField()
//        BG3.id = "BG3"
//        BG3.text = "What role as Business Partner would you want to face and solve when conflict arises?"
//        BG3.value = "What role as Business Partner would you want to face and solve when conflict arises?"
//        BG3.formula = "'What role as Business Partner would you want to face and solve when conflict arises?'"
//        NYParser.shared.willAppendToFields(BG3)
//        
//        let BG4 = NYTextField()
//        BG4.id = "BG4"
//        BG4.text = "What role as Stockholder would you want to face and solve when conflict arises?"
//        BG4.value = "What role as Stockholder would you want to face and solve when conflict arises?"
//        BG4.formula = "'What role as Stockholder would you want to face and solve when conflict arises?'"
//        NYParser.shared.willAppendToFields(BG4)
//        
//        
//        // TITLES
//        let AV6 = NYTextField()
//        AV6.id = "AV6"
//        AV6.text = "Proprietor"
//        AV6.value = "Proprietor"
//        AV6.formula = "'Proprietor'"
//        NYParser.shared.willAppendToFields(AV6)
//        
//        let AZ6 = NYTextField()
//        AZ6.id = "AZ6"
//        AZ6.text = "Partner"
//        AZ6.value = "Partner"
//        AZ6.formula = "'Partner'"
//        NYParser.shared.willAppendToFields(AZ6)
//        
//        let BD6 = NYTextField()
//        BD6.id = "BD6"
//        BD6.text = "Stockholder"
//        BD6.value = "Stockholder"
//        BD6.formula = "'Stockholder'"
//        NYParser.shared.willAppendToFields(BD6)
//        
        let AW63 = NYTextField()
        AW63.id = "AW63"
        AW63.formula = "IF(AD63=0;AH62/Y63;AH62/((1-1/(1+AD63)^Y63)/AD63*(1+AD63))/(1+AD63)^Y63)"
        NYParser.shared.willAppendToFields(AW63)
        
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
