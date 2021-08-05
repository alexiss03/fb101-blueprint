//
//  NYMITermCoversionView.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYMITermConversionViewDelegate {
    func setUpComputations()
}

class NYMITermConversionView: NYBaseSpreadsheetView {
    
    var delegate: NYMITermConversionViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var insuranceSpreadsheetView: NYSpreadsheetView!
    
    
    @IBOutlet weak var AI4: NYLabel!
    @IBOutlet weak var AI5: NYLabel!
    @IBOutlet weak var B6: NYLabel!
    @IBOutlet weak var M2: NYTextField! {
        didSet {
            self.M2.inputType = .text
        }
    }
    @IBOutlet weak var AC2: NYLabel!
    @IBOutlet weak var AJ2: NYDatePicker! {
        didSet {
            self.AJ2.inputType = .date
        }
    }

    @IBOutlet weak var AJ4: NYPickerView! {
        didSet {
            self.AJ4.inputType = .date
        }
    }
    @IBOutlet weak var AJ5: NYTextField! {
        didSet {
            self.AJ5.inputType = .amount
            self.AJ5.inputAlignment = .center
        }
    }
    @IBOutlet weak var X10: NYTextField! {
        didSet {
            self.X10.inputType = .percent
        }
    }
    
    @IBOutlet weak var F7: NYLabel!
    @IBOutlet weak var Z7: NYLabel!
    @IBOutlet weak var AE7: NYLabel!
    
    @IBOutlet weak var B33: NYLabel!
    @IBOutlet weak var C34: NYLabel!
    @IBOutlet weak var C35: NYLabel!
    @IBOutlet weak var C36: NYLabel!
    @IBOutlet weak var C37: NYLabel!
    @IBOutlet weak var C38: NYLabel!
    @IBOutlet weak var C39: NYLabel!
    @IBOutlet weak var C40: NYLabel!
    @IBOutlet weak var C41: NYLabel!
    @IBOutlet weak var C42: NYLabel!
    @IBOutlet weak var C43: NYLabel!
    
    @IBOutlet weak var B45: NYLabel!
    
    @IBOutlet weak var presenterName: NYLabel!
    @IBOutlet weak var presenterTitle: NYLabel!
    @IBOutlet weak var presenterContactNo: NYLabel!
    @IBOutlet weak var presenterEmail: NYLabel!
    @IBOutlet weak var presentationDate: NYLabel!
    
}
