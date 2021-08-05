//
//  NYHomeView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYHomeViewDelegate {
    func leftMenuBtnPressed()
    func rightMenuBtnPressed()
}


class NYHomeView: NYBaseView {

    
    var delegate: NYHomeViewDelegate?
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var footerView: UIView! {
        didSet {
            footerView.layer.borderColor = UIColor.white.cgColor
            footerView.layer.borderWidth = 2.0
        }
    }
    
    @IBOutlet weak var mortalityRatePickerView: NYPickerView! {
        didSet {
            mortalityRatePickerView.value = "2001"
            mortalityRatePickerView.toolbar.options = ["1958", "1980", "2001"]
        }
    }
    
    
    
}
