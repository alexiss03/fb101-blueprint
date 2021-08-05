//
//  NYBPBusinessValuationView.swift
//  Nymeria
//
//  Created by Mac on 7/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYBPBusinessValuationViewDelegate {
    func setUpComputations()
}

class NYBPBusinessValuationView: NYBaseSpreadsheetView {
    
    var delegate: NYBPBusinessValuationViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stockOwnerSpreadSheetView: NYSpreadsheetView!
    
    @IBOutlet weak var N2: NYTextField!
    @IBOutlet weak var AH2: NYDatePicker! {
        didSet {
            self.AH2.inputType = .date
            self.AH2.inputAlignment = .center
        }
    }
    @IBOutlet weak var H6: NYTextField! {
        didSet {
            self.H6.inputType = .amount
            self.H6.inputAlignment = .center
        }
    }
    
    // TABLE
    // Headers
    @IBOutlet weak var N7: NYTextField! {
        didSet {
            self.N7.inputType = .year
            self.N7.inputAlignment = .center
        }
    }
    @IBOutlet weak var V7: NYTextField! {
        didSet {
            self.V7.inputType = .year
            self.V7.inputAlignment = .center
        }
    }
    @IBOutlet weak var R7: NYTextField! {
        didSet {
            self.R7.inputType = .year
            self.R7.inputAlignment = .center
        }
    }
    @IBOutlet weak var Z7: NYTextField! {
        didSet {
            self.Z7.inputType = .year
            self.Z7.inputAlignment = .center
        }
    }
    @IBOutlet weak var AD7: NYTextField! {
        didSet {
            self.AD7.inputType = .year
            self.AD7.inputAlignment = .center
        }
    }
    
    // Rows
    @IBOutlet weak var N8: NYTextField! {
        didSet {
            self.N8.inputType = .amount
        }
    }
    @IBOutlet weak var N9: NYTextField! {
        didSet {
            self.N9.inputType = .amount
        }
    }
    @IBOutlet weak var N10: NYTextField! {
        didSet {
            self.N10.inputType = .amount
        }
    }
    @IBOutlet weak var N11: NYTextField! {
        didSet {
            self.N11.inputType = .amount
        }
    }
    @IBOutlet weak var N12: NYTextField! {
        didSet {
            self.N12.inputType = .amount
        }
    }
    @IBOutlet weak var R8: NYTextField! {
        didSet {
            self.R8.inputType = .amount
        }
    }
    @IBOutlet weak var R9: NYTextField! {
        didSet {
            self.R9.inputType = .amount
        }
    }
    @IBOutlet weak var R10: NYTextField! {
        didSet {
            self.R10.inputType = .amount
        }
    }
    @IBOutlet weak var R11: NYTextField! {
        didSet {
            self.R11.inputType = .amount
        }
    }
    @IBOutlet weak var R12: NYTextField! {
        didSet {
            self.R12.inputType = .amount
        }
    }
    @IBOutlet weak var V8: NYTextField! {
        didSet {
            self.V8.inputType = .amount
        }
    }
    @IBOutlet weak var V9: NYTextField! {
        didSet {
            self.V9.inputType = .amount
        }
    }
    @IBOutlet weak var V10: NYTextField! {
        didSet {
            self.V10.inputType = .amount
        }
    }
    @IBOutlet weak var V11: NYTextField! {
        didSet {
            self.V11.inputType = .amount
        }
    }
    @IBOutlet weak var V12: NYTextField! {
        didSet {
            self.V12.inputType = .amount
        }
    }
    @IBOutlet weak var Z8: NYTextField! {
        didSet {
            self.Z8.inputType = .amount
        }
    }
    @IBOutlet weak var Z9: NYTextField! {
        didSet {
            self.Z9.inputType = .amount
        }
    }
    @IBOutlet weak var Z10: NYTextField! {
        didSet {
            self.Z10.inputType = .amount
        }
    }
    @IBOutlet weak var Z11: NYTextField! {
        didSet {
            self.Z11.inputType = .amount
        }
    }
    @IBOutlet weak var Z12: NYTextField! {
        didSet {
            self.Z12.inputType = .amount
        }
    }
    @IBOutlet weak var AD8: NYTextField! {
        didSet {
            self.AD8.inputType = .amount
        }
    }
    @IBOutlet weak var AD9: NYTextField! {
        didSet {
            self.AD9.inputType = .amount
        }
    }
    @IBOutlet weak var AD10: NYTextField! {
        didSet {
            self.AD10.inputType = .amount
        }
    }
    @IBOutlet weak var AD11: NYTextField! {
        didSet {
            self.AD11.inputType = .amount
        }
    }
    @IBOutlet weak var AD12: NYTextField! {
        didSet {
            self.AD12.inputType = .amount
        }
    }
    @IBOutlet weak var AH8: NYTextField! {
        didSet {
            self.AH8.inputType = .amount
        }
    }
    @IBOutlet weak var AH9: NYTextField! {
        didSet {
            self.AH9.inputType = .amount
        }
    }
    @IBOutlet weak var AH10: NYTextField! {
        didSet {
            self.AH10.inputType = .amount
        }
    }
    @IBOutlet weak var AH11: NYTextField! {
        didSet {
            self.AH11.inputType = .amount
        }
    }
    @IBOutlet weak var AH12: NYTextField! {
        didSet {
            self.AH12.inputType = .amount
        }
    }
    
    @IBOutlet weak var AH14: NYTextField! {
        didSet {
            self.AH14.inputType = .amount
        }
    }
    @IBOutlet weak var V16: NYPickerView! {
        didSet {
            self.V16.inputAlignment = .center
        }
    }
    
    // AB COLUMN
    @IBOutlet weak var AB19: NYTextField! {
        didSet {
            self.AB19.inputType = .amount
        }
    }
    @IBOutlet weak var AB20: NYTextField! {
        didSet {
            self.AB20.inputType = .amount
        }
    }
    @IBOutlet weak var AB24: NYTextField! {
        didSet {
            self.AB24.inputType = .amount
        }
    }
    @IBOutlet weak var AB28: NYTextField! {
        didSet {
            self.AB28.inputType = .amount
        }
    }
    @IBOutlet weak var AB29: NYTextField! {
        didSet {
            self.AB29.inputType = .amount
        }
    }
    @IBOutlet weak var AB30: NYTextField! {
        didSet {
            self.AB30.inputType = .amount
        }
    }
    @IBOutlet weak var AB31: NYTextField! {
        didSet {
            self.AB31.inputType = .amount
        }
    }
    @IBOutlet weak var AB32: NYTextField! {
        didSet {
            self.AB32.inputType = .amount
        }
    }
    @IBOutlet weak var AB33: NYTextField! {
        didSet {
            self.AB33.inputType = .amount
        }
    }
    @IBOutlet weak var AB34: NYTextField! {
        didSet {
            self.AB34.inputType = .amount
        }
    }
    @IBOutlet weak var AB41: NYTextField! {
        didSet {
            self.AB41.inputType = .amount
        }
    }
    @IBOutlet weak var AB42: NYTextField! {
        didSet {
            self.AB42.inputType = .amount
        }
    }
    
    // AH COLUMN
    @IBOutlet weak var AH21: NYTextField! {
        didSet {
            self.AH21.inputType = .amount
        }
    }
    @IBOutlet weak var AH25: NYTextField! {
        didSet {
            self.AH25.inputType = .amount
        }
    }
    @IBOutlet weak var AH36: NYTextField! {
        didSet {
            self.AH36.inputType = .amount
        }
    }
    @IBOutlet weak var AH38: NYTextField! {
        didSet {
            self.AH38.inputType = .amount
        }
    }
    @IBOutlet weak var AH43: NYTextField! {
        didSet {
            self.AH43.inputType = .amount
        }
    }
    @IBOutlet weak var AH46: NYTextField! {
        didSet {
            self.AH46.inputType = .amount
        }
    }
    @IBOutlet weak var AH48: NYTextField! {
        didSet {
            self.AH48.inputType = .amount
            self.AH48.inputAlignment = .center
        }
    }
    @IBOutlet weak var AH50: NYTextField! {
        didSet {
            self.AH50.inputType = .amount
        }
    }
    
    // OTHER FIELDS
    @IBOutlet weak var AE46: NYPickerView! {
        didSet {
            self.AE46.inputAlignment = .center
        }
    }
    
    @IBOutlet weak var T48: NYPickerView! {
        didSet {
            self.T48.inputAlignment = .center
        }
    }
    @IBOutlet weak var J53: NYLabel!
    @IBOutlet weak var AG50: NYLabel!
    
    @IBOutlet weak var presenterName: NYLabel!
    @IBOutlet weak var presenterTitle: NYLabel!
    @IBOutlet weak var presenterContactNo: NYLabel!
    @IBOutlet weak var presenterEmail: NYLabel!
    @IBOutlet weak var presentationDate: NYLabel!
    
}
