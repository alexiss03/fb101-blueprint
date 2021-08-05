//
//  NYMIBenefitSellingView.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYMIBenefitSellingViewDelegate {
    func setUpComputations()
}

class NYMIBenefitSellingView: NYBaseSpreadsheetView {
    
    var delegate: NYMIBenefitSellingViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var AL2: NYLabel!
    @IBOutlet weak var B4: NYTextField! {
        didSet {
            self.B4.inputType = .amount
            self.B4.inputAlignment = .center
        }
    }
    @IBOutlet weak var B5: NYTextField! {
        didSet {
            self.B5.inputType = .amount
            self.B5.inputAlignment = .center
        }
    }
    @IBOutlet weak var B6: NYTextField! {
        didSet {
            self.B6.inputType = .text
            self.B6.inputAlignment = .center
        }
    }
    @IBOutlet weak var B7: NYTextField! {
        didSet {
            self.B7.inputType = .amount
            self.B7.inputAlignment = .center
        }
    }
    
    @IBOutlet weak var U2: NYTextField!
    @IBOutlet weak var U4: NYPickerView! {
        didSet {
            self.U4.inputAlignment = .center
        }
    }
    @IBOutlet weak var U5: NYDatePicker! {
        didSet {
            self.U5.inputType = .date
            self.U5.inputAlignment = .center
        }
    }
    @IBOutlet weak var U6: NYTextField! {
        didSet {
            self.U6.inputType = .year
            self.U6.inputAlignment = .center
        }
    }
    @IBOutlet weak var U7: NYTextField! {
        didSet {
            self.U7.inputType = .year
            self.U7.inputAlignment = .center
        }
    }
    @IBOutlet weak var Z6: NYLabel!
    @IBOutlet weak var Z7: NYLabel!
    
    @IBOutlet weak var B11: NYTextField! {
        didSet {
            self.B11.inputType = .amount
        }
    }
    @IBOutlet weak var B12: NYTextField! {
        didSet {
            self.B12.inputType = .percent
        }
    }
    @IBOutlet weak var B13: NYTextField! {
        didSet {
            self.B13.inputType = .amount
        }
    }
    @IBOutlet weak var B14: NYTextField! {
        didSet {
            self.B14.inputType = .amount
        }
    }
    @IBOutlet weak var B15: NYTextField! {
        didSet {
            self.B15.inputType = .year
        }
    }
    @IBOutlet weak var B16: NYTextField! {
        didSet {
            self.B16.inputType = .amount
        }
    }
    @IBOutlet weak var B17: NYTextField! {
        didSet {
            self.B17.inputType = .amount
        }
    }
    @IBOutlet weak var B18: NYTextField! {
        didSet {
            self.B18.inputType = .amount
        }
    }
    @IBOutlet weak var B19: NYTextField! {
        didSet {
            self.B19.inputType = .amount
        }
    }
    @IBOutlet weak var B20: NYTextField! {
        didSet {
            self.B20.inputType = .amount
        }
    }
    
    @IBOutlet weak var G13: NYLabel!
    @IBOutlet weak var G14: NYLabel!
    @IBOutlet weak var G15: NYLabel!
    @IBOutlet weak var G16: NYLabel!
    
    @IBOutlet weak var U11: NYTextField! {
        didSet {
            self.U11.inputType = .amount
        }
    }

    @IBOutlet weak var U12: NYTextField! {
        didSet {
            self.U12.inputType = .percent
        }
    }

    @IBOutlet weak var U13: NYTextField!
    @IBOutlet weak var U14: NYTextField!
    @IBOutlet weak var U15: NYTextField! {
        didSet {
            self.U15.inputType = .year
        }
    }

    @IBOutlet weak var U16: NYTextField!
    @IBOutlet weak var U17: NYTextField!
    @IBOutlet weak var U18: NYTextField!
    @IBOutlet weak var U19: NYTextField!
    @IBOutlet weak var U20: NYTextField!
    
    @IBOutlet weak var Z11: NYLabel!
    @IBOutlet weak var Z15: NYLabel!
    @IBOutlet weak var Z17: NYLabel!
    @IBOutlet weak var Z19: NYLabel!
    
    @IBOutlet weak var B24: NYTextField! {
        didSet {
            self.B24.inputType = .year
        }
    }
    @IBOutlet weak var B25: NYTextField! {
        didSet {
            self.B25.inputType = .amount
        }
    }
    @IBOutlet weak var B26: NYTextField! {
        didSet {
            self.B26.inputType = .amount
        }
    }
    @IBOutlet weak var B27: NYTextField! {
        didSet {
            self.B27.inputType = .amount
        }
    }
    @IBOutlet weak var B28: NYTextField! {
        didSet {
            self.B28.inputType = .percent
        }
    }
    @IBOutlet weak var B29: NYTextField!
    @IBOutlet weak var B30: NYTextField!
    @IBOutlet weak var B31: NYTextField!
    @IBOutlet weak var B32: NYTextField!
    @IBOutlet weak var B33: NYTextField!
    @IBOutlet weak var B34: NYTextField!
    @IBOutlet weak var B35: NYTextField!
    @IBOutlet weak var B36: NYTextField!
    
    @IBOutlet weak var G24: NYLabel!
    @IBOutlet weak var G25: NYLabel!
    @IBOutlet weak var G26: NYLabel!
    @IBOutlet weak var G27: NYLabel!
    @IBOutlet weak var G31: NYLabel!
    @IBOutlet weak var G33: NYLabel!
    @IBOutlet weak var G35: NYLabel!
    
    @IBOutlet weak var AP5: NYTextField!
    
    @IBOutlet weak var U24: NYTextField! {
        didSet {
            self.U24.inputType = .year
        }
    }
    @IBOutlet weak var U25: NYTextField! {
        didSet {
            self.U25.inputType = .amount
        }
    }
    @IBOutlet weak var U26: NYTextField! {
        didSet {
            self.U26.inputType = .amount
        }
    }
    @IBOutlet weak var U27: NYTextField! {
        didSet {
            self.U27.inputType = .amount
        }
    }
    @IBOutlet weak var U28: NYTextField! {
        didSet {
            self.U28.inputType = .amount
        }
    }
    @IBOutlet weak var U29: NYTextField! {
        didSet {
            self.U29.inputType = .percent
        }
    }

    @IBOutlet weak var U30: NYTextField!
    @IBOutlet weak var U31: NYTextField!
    @IBOutlet weak var U32: NYTextField!
    @IBOutlet weak var U33: NYTextField!
    @IBOutlet weak var U34: NYTextField!
    @IBOutlet weak var U35: NYTextField!
    @IBOutlet weak var U36: NYTextField!
    @IBOutlet weak var U37: NYTextField!
    @IBOutlet weak var U38: NYTextField!
    
    @IBOutlet weak var Z24: NYLabel!
    @IBOutlet weak var Z26: NYLabel!
    @IBOutlet weak var Z27: NYLabel!
    @IBOutlet weak var Z28: NYLabel!
    @IBOutlet weak var Z32: NYLabel!
    @IBOutlet weak var Z34: NYLabel!
    @IBOutlet weak var Z37: NYLabel!
    
    @IBOutlet weak var presenterName: NYLabel!
    @IBOutlet weak var presenterTitle: NYLabel!
    @IBOutlet weak var presenterContactNo: NYLabel!
    @IBOutlet weak var presenterEmail: NYLabel!
    @IBOutlet weak var presentationDate: NYLabel!
    
}
