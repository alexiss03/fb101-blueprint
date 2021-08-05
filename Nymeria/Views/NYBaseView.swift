//
//  NYBaseView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYBaseView: UIView {

   
    override func awakeFromNib() {
       
        if(!NYUserSession.current.hasPendingOpenOfRecord.0) {
        
            
            if let _ = NYParser.shared.fields {
                for field in NYParser.shared.fields! {
                   
                    var f: NYFieldDelegate = (field.value as! NYFieldDelegate)
                    f.dependentFields = nil
                }
            }
            

            NYParser.shared.fields = [:]
        }
    }
    
}
