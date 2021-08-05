//
//  NYEPEstatePlanningView.swift
//  Nymeria
//
//  Created by Mac on 7/9/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYEPEstatePlanningViewDelegate {
    func setUpComputations()
}

class NYEPEstatePlanningView: NYBaseSpreadsheetView {
    
    var delegate: NYEPEstatePlanningViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var AA2: NYLabel!
    @IBOutlet weak var AB2: NYLabel!
    
    // Taxable Estate Values
    @IBOutlet weak var ecAssetsView: UIView!
    @IBOutlet weak var eaAssetsView: UIView!
    
    
    // Current Status 1
    @IBOutlet weak var AA14: NYPickerView!
    
    @IBOutlet weak var AA16: NYTextField!
    @IBOutlet weak var AA17: NYTextField!
    @IBOutlet weak var AA18: NYTextField!
    @IBOutlet weak var AA19: NYTextField!
    @IBOutlet weak var AA20: NYTextField!
    @IBOutlet weak var AA22: NYTextField!
    @IBOutlet weak var AA23: NYTextField!
    @IBOutlet weak var AA24: NYTextField!
    @IBOutlet weak var AA26: NYTextField!
    @IBOutlet weak var AA29: NYTextField!
    @IBOutlet weak var AA30: NYTextField!
    @IBOutlet weak var AA31: NYTextField!
    @IBOutlet weak var AA32: NYTextField!
    @IBOutlet weak var AA33: NYTextField!
    
    @IBOutlet weak var AA34: NYTextField!
    @IBOutlet weak var AA35: NYTextField!
    @IBOutlet weak var AA36: NYTextField!
    @IBOutlet weak var AA37: NYTextField!
    @IBOutlet weak var AA38: NYTextField!
    
    @IBOutlet weak var AA42: NYTextField!
    @IBOutlet weak var AA43: NYTextField!
    @IBOutlet weak var AA44: NYTextField!
    @IBOutlet weak var AA45: NYTextField!
    @IBOutlet weak var AA46: NYTextField!
    
    @IBOutlet weak var AA48: NYTextField!
    @IBOutlet weak var AA49: NYTextField!
    @IBOutlet weak var AA50: NYTextField!
    @IBOutlet weak var AA51: NYTextField!
    @IBOutlet weak var AA52: NYTextField!
    
    @IBOutlet weak var AA54: NYTextField!
    @IBOutlet weak var AA55: NYTextField!
    
    // Current Status 2
    @IBOutlet weak var AG14: NYPickerView!
    @IBOutlet weak var AL14: NYTextField!
    @IBOutlet weak var AG15: NYLabel!
    
    @IBOutlet weak var AG16: NYTextField!
    @IBOutlet weak var AG17: NYTextField!
    @IBOutlet weak var AG18: NYTextField!
    @IBOutlet weak var AG19: NYTextField!
    @IBOutlet weak var AG20: NYTextField!
    
    @IBOutlet weak var AG22: NYTextField!
    @IBOutlet weak var AG23: NYTextField!
    @IBOutlet weak var AG24: NYTextField!
    
    @IBOutlet weak var AG26: NYTextField!
    
    @IBOutlet weak var AG29: NYTextField!
    @IBOutlet weak var AG30: NYTextField!
    @IBOutlet weak var AG31: NYTextField!
    @IBOutlet weak var AG32: NYTextField!
    @IBOutlet weak var AG33: NYTextField!
    @IBOutlet weak var AG34: NYTextField!
    @IBOutlet weak var AG35: NYTextField!
    @IBOutlet weak var AG36: NYTextField!
    @IBOutlet weak var AG37: NYTextField!
    @IBOutlet weak var AG38: NYTextField!
    
    @IBOutlet weak var AG42: NYTextField!
    @IBOutlet weak var AG43: NYTextField!
    @IBOutlet weak var AG44: NYTextField!
    @IBOutlet weak var AG45: NYTextField!
    @IBOutlet weak var AG46: NYTextField!
    
    @IBOutlet weak var AG48: NYTextField!
    @IBOutlet weak var AG49: NYTextField!
    @IBOutlet weak var AG50: NYTextField!
    @IBOutlet weak var AG51: NYTextField!
    @IBOutlet weak var AG52: NYTextField!
    
    @IBOutlet weak var AG54: NYTextField!
    @IBOutlet weak var AG55: NYTextField!
    
    @IBOutlet weak var AA57: NYTextField!
    @IBOutlet weak var AA58: NYTextField!
    @IBOutlet weak var AG57: NYTextField!
    @IBOutlet weak var AG58: NYTextField!
    
    // Liabilities and Net Estate
    @IBOutlet weak var U57: NYTextField!
    @IBOutlet weak var U58: NYTextField!
    
    // Labels
    @IBOutlet weak var D26: NYLabel!
    @IBOutlet weak var Y38: NYLabel!
    @IBOutlet weak var X40: NYLabel!
    @IBOutlet weak var D41: NYLabel!
    @IBOutlet weak var D57: NYLabel!
    @IBOutlet weak var D58: NYLabel!
    
    // Planning Method View
    @IBOutlet weak var planningMethodTitle: NYLabel!
    @IBOutlet weak var planningMethodLabel: NYLabel!
    @IBOutlet weak var planningMethodContent: NYLabel!
    
    @IBOutlet weak var B68: NYLabel!
    @IBOutlet weak var B69: NYLabel!
    @IBOutlet weak var B70: NYLabel!
    @IBOutlet weak var C71: NYLabel!
    
    // Required Fields
    @IBOutlet weak var P2: NYTextField! {
        didSet {
            self.P2.inputType = .text
        }
    }
    
    @IBOutlet weak var AG2: NYDatePicker! {
        didSet {
            self.AG2.inputType = .date
        }
    }
    
    @IBOutlet weak var K16: NYTextField! {
        didSet {
            self.K16.inputType = .amount
        }
    }
    @IBOutlet weak var K17: NYTextField! {
        didSet {
            self.K17.inputType = .amount
        }
    }
    @IBOutlet weak var K18: NYTextField! {
        didSet {
            self.K18.inputType = .amount
        }
    }
    @IBOutlet weak var K19: NYTextField! {
        didSet {
            self.K19.inputType = .amount
        }
    }
    @IBOutlet weak var K20: NYTextField!
    
    @IBOutlet weak var K22: NYTextField! {
        didSet {
            self.K22.inputType = .amount
        }
    }
    @IBOutlet weak var K23: NYTextField! {
        didSet {
            self.K23.inputType = .amount
        }
    }
    @IBOutlet weak var K24: NYTextField!
    
    @IBOutlet weak var K33: NYTextField! {
        didSet {
            self.K33.inputType = .amount
        }
    }
    
    @IBOutlet weak var P16: NYTextField! {
        didSet {
            self.P16.inputType = .amount
        }
    }
    @IBOutlet weak var P17: NYTextField! {
        didSet {
            self.P17.inputType = .amount
        }
    }
    @IBOutlet weak var P18: NYTextField! {
        didSet {
            self.P18.inputType = .amount
        }
    }
    @IBOutlet weak var P19: NYTextField! {
        didSet {
            self.P19.inputType = .amount
        }
    }
    @IBOutlet weak var P20: NYTextField!
    
    @IBOutlet weak var P22: NYTextField! {
        didSet {
            self.P22.inputType = .amount
        }
    }
    @IBOutlet weak var P23: NYTextField! {
        didSet {
            self.P23.inputType = .amount
        }
    }
    @IBOutlet weak var P24: NYTextField!
    
    @IBOutlet weak var P33: NYTextField! {
        didSet {
            self.P33.inputType = .amount
        }
    }
    @IBOutlet weak var Q33: NYTextField! {
        didSet {
            self.Q33.inputType = .amount
        }
    }

    
    @IBOutlet weak var U16: NYTextField! {
        didSet {
            self.U16.inputType = .amount
        }
    }

    @IBOutlet weak var U17: NYTextField! {
        didSet {
            self.U17.inputType = .amount
        }
    }
    @IBOutlet weak var U18: NYTextField! {
        didSet {
            self.U18.inputType = .amount
        }
    }
    @IBOutlet weak var U19: NYTextField! {
        didSet {
            self.U19.inputType = .amount
        }
    }
    @IBOutlet weak var U20: NYTextField!
    
    @IBOutlet weak var U22: NYTextField! {
        didSet {
            self.U22.inputType = .amount
        }
    }

    @IBOutlet weak var U23: NYTextField! {
        didSet {
            self.U23.inputType = .amount
        }
    }

    @IBOutlet weak var U24: NYTextField!
    
    @IBOutlet weak var U33: NYTextField! {
        didSet {
            self.U33.inputType = .percent
        }
    }
    @IBOutlet weak var M33: NYTextField! {
        didSet {
            self.M33.inputType = .percent
        }
    }
    
    @IBOutlet weak var S40: NYTextField! {
        didSet {
            self.S40.inputType = .percent
        }
    }
    
    @IBOutlet weak var V40: NYTextField! {
        didSet {
            self.V40.inputType = .year
        }
    }

    @IBOutlet weak var O54: NYTextField! {
        didSet {
            self.O54.inputType = .year
        }
    }

    @IBOutlet weak var X55: NYTextField! {
        didSet {
            self.X55.inputType = .percent
        }
    }

    
    @IBOutlet weak var AG68: NYPickerView!
    @IBOutlet weak var AG69: NYTextField! {
        didSet {
            self.AG69.inputType = .amount
        }
    }
    
    @IBOutlet weak var presenterName: NYLabel!
    @IBOutlet weak var presenterTitle: NYLabel!
    @IBOutlet weak var presenterContactNo: NYLabel!
    @IBOutlet weak var presenterEmail: NYLabel!
    @IBOutlet weak var currentDate: NYLabel!
    
    // Hidden Fields
}
