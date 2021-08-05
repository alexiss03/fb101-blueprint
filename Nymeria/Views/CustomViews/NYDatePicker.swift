//
//  NYDatePicker.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 24/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit



enum NYDatePickerDependency {
    case yearsSince, monthsSince, daysSince
}


class NYDatePicker: NYTextField {
    
    var dependentViews: [UIView]?
    var depencyTypes: [NYDatePickerDependency?]?
    var toolbar: NYDatePickerToolBar?

    override func awakeFromNib() {
        
        toolbar = NYDatePickerToolBar()
        toolbar!.inputField = self
        
        self.inputView = toolbar!.pickerView
        self.inputAccessoryView = toolbar
        
        self.text = toolbar!.inputField?.text
        self.font = self.font?.withSize(18.0)
        
        super.awakeFromNib()
        
    }
    
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        guard let _ = id else {
            return
        }   
        
        NYParser.shared.performComputation(id!, sender: self)
        
    }
}
