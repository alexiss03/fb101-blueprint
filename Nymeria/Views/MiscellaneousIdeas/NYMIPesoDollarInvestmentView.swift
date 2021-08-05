//
//  NYMIPesoDollarInvestmentView.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYMIPesoDollarInvestmentViewDelegate {
    func setUpComputations()
}

class NYMIPesoDollarInvestmentView: NYBaseSpreadsheetView {
    
    var delegate: NYMIPesoDollarInvestmentViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var investmentSpreadSheetView: NYSpreadsheetView!
    
    @IBOutlet weak var P2: NYTextField!
    @IBOutlet weak var AJ2: NYLabel!
    
    
    // REQUIRED INPUT FIELDS
    @IBOutlet weak var B4: NYPickerView!
    @IBOutlet weak var B5: NYTextField! {
        didSet {
            self.B5.inputType = .amount
        }
    }
    @IBOutlet weak var B6: NYTextField! {
        didSet {
            self.B6.inputType = .amount
        }
    }
    @IBOutlet weak var B7: NYTextField!
    
    @IBOutlet weak var V4: NYDatePicker!
    @IBOutlet weak var V5: NYTextField! {
        didSet {
            self.V5.inputType = .year
        }
    }

    @IBOutlet weak var V6: NYTextField! {
        didSet {
            self.V6.inputType = .percent
        }
    }
    @IBOutlet weak var V7: NYTextField! {
        didSet {
            self.V7.inputType = .percent
        }
    }
    
    @IBOutlet weak var H7: NYLabel!
    
    // TABLE HEADER
    @IBOutlet weak var D12: NYLabel!
    @IBOutlet weak var H12: NYLabel!
    @IBOutlet weak var J10: NYLabel!
    @IBOutlet weak var P10: NYLabel!
    @IBOutlet weak var AB10: NYLabel!
    
    // PRESENTOR'S INFORMATION
//    @IBOutlet weak var F9: NYTextField!
//    @IBOutlet weak var R9: NYTextField!
//    @IBOutlet weak var AD9: NYTextField!
    
}
