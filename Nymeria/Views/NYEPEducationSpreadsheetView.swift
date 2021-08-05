//
//  NYEPEducationSpreadsheetView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 17/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYEPEducationSpreadsheetView: NYBaseSpreadsheetView {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var spiralingFutureSpreadsheet1: NYSpreadsheetView!
    @IBOutlet weak var spiralingFutureSpreadsheet2: NYSpreadsheetView!
    @IBOutlet weak var spiralingFutureSpreadsheet3: NYSpreadsheetView!
    
    
    @IBOutlet weak var addBtn: UIButton! {
        didSet {
            addBtn.layer.cornerRadius = 23
        }
    }
    
    
    @IBOutlet weak var S2: NYTextField!{
        didSet {
            S2.inputType = .text
        }
    }
    
    
    @IBOutlet weak var N4: NYTextField!{
        didSet {
            N4.inputType = .text
        }
    }
    @IBOutlet weak var Z4: NYTextField!{
        didSet {
            Z4.inputType = .text
        }
    }
    @IBOutlet weak var AL4: NYTextField!{
        didSet {
            AL4.inputType = .text
        }
    }
    
    @IBOutlet weak var L5: NYLabel!
    @IBOutlet weak var X5: NYLabel!
    @IBOutlet weak var AJ5: NYLabel!
    
    @IBOutlet weak var N5: NYPickerView!{
        didSet {
            N5.inputType = .text
        }
    }
    @IBOutlet weak var Z5: NYPickerView!{
        didSet {
            Z5.inputType = .text
        }
    }
    @IBOutlet weak var AL5: NYPickerView!{
        didSet {
            AL5.inputType = .text
        }
    }
    
    
    @IBOutlet weak var L6: NYLabel!
    @IBOutlet weak var X6: NYLabel!
    @IBOutlet weak var AJ6: NYLabel!
    
    @IBOutlet weak var N6: NYDatePicker!
    @IBOutlet weak var Z6: NYDatePicker!
    @IBOutlet weak var AL6: NYDatePicker!
    
    @IBOutlet weak var L7: NYLabel!
    @IBOutlet weak var X7: NYLabel!
    @IBOutlet weak var AJ7: NYLabel!
    
    @IBOutlet weak var M6: NYLabel!
    @IBOutlet weak var Y6: NYLabel!
    @IBOutlet weak var AK6: NYLabel!
    
    
    @IBOutlet weak var N7: NYTextField! {
        didSet {
            N7.inputType = .year
        }
    }
    @IBOutlet weak var Z7: NYTextField!{
        didSet {
            Z7.inputType = .year
        }
    }
    @IBOutlet weak var AL7: NYTextField!{
        didSet {
            AL7.inputType = .year
        }
    }
    
    
    
    @IBOutlet weak var L8: NYLabel!
    @IBOutlet weak var X8: NYLabel!
    @IBOutlet weak var AJ8: NYLabel!
    
    
    @IBOutlet weak var N8: NYTextField!{
        didSet {
            N8.inputType = .amount
        }
    }
    @IBOutlet weak var Z8: NYTextField!{
        didSet {
            Z8.inputType = .amount
        }
    }
    @IBOutlet weak var AL8: NYTextField!{
        didSet {
            AL8.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var L9: NYLabel!
    @IBOutlet weak var X9: NYLabel!
    @IBOutlet weak var AJ9: NYLabel!
    
    @IBOutlet weak var N9: NYTextField!{
        didSet {
            N9.inputType = .percent
        }
    }
    @IBOutlet weak var Z9: NYTextField!{
        didSet {
            Z9.inputType = .percent
        }
    }
    @IBOutlet weak var AL9: NYTextField!{
        didSet {
            AL9.inputType = .percent
        }
    }
    
    
    @IBOutlet weak var L10: NYLabel!
    @IBOutlet weak var X10: NYLabel!
    @IBOutlet weak var AJ10: NYLabel!
    
    
    @IBOutlet weak var N10: NYTextField!{
        didSet {
            N10.inputType = .year
        }
    }
    @IBOutlet weak var Z10: NYTextField!{
        didSet {
            Z10.inputType = .year
        }
    }
    @IBOutlet weak var AL10: NYTextField!{
        didSet {
            AL10.inputType = .year
        }
    }
    
    @IBOutlet weak var L11: NYLabel!
    @IBOutlet weak var X11: NYLabel!
    @IBOutlet weak var AJ11: NYLabel!
    
    
    @IBOutlet weak var N11: NYTextField!{
        didSet {
            N11.inputType = .amount
            N11.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z11: NYTextField!{
        didSet {
            Z11.inputType = .amount
            Z11.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL11: NYTextField!{
        didSet {
            AL11.inputType = .amount
            AL11.isUserInteractionEnabled = false
        }
    }
    
    
    
    //THE SPIRALING FUTURE COST OF TUITION FEES
    @IBOutlet weak var N23: NYTextField!{
        didSet {
            N23.inputType = .amount
            N23.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z23: NYTextField!{
        didSet {
            Z23.inputType = .amount
            Z23.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL23: NYTextField!{
        didSet {
            AL23.inputType = .amount
            AL23.isUserInteractionEnabled = false
        }
    }
    
    
    
    //INVENTORIES OF MY CHILDREN'S EDUCATION
    @IBOutlet weak var N26: NYTextField!{
        didSet {
            N26.inputType = .amount
        }
    }
    @IBOutlet weak var Z26: NYTextField!{
        didSet {
            Z26.inputType = .amount
        }
    }
    @IBOutlet weak var AL26: NYTextField!{
        didSet {
            AL26.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var L26: NYLabel!
        @IBOutlet weak var X26: NYLabel!
    @IBOutlet weak var AJ26: NYLabel!
    
    
    
    @IBOutlet weak var N27: NYTextField!{
        didSet {
            N27.inputType = .amount
        }
    }
    @IBOutlet weak var Z27: NYTextField!{
        didSet {
            Z27.inputType = .amount
        }
    }
    @IBOutlet weak var AL27: NYTextField!{
        didSet {
            AL27.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var M27: NYTextField! {
        didSet {
            M27.inputType = .percent
        }
    }
    
    
    
    @IBOutlet weak var Y27: NYTextField! {
        didSet {
            Y27.inputType = .percent
        }
    }
    @IBOutlet weak var AK27: NYTextField! {
        didSet {
            AK27.inputType = .percent
        }
    }
    
    

    
    @IBOutlet weak var N28: NYTextField!{
        didSet {
            N28.inputType = .amount
        }
    }
    @IBOutlet weak var Z28: NYTextField!{
        didSet {
            Z28 .inputType = .amount
        }
    }
    @IBOutlet weak var AL28: NYTextField!{
        didSet {
            AL28.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var M28: NYTextField! {
        didSet {
            M28.inputType = .percent
        }
    }
    
    
    @IBOutlet weak var Y28: NYTextField! {
        didSet {
            Y28.inputType = .percent
        }
    }
    @IBOutlet weak var AK28: NYTextField! {
        didSet {
            AK28.inputType = .percent
        }
    }
    
    
    
    
    @IBOutlet weak var N29: NYTextField!{
        didSet {
            N29.inputType = .amount
            N29.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z29: NYTextField!{
        didSet {
            Z29.inputType = .amount
            Z29.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL29: NYTextField!{
        didSet {
            AL29.inputType = .amount
            AL29.isUserInteractionEnabled = false
        }
    }
    
    
    
    @IBOutlet weak var N30: NYTextField!{
        didSet {
            N30.inputType = .amount
            N30.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z30: NYTextField!{
        didSet {
            Z30.inputType = .amount
            Z30.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL30: NYTextField!{
        didSet {
            AL30.inputType = .amount
            AL30.isUserInteractionEnabled = false
        }
    }
    
    
    //REQUIRED SAVINGS FOR MY CHILDREN'S EDUCATIONAL NEED TODAY
    @IBOutlet weak var N32: NYTextField!{
        didSet {
            N32.inputType = .year
        }
    }
    @IBOutlet weak var Z32: NYTextField!{
        didSet {
            Z32.inputType = .year
        }
    }
    @IBOutlet weak var AL32: NYTextField!{
        didSet {
            AL32.inputType = .year
        }
    }
    
    
    
    @IBOutlet weak var M32: NYLabel!
    @IBOutlet weak var Y32: NYLabel!
    @IBOutlet weak var AK32: NYLabel!
    
    
    
    @IBOutlet weak var N33: NYTextField!{
        didSet {
            N33.inputType = .percent
        }
    }
    @IBOutlet weak var Z33: NYTextField!{
        didSet {
            Z33.inputType = .percent
        }
    }
    @IBOutlet weak var AL33: NYTextField!{
        didSet {
            AL33.inputType = .percent
        }
    }
    
    
    @IBOutlet weak var N34: NYTextField!{
        didSet {
            N34.inputType = .amount
            N34.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z34: NYTextField!{
        didSet {
            Z34.inputType = .amount
            Z34.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL34: NYTextField!{
        didSet {
            AL34.inputType = .amount
            AL34.isUserInteractionEnabled = false
        }
    }
    
    
    
    @IBOutlet weak var N35: NYTextField!{
        didSet {
            N35.inputType = .amount
        }
    }
    @IBOutlet weak var Z35: NYTextField!{
        didSet {
            Z35.inputType = .amount
        }
    }
    @IBOutlet weak var AL35: NYTextField!{
        didSet {
            AL35.inputType = .amount
        }
    }
    
    
    @IBOutlet weak var M35: NYLabel!
    @IBOutlet weak var Y35: NYLabel!
    @IBOutlet weak var AK35: NYLabel!
    
    
    
    @IBOutlet weak var N36: NYTextField!{
        didSet {
            N36.inputType = .amount
            N36.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z36: NYTextField!{
        didSet {
            Z36.inputType = .amount
            Z36.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL36: NYTextField!{
        didSet {
            AL36.inputType = .amount
            AL36.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var N37: NYTextField!{
        didSet {
            N37.inputType = .percent
        }
    }
    @IBOutlet weak var Z37: NYTextField!{
        didSet {
            Z37.inputType = .percent
        }
    }
    @IBOutlet weak var AL37: NYTextField!{
        didSet {
            AL37.inputType = .percent
        }
    }
    
    @IBOutlet weak var N39: NYTextField!{
        didSet {
            N39.inputType = .amount
            N39.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var Z39: NYTextField!{
        didSet {
            Z39.inputType = .amount
            Z39.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var AL39: NYTextField!{
        didSet {
            AL39.inputType = .amount
            AL39.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var presenterNameLbl: NYLabel!
    @IBOutlet weak var roleLbl: NYLabel!
    @IBOutlet weak var contactNumberLbl: NYLabel!
    @IBOutlet weak var emailAddressLbl: NYLabel!
    @IBOutlet weak var datePresentedLbl: NYLabel!
    
}
