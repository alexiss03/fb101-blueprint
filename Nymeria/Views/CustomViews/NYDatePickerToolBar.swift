//
//  NYDatePicker.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 24/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

import Foundation
import UIKit


class NYDatePickerToolBar : UIToolbar {
    
    var pickerView : UIDatePicker =  UIDatePicker()
    var dateFormat = "M/d/Y"
    var inputField : NYTextField?
    var pickerMode = UIDatePickerMode.date
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.pickerView.datePickerMode = self.pickerMode
        self.pickerView.addTarget(self, action: #selector(NYDatePickerToolBar.dataPickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NYDatePickerToolBar.donePickerDate))
        let flexSpace = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace , target: nil, action: nil)
        
        self.barStyle = UIBarStyle.default
        self.isTranslucent = true
        self.tintColor = UIColor(red: 20/255, green: 217/255, blue: 20/255, alpha: 1)
        self.sizeToFit()
        self.setItems([flexSpace, doneButton], animated: false)
        self.isUserInteractionEnabled = true
        
    }
    
    
    func donePickerDate() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        
        self.inputField?.text = dateFormatter.string(from: self.pickerView.date)
        self.inputField?.resignFirstResponder()
        
    }
    
    
    func dataPickerValueChanged(_ sender: UIDatePicker) ->String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        return dateFormatter.string(from: sender.date)
    }
    
    
    func datePickerView() -> UIDatePicker {
        return self.pickerView
    }
}
