//
//  NYPickerView.swift
//  Nymeria
//
//  Created by Mac on 7/24/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYPickerView: NYTextField {

    var toolbar: NYPickerViewToolbar = NYPickerViewToolbar()

    override func awakeFromNib() {

        toolbar.inputField = self

        self.inputView = toolbar.pickerView
        self.inputAccessoryView = toolbar
        
        self.font = self.font?.withSize(18.0)
//        self.backgroundColor = UIColor.whiteColor()

        super.awakeFromNib()

    }

    override func textFieldDidEndEditing(_ textField: UITextField) {

        guard let _ = id else {
            return
        }

        NYParser.shared.performComputation(id!, sender: self)

    }

}
