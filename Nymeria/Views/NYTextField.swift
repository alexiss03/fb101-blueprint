//
//  NYTextfield.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


enum NYTextFieldInputType {
    case percent, none, amount, date, text, year//, Ratio
}

enum NYTextDisplayAlignment {
    case left, center, right
}

enum NYTextDisplayType {
    case nonNegative, none, negativeRed
}


enum ValidationType {
    case greaterThan, greaterThanEqual, lessThanEqual, lessThan, equal
}

struct Number {
    static let formatterWithSepator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Integer {
    var stringFormatedWithSepator: String {
        return Number.formatterWithSepator.string(from: hashValue as NSNumber)!
    }
}

protocol NYFieldDelegate {
    var id: String? {get set}
    var formula: String? {get set}
    var dependentFields: [String:UIView]? {get set}
    var lits: [String]? {get set}
    var text: String? {get set}
    var value: String? {get set}
    var computedOnce: Bool {get set}
    var alwaysComputed: Bool {get set}
}


class NYTextField: UITextField, UITextFieldDelegate, NYFieldDelegate {
    
    var value: String?
    
    //Allows post processing of text input
    var inputType: NYTextFieldInputType?
    var inputAlignment: NYTextDisplayAlignment?
    var lits: [String]?
    
    //Allows checking of new value of text after setting it
    //Default is non zero
    var displayType: NYTextDisplayType? = .nonNegative
    
    var id: String? {
        didSet {
            NYParser.shared.willAppendToFields(self)
        }
    }
    
    
    var computedOnce: Bool = false
    var alwaysComputed: Bool = false
    
    var formula: String?
    {
        didSet {
            //formula = formula?.stringByReplacingOccurrencesOfString("$", withString: "")
            lits = NYParser.shared.parse(formula!)
        }
    }
    
    var validations: [(ValidationType, AnyObject, String)]?
    var dependentFields: [String:UIView]?
    
    override var text: String? {
        didSet {
            if (self.inputAlignment == .left) {
                self.textAlignment = .left
            } else if (self.inputAlignment == .center) {
                self.textAlignment = .center
            } else if (self.inputAlignment == .right) {
                self.textAlignment = .right
            }
        }
    }
    
    var isEditable: Bool? = true
    var isPreloadedVal: Bool = false
    var preloadedVal: String?
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(bounds, padding)
        
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(bounds, padding)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(bounds, padding)
        
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.font = UIFont(name: "Roboto", size: 18.0)
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: 30)
        self.borderStyle = .line

        if (self.inputType == .text) {
            self.keyboardType = .default
        } else {
            self.keyboardType = .numberPad
        }
        
        self.delegate = self
        
        //if let fields = NYParser.shared.fields where !fields.contains(self) {
            //weak var weakSelf = self
           // NYParser.shared.willAppendToFields(self)
       // }
    }
    
    
    // MARK: UITextFieldDelegate methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if self.inputType == .amount {
            self.text = self.text!.replacingOccurrences(of: ",", with: "")
        } else if self.inputType == .percent {
            self.text = self.text!.replacingOccurrences(of: "%", with: "")
        }
        
        if (self.inputAlignment == .left) {
            self.textAlignment = .left
        } else if (self.inputAlignment == .center) {
            self.textAlignment = .center
        } else if (self.inputAlignment == .right) {
            self.textAlignment = .right
        }        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("did end editing \(String(describing: (textField as! NYTextField).id))")
        
        self.resignFirstResponder()
        
        let (isValid, error) = self.isValid()
        
        if error == nil && isValid {
            self.prepareForComputation(textField)
        } else if let _ = error {
            self.text = ""
            NYUserSession.current.moduleController?.present(NYUtility.popUpWithOKButton("Error", message: error!), animated: true, completion: nil)
        }

    }
    
    
    func isValid() -> (Bool, String?) {
        
        guard let _ = self.validations else {
            return (true, nil)
        }
        
        
        for (validation, field, error) in self.validations! {
            
            var rightValue: Double = 0
            var leftValue: Double = 0
            
            if field is NYLabel {
                if let value = (field as! NYLabel).value, let _ = Double(value) {
                    rightValue = Double((field as! NYLabel).value!)!
                }
            } else if field is NYTextField {
                if let value = (field as! NYTextField).value, let _ = Double(value) {
                    rightValue = Double((field as! NYTextField).value!)!
                }
            } else if field is NSNumber {
                rightValue = (field as! NSNumber).doubleValue
            }
            

            if let text = self.text, let doubleVal = Double(text) {
                leftValue = doubleVal
            }
            
    
            if validation == .greaterThan {
                if leftValue <= Double(rightValue) {
                    return (false, error)
                }
            } else if validation == .greaterThanEqual {
                if leftValue < Double(rightValue) {
                    return (false, error)
                }
            }
            else if validation == .lessThan {
                if leftValue >= Double(rightValue) {
                    return (false, error)
                }
            }
            else if validation == .lessThanEqual {
                if leftValue > Double(rightValue) {
                    return (false, error)
                }
            } else if validation == .equal {
                if leftValue != Double(rightValue) {
                    return (false, error)
                }
            }
        }
        
        
        return (true, nil)
    }
    
    
    func prepareForComputation(_ textField: UITextField) {
        
        if inputType == .percent {
            self.value = textField.text
            
            if textField.text != "" {
                let textWithoutPercent = textField.text!.replacingOccurrences(of: "%", with: "")
                self.value = String(Double(textWithoutPercent)!/100)
                textField.text = "\(textWithoutPercent)%"
            }
            
        }
        else if inputType == .year {
            
            self.value = textField.text
            textField.text = self.value!.replacingOccurrences(of: ",", with: "")
            
        } else if inputType == .amount && textField.text != "" {
            
            guard let _ = Double(self.text!.replacingOccurrences(of: ",", with: "")) else {
                self.text = ""
                self.value = ""
                return
            }
            
            self.value = textField.text?.replacingOccurrences(of: ",", with: "")
            
            if let text = textField.text, let number = Int(text) {
                textField.text = number.stringFormatedWithSepator
            }
            
        } else if let _ = textField.text {
            self.value = textField.text
            
        }

        
        guard let _ = id  else {
            return
        }
        
        self.compute()
    }
    
    
    func compute(_ result: String = "") {
        NYParser.shared.performComputation(id!,sender: self, isUserInput: true)
    }
    
    func setToEditable() {
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.yellow
    }
    
}
