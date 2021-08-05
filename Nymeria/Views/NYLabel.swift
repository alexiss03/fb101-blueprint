//
//  NYLabel.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 22/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYLabel: UILabel, NYFieldDelegate {
    
    //Allows checking of new value of text after setting it
    //Default is non zero
    var displayType: NYTextDisplayType? = .nonNegative
    
    var formula: String? {
        didSet {
            lits = NYParser.shared.parse(formula!)
            NYParser.shared.willAppendToFields(self)
        }
    }
    var value: String?
    var computedOnce: Bool = false
    var alwaysComputed: Bool = false
    
    var id: String? = nil
    var isPreloadedVal: Bool = false
    var preloadedVal: String?
    var dependentFields: [String:UIView]?
    var lits: [String]?

    override var text: String? {
        didSet {
            switch displayType! {
                case .nonNegative:
                    if let floatText = Float(text!), floatText <= 0 {
                        text = ""
                    }
                
                default:
                    break
            }
         
            if text != "" {
                self.isHidden = false
            }
            else {
                self.isHidden = true
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //weak var weakSelf = self
        //NYParser.shared.willAppendToFields(weakSelf!)
    }
    
}
