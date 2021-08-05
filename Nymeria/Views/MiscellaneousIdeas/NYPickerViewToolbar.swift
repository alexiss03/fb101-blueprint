//
//  NYPickerViewToolbar.swift
//  Nymeria
//
//  Created by Mac on 7/24/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYPickerViewDelegate : class {
    func didSelectPickerValue(_ name: String, value: String)
}


class NYPickerViewToolbar: UIToolbar, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerView: UIPickerView? = UIPickerView()
    var inputField: NYTextField?
    weak var pickerDelegate: NYPickerViewDelegate?
    
    var options: NSArray? = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.pickerView?.delegate = self
        self.pickerView?.dataSource = self
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NYPickerViewToolbar.donePicker))
        let flexSpace = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace , target: nil, action: nil)
        
        self.barStyle = UIBarStyle.default
        self.isTranslucent = true
        self.tintColor = UIColor(red: 20/255, green: 217/255, blue: 20/255, alpha: 1)
        self.sizeToFit()
        self.setItems([flexSpace, doneButton], animated: false)
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func hidePickerView() {
        
        self.pickerView?.isHidden = true
    }
    
    
    func showPickerView() {
        
        self.pickerView?.isHidden = false
    }
    
    
    func donePicker() {
        guard let _ = self.inputField,
            let _ = self.options,
            self.options?.count != 0 else {
                
                self.inputField?.resignFirstResponder()
                return
        }
        
        self.inputField!.text = self.options![self.pickerView!.selectedRow(inComponent: 0)] as? String
        self.inputField!.value = self.options![self.pickerView!.selectedRow(inComponent: 0)] as? String
        self.inputField?.resignFirstResponder()
        self.pickerDelegate?.didSelectPickerValue(self.options![self.pickerView!.selectedRow(inComponent: 0)] as! String,
                                                  value: self.options![self.pickerView!.selectedRow(inComponent: 0)] as! String)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        guard let _ = self.options else {
            return 1
        }
        
        return self.options!.count
    }
    
    
    @objc func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let _ = self.options else {
            return ""
        }
        
        return self.options![row] as? String
    }
}
