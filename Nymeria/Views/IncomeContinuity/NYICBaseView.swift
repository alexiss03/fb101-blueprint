//
//  NYICBaseView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 01/08/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYICBaseViewDelegate {
    func setUpComputations()
    
}


class NYICBaseView: NYBaseSpreadsheetView {
    
    var delegate: NYICBaseViewDelegate?
    
    @IBOutlet internal weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    @IBOutlet weak var inventoriesEducational: NYSpreadsheetView!
    
    @IBOutlet weak var futureCostTuitionFees: NYSpreadsheetView!
    
    
    @IBOutlet weak var M2: NYTextField! {
        didSet {
            M2.inputType = .text
        }
    }
    
    
    @IBOutlet weak var R5: NYTextField!{
        didSet {
            R5.inputType = .amount
            R5.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var R6: NYTextField!{
        didSet {
            R6.inputType = .amount
            R6.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var R7: NYTextField!{
        didSet {
            R7.inputType = .amount
            R7.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var C9: NYDatePicker!{
        didSet {
            C9.inputType = .date
        }
    }
    @IBOutlet weak var J9: NYTextField!{
        didSet {
            J9.inputType = .amount
        }
    }
    @IBOutlet weak var AD8: NYTextField!{
        didSet {
            AD8.inputType = .percent
        }
    }
    @IBOutlet weak var AD9: NYTextField!{
        didSet {
            AD9.inputType = .percent
        }
    }
    @IBOutlet weak var AC10: NYLabel!
    @IBOutlet weak var AD10: NYTextField!{
        didSet {
            AD10.inputType = .amount
        }
    }
    
    @IBOutlet weak var C13: NYTextField!{
        didSet {
            C13.inputType = .amount
            C13.isUserInteractionEnabled = false
            C13.isPreloadedVal = true
            C13.preloadedVal = "0"
        }
    }
    
    @IBOutlet weak var J13: NYTextField!{
        didSet {
            J13.inputType = .amount
        }
    }
    @IBOutlet weak var J14: NYLabel!
    
    @IBOutlet weak var O13: NYTextField!{
        didSet {
            O13.inputType = .amount
            O13.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var O14: NYTextField!{
        didSet {
            O14.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var U13: NYTextField!{
        didSet {
            U13.inputType = .amount
        }
    }
    @IBOutlet weak var U14: NYLabel!
    
    @IBOutlet weak var AB13: NYTextField!{
        didSet {
            AB13.inputType = .amount
        }
    }
    @IBOutlet weak var AB14: NYLabel!
    
    
    @IBOutlet weak var AK13: NYTextField!{
        didSet {
            AK13.inputType = .amount
            AK13.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AK14: NYLabel!
    
    @IBOutlet weak var J18: NYTextField!{
        didSet {
            J18.inputType = .amount
        }
    }
    @IBOutlet weak var L18: NYTextField!{
        didSet {
            L18.inputType = .amount
            L18.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var L19: NYTextField!{
        didSet {
            L19.inputType = .amount
            L19.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var R18: NYTextField!{
        didSet {
            R18.inputType = .amount
            R18.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var R20: NYTextField!{
        didSet {
            R20.inputType = .amount
            R20.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var V20: NYLabel!
    
    @IBOutlet weak var V18: NYLabel!
    
    @IBOutlet weak var Z18: NYTextField!{
        didSet {
            Z18.inputType = .amount
        }
    }
    @IBOutlet weak var Z19: NYTextField!{
        didSet {
            Z19.inputType = .amount
        }
    }
    @IBOutlet weak var Z20: NYTextField!{
        didSet {
            Z20.inputType = .amount
            Z20.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z21: NYTextField!{
        didSet {
            Z21.inputType = .amount
            Z21.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var R30: NYTextField!{
        didSet {
            R30.inputType = .amount
            R30.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var R34: NYTextField!{
        didSet {
            R34.inputType = .amount
        }
    }
    @IBOutlet weak var R35: NYTextField!{
        didSet {
            R35.inputType = .amount
        }
    }
    @IBOutlet weak var R36: NYTextField!{
        didSet {
            R36.inputType = .amount
        }
    }
    @IBOutlet weak var R37: NYTextField!{
        didSet {
            R37.inputType = .amount
        }
    }
    @IBOutlet weak var R38: NYTextField!{
        didSet {
            R38.inputType = .amount
            R38.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var L40: NYTextField!{
        didSet {
            L40.inputType = .amount
            L40.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var AF40: NYTextField!{
        didSet {
            AF40.inputType = .amount
            AF40.isUserInteractionEnabled = false
        }
    }
    
    
    //CHANGE TEXT ONLY
    
    @IBOutlet weak var B2: NYLabel!
    @IBOutlet weak var AC2: NYLabel!
    @IBOutlet weak var B3: NYLabel!
    @IBOutlet weak var B4: NYLabel!
    @IBOutlet weak var R4: NYLabel!
    @IBOutlet weak var V5: NYLabel!
    @IBOutlet weak var V6: NYLabel!
    @IBOutlet weak var V7: NYLabel!
    @IBOutlet weak var AF10: NYLabel!
    
    @IBOutlet weak var N14: NYLabel!
    @IBOutlet weak var O17: NYLabel!
    
    
    @IBOutlet weak var Z17: NYLabel!
    
    
    @IBOutlet weak var AD18: NYLabel!
    @IBOutlet weak var AD19: NYLabel!
    @IBOutlet weak var AD20: NYLabel!
    @IBOutlet weak var AD21: NYLabel!
    
    @IBOutlet weak var C24: UILabel!
    @IBOutlet weak var C33: UILabel!
    
    @IBOutlet weak var presenterNameLbl: NYLabel!
    @IBOutlet weak var roleLbl: NYLabel!
    @IBOutlet weak var contactNumberLbl: NYLabel!
    @IBOutlet weak var emailAddressLbl: NYLabel!
    @IBOutlet weak var datePresentedLbl: NYLabel!

}
