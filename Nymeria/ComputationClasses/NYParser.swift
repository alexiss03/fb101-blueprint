
//
//  NYComputation.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 21/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

    // ALGO
    // 1 Formula string is parsed into smaller strings according to syntax
    //      method: func parse(formula: String) -> [String]?
    // 2 After being parsed, the literals are given meaning through evaluation
    //        recursive calls
    //        method: func evaluatelits(literals: [String]?) -> String?

    // Methods are arranged in order of being called throughout the flow 


class NYParser {
    
    static var shared = NYParser()
    var fields: [String:UIView]?

    var currentForm: String = ""
    
    static var formula: String?
    static var opQueue = OperationQueue()
    static var backgroundQueue = OperationQueue()
    static var thread = Thread()
    
    static var hasCachedDependentFields = false
    static var sorted = false
    
    
    func performComputationFromThread(_ id: String, sender: UIView? = nil, isUserInput: Bool = false, parentBlock: Operation? = nil) {
        
       // self.performComputationFromThread(Selector(NYParser.shared.performco))
    }
    
    // This method is called every new input from the user
    // This method calls the parsing method
    func performComputation(_ id: String, sender: UIView? = nil, isUserInput: Bool = false, parentBlock: Operation? = nil) {

        
        //NYParser.thread.perform(<#T##aSelector: Selector!##Selector!#>)
        
        //let priority = DispatchQueue.GlobalQueuePriority.high
       // DispatchQueue.global(priority: priority).async {
            
        for block in NYParser.opQueue.operations {
            if block.name == id {
                //block.cancel()
                return
            }
        }
        
        for block in NYParser.backgroundQueue.operations {
            if block.name == id {
                //block.cancel()
                return
            }
        }
        
        
        var matchingFields: [String:UIView] = [:]
        
        if (sender as! NYFieldDelegate).dependentFields == nil {
            
            if var fieldDelegate = (sender as? NYFieldDelegate) {
                
                fieldDelegate.dependentFields = [:]
                
                for field in self.fields! {
                    
                    if let _ = (field.1 as! NYFieldDelegate).formula, self.textFieldDelegateFormulaContains(field.1 as! NYFieldDelegate, id: fieldDelegate.id!) {
                        
                        matchingFields[(field.1 as! NYFieldDelegate).id!] = field.1
                        
                    }
                }
                
                
                fieldDelegate.dependentFields = matchingFields
                
            }
        } else {
            
            matchingFields = (sender as! NYFieldDelegate).dependentFields!
        }
    
       var backgroundBlocks: [BlockOperation] = []
       var foregroundBlocks: [BlockOperation] = []
        
       if matchingFields.keys.count == 0 {
            return
       }
            
        for fields in matchingFields {
           let view = fields.1
            
           let block = BlockOperation()
            
            if let _ = parentBlock {
                block.addDependency(parentBlock!)
            }
            
           block.name = id
           block.queuePriority = .veryHigh
            
           weak var weakSelf = self
            
           block.addExecutionBlock({() -> Void in
            
                let strongSelf = weakSelf
            
                if view is NYTextField {
                    var lits: [String]? = []
                    
                    if (view as! NYTextField).lits == nil {
                        if let textfield = (view as? NYTextField), let formula = textfield.formula, formula != "" {
                            lits = strongSelf!.parse(formula)
                            (view as! NYTextField).lits = lits
                        }
                    } else {
                       lits = (view as! NYTextField).lits
                    }
            
                    if (view as! NYTextField).id == "Z7" {
                        
                    }
                    
                    let result = strongSelf?.evaluatelits(lits)
                    lits = nil

                    
                    if Double(result!) == nil {
                        
                        DispatchQueue.main.async {
                            if (view as! NYTextField).inputType == .text {
                                (view as! NYTextField).text = result
                            } else {
                                (view as! NYTextField).text = ""
                            }
                        }
                        
                        (view as! NYTextField).value = ""
                        //if block.cancelled { return }
                        
                        
                        
                        
                        //var matchingFields2: [String:UIView] = [:]
                        
                        //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                        (view as! NYTextField).compute(result!)
                        
                    }
//                    else if let _ = result, let ans = Double(result!), ans < 0 {
                    else if let _ = result, let ans = Double(result!) {
                        
                        DispatchQueue.main.async {
                            if view.superview != nil {
                                
                                if (result == "nan" || result == "inf" || result == "-inf" || result == "+inf") {
                                    
                                } else {
                                    let formatted_number = Int(abs(ans)).stringFormatedWithSepator
                                    
                                    if (ans < 0) {
                                        (view as! NYTextField).text = "(\(formatted_number))"
                                        
                                        if (view as! NYTextField).displayType == NYTextDisplayType.negativeRed {
                                            (view as! NYTextField).textColor = NYConstants.COLOR_RED
                                        }
                                    } else {
                                        if (view as! NYTextField).inputType == NYTextFieldInputType.year {
                                            let intResult = Int(abs(ans))
                                            (view as! NYTextField).text = "\(intResult)"
                                        } else {
                                            if formatted_number == "0" {
                                                (view as! NYTextField).text = ""
                                            } else {
                                                (view as! NYTextField).text = "\(formatted_number)"
                                            }
                                        }
                                    }
                                }
                            }
                            else if view.superview == nil {
                                if result == "0" {
                                    (view as! NYTextField).text = ""
                                } else {
                                    (view as! NYTextField).text = result
                                }
                            }
                        }
                        
                        (view as! NYTextField).value = result
                        
                        //if block.cancelled { return }
                        //if ((view as! NYFieldDelegate).dependentFields?.count == 0) { return; };
                        //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                        (view as! NYTextField).compute(result!)
                        
                    } else if let _ = result, let ans = Double(result!), ans == 0 {
 
                        DispatchQueue.main.async {
                            (view as! NYTextField).text = ""
                        }
                        
                        (view as! NYTextField).value = result
                        //if block.cancelled { return }
                        //if ((view as! NYFieldDelegate).dependentFields?.count == 0) { return; };
                        //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                        (view as! NYTextField).compute(result!)
                    }
                    else {

                        //Hidden field
                        if view.superview == nil {
                            
                            DispatchQueue.main.async {
                                (view as! NYTextField).text = result
                            }
                            
                            (view as! NYTextField).value = result
                            //if block.cancelled { return }
                            //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                            (view as! NYTextField).compute(result!)
                            
                            
                        } else {
                            if let _ = Double(result!.replacingOccurrences(of: ",", with: ""))?.toInt() {
                                
                                DispatchQueue.main.async {
                                    (view as! NYTextField).text = (Int(round(Double(result!)!))).stringFormatedWithSepator
                                }
                                
                                (view as! NYTextField).value = result
                                //if block.cancelled { return }
                                //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                                (view as! NYTextField).compute(result!)
                        
                            }
                            else {
                                
                                (view as! NYTextField).text = ""
                                (view as! NYTextField).value = ""
                                //if block.cancelled { return }
                                //if let fields = (view as! NYFieldDelegate).dependentFields where fields.keys.count == 0 { return };
                                (view as! NYTextField).compute(result!)
                                
                            }
                        }
                        
                    }
                    
                } else if view is NYLabel {
                    var lits: [String]? = []
                    
                    //Caching of literals
                    if (view as! NYLabel).lits == nil {
                        if let label = (view as? NYLabel), let formula = label.formula {
                            lits = strongSelf!.parse(formula)
                            (view as! NYLabel).lits = lits
                        }
                    } else {
                        lits = (view as! NYLabel).lits
                    }

                        NYParser.formula = (view as! NYLabel).formula
                        
                        let result = strongSelf!.evaluatelits(lits)
                    
                        if Double(result!) == nil {
                            DispatchQueue.main.async {
                                var text = result!.replacingOccurrences(of: "\'", with: "")
                                if text.contains(".0") {
                                    text = text.replacingOccurrences(of: ".0", with: "")
                                }
                                (view as! NYLabel).text = text
                            }
                            (view as! NYLabel).value = ""
                        }
                        else if let _ = result, let ans = Double(result!), ans <= 0 {
                            DispatchQueue.main.async {
                                (view as! NYLabel).text = ""
                            }
                            (view as! NYLabel).value = ""
                        } else {
                            DispatchQueue.main.async {
                                (view as! NYLabel).text = String(Int(round(Double(result!)!)))
                            }
                            (view as! NYLabel).value = result
                        }
                    }

                matchingFields = [:]//:completeSettings = none

                
                })
            
                if sender?.superview == nil {
                    backgroundBlocks.append(block)
                } else {
                    foregroundBlocks.append(block)
                }
            }
        
            if NYParser.backgroundQueue.operations.count >  NYParser.opQueue.operations.count {
                NYParser.opQueue.addOperations(backgroundBlocks, waitUntilFinished: false)
                NYParser.opQueue.addOperations(foregroundBlocks, waitUntilFinished: false)
            } else {
                NYParser.backgroundQueue.addOperations(backgroundBlocks, waitUntilFinished: false)
                NYParser.backgroundQueue.addOperations(foregroundBlocks, waitUntilFinished: false)
            }
        
        //}
        
    }
    
    
    
    func willAppendToFields(_ field:UIView) {
        
        self.initFieldsArr()
        
        print("will append \(String(describing: (field as! NYFieldDelegate).id))")
        
        if var fieldDelegate = field as? NYFieldDelegate, let _ = fieldDelegate.id {
            
            if let delegate = self.fields![fieldDelegate.id!] as? NYFieldDelegate  {
                
                if field is NYTextField {
                    (field as! NYTextField).text = delegate.text!
                } else if field is NYLabel {
                    (field as! NYLabel).text = delegate.text!
                }
                
                self.fields![fieldDelegate.id!] = nil
                self.fields![fieldDelegate.id!] = field
                
            } else {
                self.fields![fieldDelegate.id!] = field
            }
        }

    }
    
    
    fileprivate func initFieldsArr() {
        if self.fields == nil {
            self.fields = [:]
        }
    }
    
    
    func getAllIdsInFormula(_ formula: String) -> [String]? {
        var formula = formula.replacingOccurrences(of: "+", with: "`")
        formula = formula.replacingOccurrences(of: "-", with: "`")
        formula = formula.replacingOccurrences(of: "*", with: "`")
        formula = formula.replacingOccurrences(of: "/", with: "`")
        formula = formula.replacingOccurrences(of: "^", with: "`")
        formula = formula.replacingOccurrences(of: "(", with: "`")
        formula = formula.replacingOccurrences(of: ")", with: "`")
        formula = formula.replacingOccurrences(of: ";", with: "`")
        formula = formula.replacingOccurrences(of: ":", with: "`")
        formula = formula.replacingOccurrences(of: "=", with: "`")
        formula = formula.replacingOccurrences(of: ">", with: "`")
        formula = formula.replacingOccurrences(of: "<", with: "`")
        formula = formula.replacingOccurrences(of: "&", with: "`")
        formula = formula.replacingOccurrences(of: "MAX", with: "`")
        formula = formula.replacingOccurrences(of: "MIN", with: "`")
        formula = formula.replacingOccurrences(of: "SUM", with: "`")
        formula = formula.replacingOccurrences(of: "COUNTIF", with: "`")
        formula = formula.replacingOccurrences(of: "ROUNDDOWN", with: "`")
        formula = formula.replacingOccurrences(of: "ROUNDUP", with: "`")
        formula = formula.replacingOccurrences(of: "IF", with: "`")
        formula = formula.replacingOccurrences(of: "OR", with: "`")
        formula = formula.replacingOccurrences(of: "AND", with: "`")
        formula = formula.replacingOccurrences(of: "INDEX", with: "`")
        formula = formula.replacingOccurrences(of: "TEXT", with: "`")
        
        while formula.contains("``") {
            formula = formula.replacingOccurrences(of: "``", with: "`")
        }
        
        return formula.components(separatedBy: "`")
        
    }

    
    func textFieldDelegateFormulaContains(_ txtDelegate: NYFieldDelegate, id: String) -> Bool {
        
        guard let _ = txtDelegate.formula else {
            return false
        }
        
        if txtDelegate.formula!.contains(id) && !txtDelegate.formula!.contains(String("." + "id")){
            return true
        }
        else if txtDelegate.formula!.contains("SUM"){
            let lits = txtDelegate.lits
            
            if let index = lits?.index(where: {$0 == ":"}), index+1 < lits!.count && lits![index+1] != "\'" {
                return self.isIdentfierInRange(lits![index-1], op2: lits![index+1], id: id)
            }
        }

        return false
    }
    
    
    func isIdentfierInRange(_ op1: String, op2: String, id: String) -> Bool {

        if op1 <= id && op2 >= id {
            return true
        }
        
        return false
    }
    
    // Parsing of the formula into an array of String
    //   accordingly to syntax
    // Look at enum NYOperation for the list of support literals
    // Example formula: (4+5)-10
    //
    // Parsed:
    //   [0]: (
    //   [1]: 4
    //   [2]: +
    //   [3]: 5
    //   [4]: )
    //   [5]: -
    //   [6]: 10
    
    func parse(_ formula: String) -> [String]? {
        
        var splitted: [String]? = []
        
        var start: Int?
        var end: Int?

        for index in 0..<formula.characters.count {
            
            let currIndex = formula.characters.index(formula.startIndex, offsetBy: index)
            let endIndex = formula.characters.index(formula.startIndex, offsetBy: formula.characters.count-1)
            let opFromFormula: NYOperation? =  NYOperation(rawValue: String(formula[currIndex]))
            
            if start == nil {
                start = index
            }
            
            end = index

            if opFromFormula != nil || end!+1 == formula.characters.count {
                
                if end!+1 == formula.characters.count && NYOperation(rawValue: String(formula[endIndex])) == nil {
                    end = end! + 1
                }
                
                let startIndex = formula.characters.index(formula.startIndex, offsetBy: start!)
                let endIndex = formula.characters.index(formula.startIndex, offsetBy: end!)
                let range = startIndex..<endIndex
                
                
                if index != start {
                    splitted?.append(formula.substring(with: range))
                    
                } else if NYOperation(rawValue: formula.substring(with: range)) == nil
                    && end! == formula.characters.count {
                    
                    splitted?.append(formula.substring(with: range))
                }
                
                
                if  let _ = opFromFormula {
                    splitted?.append(String(formula[formula.characters.index(formula.startIndex, offsetBy: index)]))
                }
                
                start = nil
                end = nil
                
            }
        }
        
        
        var previousQuotation: Int?
        var previousQuotation2: Int?
        var splitted2: [String]? = []
        
        for index in 0..<splitted!.count {
            if let _ = previousQuotation, splitted![index].contains("\'") {
            
                for index2 in previousQuotation!+1...index {
                    splitted![previousQuotation!] = splitted![previousQuotation!] + (splitted![index2])
                }
                
                splitted2![previousQuotation2!] = splitted![previousQuotation!].replacingOccurrences(of: "\'", with: "")
                
                previousQuotation = nil
                
            } else if splitted![index].contains("\'") &&
                    ((splitted![index].components(separatedBy: "\'").count-1) % 2) == 1 {
            
                splitted2?.append(splitted![index])
                previousQuotation = index
                previousQuotation2 = splitted2!.count - 1
            
            } else if previousQuotation == nil {
                splitted2?.append(splitted![index].replacingOccurrences(of: "\'", with: ""))
            }
        }
        
        splitted = nil
        return splitted2
        
    }
    
    
    // Evaluation of literals
    func evaluatelits(_ literals: [String]?) -> String? {
        
        var lits = literals
        
        guard let _ =  lits else {
            return nil
        }
        
        if lits!.count == 0 {
            return nil
        }
        else if lits!.count == 1 {
            return lits![0]
        }

        
        if var index = self.findNextOperator(lits) {
            
            guard lits!.count > 2 &&
                  lits!.count > index+1 else {
                  return nil
            }
                         
            //PARENTHESIS CASE
            if lits![index] == NYOperation.OpenPar.rawValue {
                
                //MAX MIN RDOWN
                if index != 0 && (lits![index-1] == NYOperation.Max.rawValue ||
                   lits![index-1] == NYOperation.RDown.rawValue || lits![index-1] == NYOperation.RUp.rawValue || lits![index-1] == NYOperation.Min.rawValue) {
                    
                    let semiCol = self.semiColon(index, lits: lits)
                    let closePar = self.closingPar(index, lits: lits)
                    
                    var left = self.evaluatelits(Array(lits![index+1..<semiCol!]))
                    var right = self.evaluatelits(Array(lits![semiCol!+1..<closePar!]))
                    
                    
                    left = self.getValue(left!)
                    right = self.getValue(right!)
                    
                    let answer = self.compute(lits![index-1], op1: left!, op2: right!)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                }
                //COUNTIF
                else if index != 0 && lits![index-1] == NYOperation.CountIf.rawValue {
                    
                    let col = self.col(index, lits: lits)
                    let semiCol = self.semiColon(col!+1, lits: lits)
                    let closePar = self.closingPar(index, lits: lits)
                    
                    let lower = self.evaluatelits(Array(lits![index+1..<col!]))
                    let upper = self.evaluatelits(Array(lits![col!+1..<semiCol!]))
                    let cond = self.getCond(Array(lits![semiCol!+1..<closePar!]))
                    
                    let answer = self.compute(lits![index-1], op1: lower!, op2: upper!, op3: cond)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                }
                // NPV
                else if index != 0 && lits![index-1] == NYOperation.Npv.rawValue {
                    
                    let semiCol = self.semiColon(index, lits: lits)
                    let col = self.col(semiCol!+1, lits: lits)
                    let closePar = self.closingPar(index, lits: lits)
                    
                    let lower = self.evaluatelits(Array(lits![semiCol!+1..<col!]))
                    let upper = self.evaluatelits(Array(lits![col!+1..<closePar!]))
                    let rate = self.getValue(self.evaluatelits(Array(lits![index+1..<semiCol!]))!)
                    
                    
                    let answer = self.compute(lits![index-1], op1: rate, op2: lower!, op3: upper!)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                }
                // INDEX
                else if index != 0 && lits![index-1] == NYOperation.Index.rawValue {
                    
                    let closePar = self.closingPar(index, lits: lits)
                    
                    let left = lits![index+1]
                    let right = lits![index+3]
                    let rowIndex = self.getValue(lits![index+5])
                    
                    let answer = self.compute(lits![index-1], op1: left, op2: right, op3: rowIndex)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                }
                // TEXT
                else if index != 0 && lits![index-1] == NYOperation.Text.rawValue {
                
                    let closePar = self.closingPar(index, lits: lits)
                    
                    let semiCol = self.semiColon(index, lits: lits)
                    
                    let left = self.evaluatelits(Array(lits![index+1..<semiCol!]))
                    let right = self.evaluatelits(Array(lits![semiCol!+1..<closePar!]))
                    
                    let answer = self.compute(lits![index-1], op1: left!, op2: right!)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                }
                // SUM
                else if index != 0 && lits![index-1] == NYOperation.Sum.rawValue {
                    
                    let col = self.col(index, lits: lits)
                    let closePar = self.closingPar(index, lits: lits)
                
                    let left = self.evaluatelits(Array(lits![index+1..<col!]))
                    let right = self.evaluatelits(Array(lits![col!+1..<closePar!]))
                    
                    
                    let answer = self.compute(lits![index-1], op1: left!, op2: right!)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
                } //If
                else if index != 0 && lits![index-1] == NYOperation.If.rawValue {
                    
                    let semiCol1 = self.semiColon(index, lits: lits)
                    let semiCol2 = self.semiColon(semiCol1!, lits: lits)
                    let closePar = self.closingPar(index, lits: lits)
                    
                    let bool = self.evaluatelits(Array(lits![index+1..<semiCol1!]))
                    
                    let answer: String?
                    
                    if bool == "TRUE" {
                        answer = self.evaluatelits(Array(lits![(semiCol1!+1)..<semiCol2!]))
                    } else {
                        answer = self.evaluatelits(Array(lits![(semiCol2!+1)..<closePar!]))
                    }
                    

                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                   return self.evaluatelits(lits)
               }
               // OR AND
               else if index != 0 &&
                    (lits![index-1] == NYOperation.Or.rawValue ||
                    lits![index-1] == NYOperation.And.rawValue)
                {
                    
                    var semiCol: Int?
                    var closePar: Int?
                    var endLit: Int?
                    var answer: String?
                    
                    
                    semiCol = self.semiColon(index, lits: lits)
                    
                    //LOOP AROUND PARAMETERS OF OR, AND
                    repeat {
                        
                        closePar = self.closingPar(index, lits: lits)
                        endLit = closePar
                    
                        let left = self.evaluatelits(Array(lits![index+1..<semiCol!]))
                        var right: String?
                        
                        
                        if let nextSemiCol = self.semiColon(semiCol! + 1, lits: lits) {
                            endLit = nextSemiCol
                            right = self.evaluatelits(Array(lits![semiCol!+1..<endLit!]))
                            
                        } else {
                            right = self.evaluatelits(Array(lits![semiCol!+1..<endLit!]))
                        }
                        
                        
                        answer = self.compute(lits![index-1], op1: left!, op2: right!)
                    
                        if(lits![index-1] == NYOperation.Or.rawValue) {
                            if(answer == "TRUE" ) {
                                break
                            } else {
                                lits!.removeSubrange(index+1...semiCol!)
                            }
                        } else if(lits![index-1] == NYOperation.And.rawValue) {
                            if(answer == "TRUE" ) {
                                lits!.removeSubrange(index+1...semiCol!)
                            } else {
                                break
                            }
                        }
                        
                        endLit = self.semiColon(index + 1, lits: lits)
                        semiCol = self.semiColon(index + 1, lits: lits)
                    
                    } while endLit != nil

                    closePar = self.closingPar(index, lits: lits)
                    lits?[index-1] = answer!
                    lits!.removeSubrange(index...closePar!)
                    
                    return self.evaluatelits(lits)
               }

               else {
                    let closePar = self.closingPar(index, lits: lits)
                    let answer = self.evaluatelits(Array(lits![index+1..<closePar!]))
                    lits![index] = answer!
                    lits!.removeSubrange(index+1...closePar!)
                    return self.evaluatelits(lits)
               }
            

            }
            //ARITHMETIC CASE
            else {
                if self.getValue(lits![index-1]) != "" {
                    lits![index-1] = self.getValue(lits![index-1])
                    
                } else {
                    if lits![index-1] == NYOperation.Less.rawValue ||
                       lits![index-1] == NYOperation.Greater.rawValue {
                        
                        lits![index-1] = "\(lits![index-1])\(lits![index])"
                        lits?.remove(at: index)
                        index = index-1
                        
                        lits![index-1] = self.getValue(lits![index-1])
                    }
                }
   
                
                if self.getValue(lits![index+1]) != "" {
                    lits![index+1] = self.getValue(lits![index+1])
                } else {
                    
                    if let closePar = self.closingPar(index, lits: lits) {
                        let answer = self.evaluatelits(Array(lits![index+1..<closePar]))
                        lits![index+1] = answer!
                    }
                }
                
//                lits![index-1] = self.getValue(lits![index-1])
//                lits![index+1] = self.getValue(lits![index+1])
                
                if let answer = self.compute(lits![index], op1: lits![index-1], op2: lits![index+1]) {
                    
                    guard lits!.count > 2 &&
                        lits!.count > index+1 else {
                            return answer
                    }
                    
                        lits?[index] = answer
                        let previous = index - 1
                        lits?.remove(at: previous)
                        lits?.remove(at: index)
                        return self.evaluatelits(lits)
                    }
            }
        
        }
        
        return self.evaluatelits(lits)
     
    }
    
    
    func getCond(_ lits: [String]?) -> String {
        
        guard let _ = lits else {
            return ""
        }
        
        var cond = ""
        
        for lit in lits! {
            cond = "\(cond)\(lit)"
        }
        
        return cond.replacingOccurrences(of: "\'", with: "")
        
    }
    
    
    func col(_ indexOfOpen: Int, lits:[String]?) -> Int? {
        
        guard let _ = lits else {
            return nil
        }
        
        var numOfOpen = 0
        
        
        for index in indexOfOpen+1..<lits!.count {
            
            if lits![index] == NYOperation.OpenPar.rawValue {
                numOfOpen = numOfOpen + 1
                
            } else if lits![index] == NYOperation.ClosePar.rawValue {
                numOfOpen = numOfOpen - 1
                
            } else if lits![index] == NYOperation.Col.rawValue && numOfOpen == 0 {
                return index
                
            }
        }
        
        return nil
    }
    
    
    func semiColon(_ indexOfOpen: Int, lits:[String]?) -> Int? {
        
        guard let _ = lits else {
            return nil
        }
        
        var numOfOpen = 0
        
        
        for index in indexOfOpen+1..<lits!.count {
          
            if lits![index] == NYOperation.OpenPar.rawValue {
                numOfOpen = numOfOpen + 1
                
            } else if lits![index] == NYOperation.ClosePar.rawValue {
                numOfOpen = numOfOpen - 1
                
            } else if lits![index] == NYOperation.SemiCol.rawValue && numOfOpen == 0 {
                return index
                
            }
        }
        
        return nil
    }
    
    
    func closingPar(_ indexOfOpen: Int, lits:[String]?) -> Int? {
        
        guard let _ = lits else {
            return nil
        }
        
        var numOfOpen = 0
        
        for index in indexOfOpen+1..<lits!.count {
            if lits![index] == NYOperation.OpenPar.rawValue {
                numOfOpen = numOfOpen + 1
            }
            
            if lits![index] == NYOperation.ClosePar.rawValue {
                if numOfOpen == 0 {
                    return index
                } else {
                    numOfOpen-=1
                }
                
            }
        }
        
        return nil
    }
    
    
    // Ensures hierarchy of operations
    // The nearer to the method start the NYOperation is,
    //    the higher is its priority
    func findNextOperator(_ lits: [String]?) -> Int? {
        
        guard let _ =  lits else {
            return nil
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "("{
                return index
            }
        }
        
        
        for index in 0..<lits!.count {
            if lits![index] == "COUNTIF"{
                return index
            }
        }
        
        
        for index in 0..<lits!.count {
            if lits![index] == "NPV"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "SUM"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "MIN"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "MAX"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "ROUNDUP"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "ROUNDDOWN"{
                return index
            }
        }

        for index in 0..<lits!.count {
            if lits![index] == "="{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == ">="{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == ">"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "<="{
                return index
            }
        }

        for index in 0..<lits!.count {
            if lits![index] == "<"{
                return index
            }
        }
        
        for index in 0..<lits!.count {
            if lits![index] == "^"{
                return index
            }
        }
        
        
        for index in 0..<lits!.count {
            if lits![index] == NYOperation.Concat.rawValue {
                return index
            }
        }
   
        for index in 0..<lits!.count {
            if lits![index] == "/"{
                return index
            }
        }
   
        
        for index in 0..<lits!.count {
            if lits![index] == "*"{
                return index
            }
        }
   
        
        for index in 0..<lits!.count {
            if lits![index] == "-"{
                return index
            }
        }
   
        for index in 0..<lits!.count {
            if lits![index] == "+"{
                return index
            }
        }
   
        
        
        return nil
    }
    
    
    // Calls the perform functions
    // Actual computations happens here
    func compute(_ operation: String, op1: String, op2: String, op3: String? = nil) -> String? {
        switch operation {
            case NYOperation.Add.rawValue:
                return self.performAdd(op1, op2: op2)
            case NYOperation.Subt.rawValue:
                return self.performSubt(op1, op2: op2)
            case NYOperation.Mult.rawValue:
                return self.performMult(op1, op2: op2)
            case NYOperation.Div.rawValue:
                return self.performDiv(op1, op2: op2)
            case NYOperation.Pow.rawValue:
                return self.performPow(op1, op2: op2)
            case NYOperation.Concat.rawValue:
                return self.performConcat(op1, op2: op2)
            case NYOperation.Text.rawValue:
                return self.performText(op1, op2: op2)
            case NYOperation.Max.rawValue:
                return self.performMax(op1, op2: op2)
            case NYOperation.Min.rawValue:
                return self.performMin(op1, op2: op2)
            case NYOperation.RDown.rawValue:
                return self.performRDown(op1, op2: op2)
            case NYOperation.RUp.rawValue:
                return self.performRUp(op1, op2: op2)
            case NYOperation.Sum.rawValue:
                return self.performSum(op1, op2: op2)
            case NYOperation.CountIf.rawValue:
                return self.performCountIf(op1, op2: op2, op3: op3!)
            case NYOperation.Npv.rawValue:
                return self.performNpv(op1, op2: op2, op3: op3!)
            case NYOperation.Equals.rawValue:
                return self.performEq(op1, op2: op2)
            case NYOperation.Less.rawValue:
                return self.performLess(op1, op2: op2)
            case NYOperation.Greater.rawValue:
                return self.performGreater(op1, op2: op2)
            case NYOperation.Or.rawValue:
                return self.performOr(op1, op2: op2)
            case NYOperation.And.rawValue:
                return self.performAnd(op1, op2: op2)
            case NYOperation.Index.rawValue:
                return self.performIndex(op1, op2: op2, op3: op3!)
            case NYOperation.Less.rawValue+NYOperation.Equals.rawValue:
                return self.performLessEq(op1, op2: op2)
            case NYOperation.Greater.rawValue+NYOperation.Equals.rawValue:
                return self.performGreaterEq(op1, op2: op2)
            default:
                return nil
        }
        
    }
    
    
    
    func getValue(_ lit: String) -> String {
        
        if Double(lit) != nil {
            return lit
        }
        else if let field = getField(lit) {
            if let obj = field as? NYTextField, !(obj is NYDatePicker), (obj.value == nil || Double(obj.value!) != nil) {
               
                var value = obj.value
                
                if value == nil || value == "" {
                    value = "0"
                }
                return value!
            }
            else {
                return self.getText(field)
            }
        }
        else {
            return self.getText(lit as AnyObject?)
        }
    }
    
    
    func getField(_ id: String) -> UIView? {
        guard let _ = fields else {
            return nil
        }
        
        var newId = id
        
        if id.contains("$") {
            newId = id.replacingOccurrences(of: "$", with: "")
        }
        
        for field in fields! {
            if field.1 is NYTextField {
                if (field.1 as! NYTextField).id == newId {
                    return field.1
                }
            } else if field.1 is NYLabel {
                if (field.1 as! NYLabel).id == newId {
                    return field.1
                }
            }
        }
        
        return nil
        
    }
    
    
    func getText(_ obj: AnyObject?) -> String {
        guard let _ = obj  else {
            return ""
        }
        
        if obj is UIView {
            if obj is NYTextField {
                
                if let text = (obj as! NYTextField).text, text.contains("\'") {
                    (obj as! NYTextField).text = text.replacingOccurrences(of: "\'", with: "")
                }
                
                if (obj as! NYTextField).text == "" {
                    return "0"
                }
                else {
                    if (obj as! NYTextField).inputType == .percent {
                        if let _ = (obj as! NYTextField).value {
                            return (obj as! NYTextField).value!
                        } else {
                            return String(Double((obj as! NYTextField).text!.replacingOccurrences(of: "%", with: ""))!/100)
                        }
                    } else {
                        return (obj as! NYTextField).text!.replacingOccurrences(of: ",", with: "")
                    }
                }
            } else if obj is NYLabel {
                
                if let text = (obj as! NYLabel).text, text.contains("\'") {
                    (obj as! NYLabel).text = text.replacingOccurrences(of: "\'", with: "")
                }
                
                if (obj as! NYLabel).text == "" {
                    return "0"
                }
                else {
                    return (obj as! NYLabel).text!
                }
            }
            else if obj is NYDatePicker {
                
                return (obj as! NYDatePicker).text!
                
            }
        } else if obj is String {
            if (obj as! String) == "TODAY" {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "M/d/Y"
                
                return dateFormatter.string(from: Date())
            }
            else if (obj as! String) == "\'\'" {
                return "0"
            }
        }
        
        return ""
    }
    
    
    static func cleanFields() {
        for field in NYParser.shared.fields! {
            if let lbl = field.1 as? NYLabel, (lbl.id == nil && lbl.formula == nil) {
                //TO DO
                NYParser.shared.fields?.removeValue(forKey: lbl.id!)
            } else if let lbl = field.1 as? NYLabel {
                print("Ids: \(String(describing: lbl.id))")
            }
            else if let txtField = field.1 as? NYTextField, (txtField.id == nil && txtField.formula == nil) {
                //TO DO
                NYParser.shared.fields?.removeValue(forKey: txtField.id!)
           }
        }
        
    }
    
    
}



extension Array where Element: Equatable
{
    mutating func removeObject(_ object: Element) {
        
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
