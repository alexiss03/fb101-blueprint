//
//  NYEPEducationSpreadsheetView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 09/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYRPBaseViewDelegate {
    func setUpComputations()

}


class NYRPBaseView: NYBaseSpreadsheetView {
    
    var delegate: NYRPBaseViewDelegate?

    @IBOutlet internal weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var inventoriesEducational: NYSpreadsheetView!

    @IBOutlet weak var futureCostTuitionFees: NYSpreadsheetView!
    
    //ROW1
    @IBOutlet weak var r1Lbl1: NYLabel!
    @IBOutlet weak var r1Lbl2: NYLabel!
    @IBOutlet weak var r1TField1: NYTextField! {
        didSet {
            r1TField1.inputType = .text
        }
    }
    
    //ROW2
    @IBOutlet weak var r2Lbl1: NYLabel!
    
    
    //ROW3
    @IBOutlet weak var r3Lbl1: NYLabel!
    @IBOutlet weak var r3Lbl2: NYLabel!
    
    
    //ROW4
    @IBOutlet weak var r4TField1: NYTextField! {
        didSet {
            r4TField1.isUserInteractionEnabled = false
            r4TField1.inputType = .amount
        }
    }
    @IBOutlet weak var r4Lbl1: NYLabel!
    
    
    //ROW5 Less: Educational Fund
    @IBOutlet weak var r5TField1: NYTextField!{
        didSet {
            r5TField1.isUserInteractionEnabled = false
            r5TField1.inputType = .amount
        }
    }
    @IBOutlet weak var r5Lbl1: NYLabel!
    
    
    //ROW6
    @IBOutlet weak var r6TField1: NYTextField!{
        didSet {
            r6TField1.isUserInteractionEnabled = false
            r6TField1.inputType = .amount
        }
    }
        
    
    @IBOutlet weak var r6Lbl1: NYLabel!
    
    
    //ROW7 - Birthday
    @IBOutlet weak var r7Lbl1: NYLabel!
    @IBOutlet weak var r7TField1: NYTextField!{
        didSet {
            r7TField1.inputType = .percent
        }
    }
    @IBOutlet weak var r7Lbl2: NYLabel!
    
    
    //ROW8 - Savings
    @IBOutlet weak var r8TField1: NYDatePicker!
    @IBOutlet weak var r8TField2: NYTextField! {
        didSet {
            r8TField2.inputType = .percent
        }
    }
    @IBOutlet weak var r8TField3: NYTextField! {
        didSet {
            r8TField3.inputType = .amount
        }
    }
    @IBOutlet weak var r8TField4: NYTextField!  {
        didSet {
            r8TField4.inputType = .percent
        }
    }
    @IBOutlet weak var r8Lbl1: NYLabel!
    
    
    //ROW9 - Years of High School Level
    @IBOutlet weak var r9TField1: NYTextField! {
        didSet {
            r9TField1.inputType = .year
        }
    }
    @IBOutlet weak var r9Lbl1: NYLabel!
    @IBOutlet weak var r9Lbl2: NYLabel!
    @IBOutlet weak var r9Lbl3: NYLabel!
    @IBOutlet weak var r9Lbl4: NYLabel!
    
    
    //ROW10 - Started Working
    @IBOutlet weak var r10TField1: NYTextField! {
        didSet {
            r10TField1.isUserInteractionEnabled = false
            r10TField1.isPreloadedVal = true
            r10TField1.preloadedVal = "0"
        }
    }
    @IBOutlet weak var r10TField2: NYTextField! {
        didSet {
            r10TField2.inputType = .year
        }
    }
    
    @IBOutlet weak var r10TField3: NYTextField! {
        didSet {
            r10TField3.inputType = .year
            r10TField3.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var r10TField4: NYTextField! {
        didSet {
            r10TField4.inputType = .year
        }
    }
    
    @IBOutlet weak var r10TField5: NYTextField! {
        didSet {
            r10TField5.inputType = .year
        }
    }
    @IBOutlet weak var r10Lbl1: NYLabel!
    @IBOutlet weak var r10Lbl2: NYLabel!
    @IBOutlet weak var r10Lbl3: NYLabel!
    @IBOutlet weak var r10Lbl4: NYLabel!
    @IBOutlet weak var r10Lbl5: NYLabel!
    

    //ROW11 - 2 2 16
    @IBOutlet weak var r11Lbl1: NYLabel!
    @IBOutlet weak var r11Lbl2: NYLabel!
    @IBOutlet weak var r11Lbl3: NYLabel!
    @IBOutlet weak var r11Lbl4: NYLabel!
    
    
    //ROW12 - Required Savings's For My Child's Educational
    @IBOutlet weak var r12Lbl1: NYLabel!
    @IBOutlet weak var r12Lbl2: NYLabel!
    
    
    //ROW13 - Accelerated Savinsgs Period
    @IBOutlet weak var r13Lbl1: NYLabel!
    @IBOutlet weak var r13TField1: NYTextField! {
        didSet {
            r13TField1.inputType = .year
        }
    }
    @IBOutlet weak var r13TField2: NYTextField! {
        didSet {
            r13TField2.inputType = .amount
        }
    }
    @IBOutlet weak var r13Lbl2: NYLabel!
    @IBOutlet weak var r13TField3: NYTextField! {
        didSet {
            r13TField3.isUserInteractionEnabled = false
            r13TField3.inputType = .amount
        }
    }
    @IBOutlet weak var r13Lbl3: NYLabel!

    
    //ROW14 - Graduated Savings Rate
    @IBOutlet weak var r14Lbl1: NYLabel!
    @IBOutlet weak var r14TField1: NYTextField! {
        didSet {
            self.r14TField1.inputType = .percent
        }
    }
    @IBOutlet weak var r14TField2: NYTextField! {
        didSet {
            self.r14TField2.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var r14Lbl2: NYLabel!
    @IBOutlet weak var r14TField3: NYTextField! {
        didSet {
            r14TField3.inputType = .amount
            r14TField3.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var r14Lbl3: NYLabel!

    
    //ROW15 - Present Value of Tuition Fee
    @IBOutlet weak var r15Lbl1: NYLabel!
    @IBOutlet weak var r15Lbl2: NYLabel! {
        didSet {
            r15Lbl2.isPreloadedVal = true
        }
    }
    
    
    //ROW16 - Annual Tuition Fee
    @IBOutlet weak var r16Lbl1: NYLabel!
    @IBOutlet weak var r16TField1: NYTextField! {
        didSet {
            r16TField1.isUserInteractionEnabled  = false
            r16TField1.inputType = .amount
        }
        
    }
    @IBOutlet weak var r16TField2: NYTextField!{
        didSet {
            r16TField2.isUserInteractionEnabled  = false
            r16TField2.inputType = .amount
        }
    }
    
    @IBOutlet weak var r16Lbl2: NYLabel!
    
    //ROW17 - Two Semestral School
    @IBOutlet weak var r17Lbl1: NYLabel!
    @IBOutlet weak var r17TField1: NYTextField!{
        didSet {
            r17TField1.isUserInteractionEnabled  = false
            r17TField1.inputType = .amount
        }
    }
    @IBOutlet weak var r17TField2: NYTextField! {
        didSet {
            self.r17TField2.inputType = .percent
        }
    }
    @IBOutlet weak var r17TField3: NYTextField!{
        didSet {
            r17TField3.isUserInteractionEnabled  = false
            r17TField3.inputType = .amount
        }
    }
    @IBOutlet weak var r17TField4: NYPickerView!
    
    @IBOutlet weak var r17Lbl2: NYLabel!
    
    
    //ROW18 - Inventories of Educational
    @IBOutlet weak var r18Lbl1: NYLabel!
    @IBOutlet weak var r18Lbl2: NYLabel!
    
    @IBOutlet weak var r18Lbl3: NYLabel!
    
    //ROW19 - Total Investment
    @IBOutlet weak var r19TField1: NYTextField! {
        didSet{
            r19TField1.inputType = .amount
            r19TField1.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var r19TField2: NYTextField!{
        didSet{
            r19TField2.inputType = .amount
            r19TField2.isUserInteractionEnabled = false
        }
    }

    
    @IBOutlet weak var r20TField1: NYTextField!{
        didSet{
            r20TField1.inputType = .amount
            r20TField1.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var r20TField2: NYTextField! {
        didSet{
            r20TField2.inputType = .amount
            r20TField2.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var presenterNameLbl: NYLabel! {
        didSet {
            presenterNameLbl.isPreloadedVal = true
        }
    }
    
    @IBOutlet weak var roleLbl: NYLabel! {
        didSet {
            roleLbl.isPreloadedVal = true
        }
    }
    
    @IBOutlet weak var contactNumberLbl: NYLabel! {
        didSet {
            contactNumberLbl.isPreloadedVal = true
        }
    }
    
    @IBOutlet weak var emailAddressLbl: NYLabel! {
        didSet {
            emailAddressLbl.isPreloadedVal = true
        }
    }
    
    @IBOutlet weak var datePresentedLbl: NYLabel!{
        didSet {
            datePresentedLbl.isPreloadedVal = true
        }
    }
    
    
}
