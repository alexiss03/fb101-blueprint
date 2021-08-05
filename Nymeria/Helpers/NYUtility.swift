//
//  NYUtility.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import PDFGenerator

class NYUtility: NSObject, UIDocumentInteractionControllerDelegate {
    
    
    static let sharedManager = NYUtility()
    
    static func sampleFunc() {

    }
    
    // MARK: Generate PDF methods
    
    var docController: UIDocumentInteractionController?
    
    func generatePDF(viewToSaved v: UIView,
         name: String,
         module: String) {

            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            var filePath = documentsPath + "/\(name)-\(module).pdf"
            filePath = filePath.replacingOccurrences(of: " ", with: "_")
        
            // Outputs as NSData
            do {
                let data = try PDFGenerator.generated(by: v)
                //data.write(to: filePath)
                try data.write(to: URL(string: filePath)!)
            } catch (let error) {
                print(error)
            }
            
            // Writes to Disk directly.
            do {
                //try PDFGenerator.generated([v], outputPath: URL(string: filePath)!)
                try PDFGenerator.generate(v, to: URL(string: filePath)!)
                //try PDFGenerator.generated
                self.openDocumentInteraction(filePath, v: v)
                
            } catch (let error) {
                print(error)
            }

    }
    
    
    
    func openDocumentInteraction(_ filePath: String, v: UIView) {
        
        let targetURL = URL(fileURLWithPath: filePath)
        
        docController = UIDocumentInteractionController(url: targetURL)
        docController!.delegate = self
        
        let url = URL(string:"itms-books:");
        
        if UIApplication.shared.canOpenURL(url!) {
            
            docController!.presentOpenInMenu(from: CGRect(x: v.frame.size.width/2, y: v.frame.size.height, width: 0, height: 0), in: v, animated: true)
            NYLog.log(self, log: "iBooks is installed" as AnyObject?)
        } else {
            
            NYLog.log(self, log: "iBooks is not installed" as AnyObject?)
        }
        
        //TODO: Release docController
    }
    
    static func getDate(_ str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        if let date = dateFormatter.date(from: str) {
            return date
        }
        return nil
    }
    
    static func getStringFromDate(_ date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm:ss a"
        return dateFormatter.string(from: date)
    }
    
    static func timestamp() -> String {
        let curr = Date()
        return String(describing: curr)
    }
    
    static func popUpWithOKButton (_ title: String, message: String) -> UIAlertController {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { (UIAlertAction) in
            
        }
        
        alertController.addAction(cancelAction)
        
        return alertController
        
    }
    
    
    static func getControllerNameWithId(_ id: String) -> String {
        
        switch id {
            case "NYRPSF":
                return "NYRPSavingsFundViewController"
            case "NYRPRF":
                return "NYRPRetirementFundViewController"
            case "NYRPPF":
                return "NYRPPensionFundViewController"
            case "NYRPCF":
                return "NYRPCapitalFundViewController"
            case "NYICLS":
                return "NYICLovingSpouseViewController"
            case "NYICGC":
                return "NYICGratefulChildViewController"
            case "NYICFP":
                return "NYICFamilyProviderViewController"
            case "NYEPLE":
                return "NYEPLifelineEducationViewController"
            case "NYEPSS":
                return "NYEPEducationSpreadsheetViewController"
            case "NYBPDC":
                return "NYBPDeferredCompensationViewController"
            case "NYETCP":
                return "NYEPEstateConservationViewController"
            case "NYETAP":
                return "NYEPEstateAvoidanceViewController"
            case "NYBP":
                return "NYBPBusinessPlanningViewController"
            case "NYBVP":
                return "NYBPBusinessValuationViewController"
            case "NYBPGR":
                return "NYBPGroupRetirementViewController"
            case "NYMITC":
                return "NYMITermConversionViewController"
            case "NYMIBS":
                return "NYMIBenefitSellingViewController"
            case "NYMICA":
                return "NYMIComparativeAnalysisViewController"
            case "NYMIPDI":
                return "NYMIPesoDollarInvestmentViewController"
            
                
            default:
                return ""
        }
    }
}


extension Double {
    // If you don't want your code crash on each overflow, use this function that operates on optionals
    // E.g.: Int(Double(Int.max) + 1) will crash:
    // fatal error: floating point value can not be converted to Int because it is greater than Int.max
    func toInt() -> Int? {
        if self > Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}


extension Float {
    func toInt() -> Int? {
        if self > Float(Int.min) && self < Float(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}


extension Double {
    /// Rounds the double to decimal places value
    mutating func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        let selfTimesDivisor = (self * divisor)
        let floatToRoundOff = selfTimesDivisor / divisor
        return floatToRoundOff.rounded()
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
