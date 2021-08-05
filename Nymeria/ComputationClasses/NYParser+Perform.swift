//
//  NYParser+Perform.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 20/07/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}


extension NYParser {
    
    // Perform functions are self-explanatory
    
    func performAdd(_ op1: String, op2: String) -> String {
        if let _ = Double(op1),
            let _ = Double(op2) {
            return String(Double(op1)! + Double(op2)!)
            
        }
        
        return ""
    }
    
    
    func performSubt(_ op1: String, op2: String) -> String {
        
        if let _ = Double(op1),
            let _ = Double(op2) {
            return String(Double(op1)! - Double(op2)!)
        }
        else if let date1 = NYUtility.getDate(op1),
            let date2 = NYUtility.getDate(op2) {
            
            let cal = Calendar.current
            let unit: NSCalendar.Unit = .day
            let components = (cal as NSCalendar).components(unit, from: date2, to: date1, options: [])
            return String(describing: components.day!)
        }
       // return nil
       return ""
    }
    
    
    func performMult(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return String(Double(op1)! * Double(op2)!)
    }
    
    
    func performDiv(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
            return "\(op1)/\(op2)"
        }
        
        return String(Double(op1)! / Double(op2)!)
    }
    
    
    
    func performPow(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return String(pow(Double(op1)!, Double(op2)!))
    }
    
    
    func performConcat(_ op1: String, op2: String) -> String {
        return "\(op1)\(op2)"
    }
    
    
    func performMax(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return String(Double(op1)!>Double(op2)! ? Double(op1)! : Double(op2)!)
    }
    
    
    func performMin(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return String(Double(op1)!<Double(op2)! ? Double(op1)! : Double(op2)!)
    }
    
    
    func performSum(_ op1: String, op2: String) -> String {
        
        //PARSING OF CHARS
        let param1Num = op1.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param1Alpha = op1.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
        let param2Num = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param2Alpha = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
        
        
        var sum: Double = 0
    
        if param1Alpha == param2Alpha {
            for index in Int(param1Num)!...Int(param2Num)! {
                if let val = Double(self.getValue("\(param1Alpha)\(index)")) {
                    sum += val
                }
            }
        } else if param1Num == param2Num {
            for index in Int(param1Alpha)!...Int(param2Alpha)! {
                if let _ = Double(self.getValue("\(String(describing: UnicodeScalar(index)))\(param1Num)")) {
                    sum += Double(self.getValue("\(String(describing: UnicodeScalar(index)))\(param1Num)"))!
                }
            }
        }
        
        return String(sum)
        
    }
    
    
    
    func performCountIf(_ op1: String, op2: String, op3: String) -> String {
        
        let param1Num = op1.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param1Alpha = op1.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
        let param2Num = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param2Alpha = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))

        
        var count: Double = 0
        
        if param1Alpha == param2Alpha {
            var lits: [String]?
            for index in Int(param1Num)!...Int(param2Num)! {
                if lits == nil {
                    lits = self.parse("\(param1Alpha)\(index)\(op3)")
                } else {
                    lits![0] = "\(param1Alpha)\(index)"
                }
                let result = self.evaluatelits(lits)
                if result == "TRUE" {
                    count += 1
                }
            }
        } else if param1Num == param2Num {
            for index in Int(param1Alpha)!...Int(param2Alpha)! {
                let lits = self.parse("\(String(describing: UnicodeScalar(index)))\(param1Num)\(op3)")
                let result = self.evaluatelits(lits)
                if result == "TRUE" {
                    count += 1
                }
            }
        }
        
        
        return String(count)
        
    }

    
    
    func performNpv(_ op1: String, op2: String, op3: String) -> String {
        
        //PARSING OF CHARS
        let param1Num = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param1Alpha = op2.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
        let param2Num = op3.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)
        let param2Alpha = op3.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))

        var answer: Double = 0
        
        // Vertical Range
        if param1Alpha == param2Alpha {
            for index in Int(param1Num)!...Int(param2Num)! {
                let index2 = index - Int(param1Num)!
                let lits = self.parse("\(param1Alpha)\(index)")
                let result = self.getValue(self.evaluatelits(lits)!)
                
                answer = answer + (Double(result)! / pow(1 + Double(op1)!, Double(index2)+1))
            }
        } else if param1Num == param2Num {
            //TODO: Add horizontal range computation
        }
        
        return String(answer)
        
    }

    
    
    func performRDown(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Int(op2) else {
                return ""
        }
        
        
        let multiplier = 10 *  ( Double(op2)! + 1)
        return String(floor((Double(op1)! * multiplier) / multiplier))
    }

    
    func performRUp(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Int(op2) else {
                return ""
        }
        
        
        let multiplier = 10 *  ( Double(op2)! + 1)
        return String(ceil((Double(op1)! * multiplier) / multiplier))
    }

    
    
    func performEq(_ op1: String, op2: String) -> String {
        if op1 == "0" && op2 == "" {
            return "TRUE"
        }
        
        return (op1 == op2 ? "TRUE": "FALSE")
    }
    
    
    func performLess(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return (Double(op1)!<Double(op2)! ?"TRUE": "FALSE")
    }
    
    func performLessEq(_ op1: String, op2: String) -> String {
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return (Double(op1)!<=Double(op2)! ?"TRUE": "FALSE")
    }
    
    
    func performGreater(_ op1: String, op2: String) -> String {
        if let _ = NYUtility.getDate(op1) {
            if let _ = Double(op2) {
                if Double(op2)! <= 0 {
                    return "TRUE"
                }
            }
        } else if let _ = NYUtility.getDate(op2) {
            if let _ = Double(op1) {
                if Double(op1)! <= 0 {
                    return "TRUE"
                }
            }
        }
        
        
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return (Double(op1)!>Double(op2)! ? "TRUE": "FALSE")
    }
    
    
    func performGreaterEq(_ op1: String, op2: String) -> String {
        if let _ = NYUtility.getDate(op1) {
            if let _ = Double(op2) {
                if Double(op2)! < 0 {
                    return "TRUE"
                }
            }
        } else if let _ = NYUtility.getDate(op2) {
            if let _ = Double(op1) {
                if Double(op1)! < 0 {
                    return "TRUE"
                }
            }
        }
        
        
        guard let _ = Double(op1),
            let _ = Double(op2) else {
                return ""
        }
        
        return (Double(op1)! >= Double(op2)! ? "TRUE": "FALSE")
    }
    
    
    
    func performOr(_ op1: String, op2: String) -> String {
        
        return ( op1 == "TRUE" || op2 == "TRUE" ? "TRUE": "FALSE")
    }
    
    
    func performAnd(_ op1: String, op2: String) -> String {
        
        return ( op1 == "TRUE" && op2 == "TRUE" ? "TRUE": "FALSE")
    }
    
    
    func performIndex(_ op1: String, op2: String, op3:String) -> String {
        //TODO: Only supports Index with Row Parameter
        
        let chars1Num = op1.components(
            separatedBy: CharacterSet.decimalDigits.inverted)
        var param1Num = chars1Num.joined(separator: "")
        
        let param1Aplha = op1.replacingOccurrences(of: param1Num, with: "")
        
        let chars2Num = op2.components(
            separatedBy: CharacterSet.decimalDigits.inverted)
        let param2Num = chars2Num.joined(separator: "")
        
        if Int(param1Num)! + Int(Double(self.getValue(op3))!)  <= Int(param2Num) {
            param1Num = "\(Int(param1Num)! + Int(Double(self.getValue(op3))!))"
        }
        
        return self.getValue("\(param1Aplha)\(param1Num)")
        
    }
    
    func performText(_ op1: String, op2: String) -> String {
        if op2 == "0"{
            return "\(Int(Double(op1)!))"
        }
        return ""
    }
   

}
