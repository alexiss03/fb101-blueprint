//
//  NYMIComparativeAnalysisView.swift
//  Nymeria
//
//  Created by Mac on 7/10/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYMIComparativeAnalysisViewDelegate {
    func setUpComputations()
}

class NYMIComparativeAnalysisView: NYBaseSpreadsheetView {
    
    var delegate: NYMIComparativeAnalysisViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var investmentSpreadSheetView: NYSpreadsheetView!
    
    @IBOutlet weak var P2: NYTextField! {
        didSet {
            self.P2.inputType = .text
        }
    }
    @IBOutlet weak var AJ2: NYDatePicker! {
        didSet {
            self.AJ2.inputType = .date
        }
    }
    @IBOutlet weak var B6: NYTextField! {
        didSet {
            self.B6.inputType = .amount
        }
    }
    
    @IBOutlet weak var I10: NYTextField! {
        didSet {
            self.I10.inputType = .percent
        }
    }
    @IBOutlet weak var I11: NYTextField! {
        didSet {
            self.I11.inputType = .percent
        }
    }
    @IBOutlet weak var W10: NYTextField! {
        didSet {
            self.W10.inputType = .percent
        }
    }
    @IBOutlet weak var W11: NYTextField! {
        didSet {
            self.W11.inputType = .percent
        }
    }
    
    // ESTATE TAX SCHEDULE
    @IBOutlet weak var B38: NYTextField!
    @IBOutlet weak var B39: NYTextField!
    @IBOutlet weak var B40: NYTextField!
    @IBOutlet weak var B41: NYTextField!
    @IBOutlet weak var B42: NYTextField!
    
    @IBOutlet weak var F37: NYTextField!
    @IBOutlet weak var F38: NYTextField!
    @IBOutlet weak var F39: NYTextField!
    @IBOutlet weak var F40: NYTextField!
    @IBOutlet weak var F41: NYTextField!
    
    @IBOutlet weak var J39: NYTextField!
    @IBOutlet weak var J40: NYTextField!
    @IBOutlet weak var J41: NYTextField!
    @IBOutlet weak var J42: NYTextField!
    
    @IBOutlet weak var N37: NYTextField!
    @IBOutlet weak var N38: NYTextField!
    @IBOutlet weak var N39: NYTextField!
    @IBOutlet weak var N40: NYTextField!
    @IBOutlet weak var N41: NYTextField!
    @IBOutlet weak var N42: NYTextField!
    
    @IBOutlet weak var P38: NYTextField!
    @IBOutlet weak var P39: NYTextField!
    @IBOutlet weak var P40: NYTextField!
    @IBOutlet weak var P41: NYTextField!
    @IBOutlet weak var P42: NYTextField!
    
    @IBOutlet weak var presenterName: NYLabel!
    @IBOutlet weak var presenterTitle: NYLabel!
    @IBOutlet weak var presenterContactNo: NYLabel!
    @IBOutlet weak var presenterEmail: NYLabel!
    @IBOutlet weak var presentationDate: NYLabel!
    
    override func awakeFromNib() {
        
        self.loadingLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        super.awakeFromNib()
        
    }
}
