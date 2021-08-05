//
//  NYSpreadsheetColHeaderView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 16/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYSpreadsheetColHeaderView: UICollectionViewCell {

    
    @IBOutlet weak var titleLbl: UILabel! {
        didSet {
            self.titleLbl.sizeToFit()
            self.titleLbl.adjustsFontSizeToFitWidth = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
