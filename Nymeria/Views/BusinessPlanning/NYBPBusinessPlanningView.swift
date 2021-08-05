//
//  NYBPBusinessPlanningView.swift
//  Nymeria
//
//  Created by Mac on 7/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYBPBusinessPlanningViewDelegate {
    func setUpComputations()
}

class NYBPBusinessPlanningView: NYBaseSpreadsheetView {
    
    var delegate: NYBPBusinessPlanningViewDelegate?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var AB2: NYLabel!
    @IBOutlet weak var C4: NYLabel! {
        didSet {
            C4.isPreloadedVal = true
        }
    }
    @IBOutlet weak var C5: NYLabel! {
        didSet {
            C5.isPreloadedVal = true
        }
    }
    @IBOutlet weak var AH2: NYDatePicker! {
        didSet {
            self.AH2.inputType = .date
        }
    }
    @IBOutlet weak var AH3: NYPickerView! {
        didSet {
            self.AH3.inputType = .text
            self.AH3.inputAlignment = .center
        }
    }
    @IBOutlet weak var AH4: NYPickerView! {
        didSet {
            self.AH4.inputType = .text
            self.AH4.inputAlignment = .center
        }
    }
    @IBOutlet weak var AH5: NYPickerView! {
        didSet {
            self.AH5.inputType = .text
            self.AH5.inputAlignment = .center
        }
    }
    
    @IBOutlet weak var D6: NYLabel! {
        didSet {
            self.D6.isPreloadedVal = true
        }
    }
    @IBOutlet weak var D7: NYLabel! {
        didSet {
            self.D7.isPreloadedVal = true
        }
    }
    
    @IBOutlet weak var D26: NYLabel!
    
    @IBOutlet weak var AH33: NYTextField! {
        didSet {
            self.AH33.inputType = .amount
        }
    }
    @IBOutlet weak var AH39: NYTextField! {
        didSet {
            self.AH39.inputType = .amount
        }
    }
    @IBOutlet weak var AH45: NYTextField! {
        didSet {
            self.AH45.inputType = .amount
        }
    }
    @IBOutlet weak var AH51: NYTextField! {
        didSet {
            self.AH51.inputType = .amount
        }
    }

    @IBOutlet weak var AH57: NYTextField! {
        didSet {
            self.AH57.inputType = .amount
        }
    }

    @IBOutlet weak var AH60: NYTextField! {
        didSet {
            self.AH60.inputType = .amount
        }
    }

    @IBOutlet weak var AH61: NYTextField! {
        didSet {
            self.AH61.inputType = .amount
        }
    }

    @IBOutlet weak var AH62: NYTextField! {
        didSet {
            self.AH62.inputType = .amount
        }
    }

    @IBOutlet weak var AH63: NYTextField! {
        didSet {
            self.AH63.inputType = .amount
        }
    }

    
    @IBOutlet weak var AC61: NYTextField! {
        didSet {
            self.AC61.inputType = .amount
        }
    }
    
    @IBOutlet weak var Y63: NYTextField! {
        didSet {
            self.Y63.inputType = .amount
            self.Y63.inputAlignment = .center
        }
    }
    
    @IBOutlet weak var AD63: NYTextField! {
        didSet {
            self.AD63.inputType = .percent
        }
    }
    
    
    @IBOutlet weak var L2: NYTextField! {
        didSet {
            self.L2.inputType = .text
        }
    }
    
    // Presentor Details
    @IBOutlet weak var presenterName: NYLabel! {
        didSet {
            presenterName.isPreloadedVal = true
        }
    }
    @IBOutlet weak var presenterTitle: NYLabel!{
        didSet {
            presenterTitle.isPreloadedVal = true
        }
    }
    @IBOutlet weak var presenterContactNo: NYLabel!{
        didSet {
            presenterContactNo.isPreloadedVal = true
        }
    }
    @IBOutlet weak var presenterEmail: NYLabel!{
        didSet {
            presenterEmail.isPreloadedVal = true
        }
    }
    @IBOutlet weak var presentationDate: NYLabel!{
        didSet {
            presentationDate.isPreloadedVal = true
        }
    }
    
}
