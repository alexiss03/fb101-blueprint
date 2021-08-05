//
//  NYBPGroupRetirementView.swift
//  Nymeria
//
//  Created by Mac on 7/5/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYBPGroupRetirementViewDelegate {
    func setUpComputations()
}

class NYBPGroupRetirementView: NYBaseSpreadsheetView {
    
    var delegate: NYBPGroupRetirementViewDelegate?
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var employeeSpreadsheetView: NYSpreadsheetView!
    
    @IBOutlet weak var AM2: NYLabel!
    @IBOutlet weak var Z5: NYPickerView! {
        didSet {
            self.Z5.inputAlignment = .right
        }
    }
    
    @IBOutlet weak var AA4: NYTextField! {
        didSet {
            self.AA4.inputType = .amount
            self.AA4.inputAlignment = .center
        }
    }
    @IBOutlet weak var AA5: NYTextField! {
        didSet {
            self.AA5.inputType = .amount
            self.AA5.inputAlignment = .center
        }
    }
    @IBOutlet weak var AA6: NYTextField! {
        didSet {
            self.AA6.inputType = .percent
        }
    }
    @IBOutlet weak var AA7: NYTextField! {
        didSet {
            self.AA7.inputType = .percent
        }
    }
    @IBOutlet weak var AA8: NYTextField! {
        didSet {
            self.AA8.inputType = .percent
        }
    }
    
    @IBOutlet weak var AM4: NYTextField! {
        didSet {
            self.AM4.inputType = .amount
            self.AM4.inputAlignment = .center
        }
    }
    @IBOutlet weak var AM5: NYTextField! {
        didSet {
            self.AM5.inputType = .amount
            self.AM5.inputAlignment = .center
        }
    }
    @IBOutlet weak var AM6: NYTextField! {
        didSet {
            self.AM6.inputType = .percent
        }
    }
    @IBOutlet weak var AM7: NYTextField! {
        didSet {
            self.AM7.inputType = .amount
            self.AM7.inputAlignment = .center
        }
    }
    @IBOutlet weak var AM8: NYTextField! {
        didSet {
            self.AM8.inputType = .amount
            self.AM8.inputAlignment = .center
        }
    }
    
    @IBOutlet weak var ageTodayLabel: UILabel!
    @IBOutlet weak var pastServiceLabel: UILabel!
    @IBOutlet weak var futureServiceLabel: UILabel!
    @IBOutlet weak var totalYearsServiceLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        self.ageTodayLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        self.pastServiceLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        self.futureServiceLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        self.totalYearsServiceLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        
    }
}
