//
//  NYNavBar.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 25/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


protocol NYNavBarDelegate {
    func  menuBtnPressed()
    func  saveBtnPressed()
}

class NYNavBar: UINavigationBar {
    
    var nvDelegate: NYNavBarDelegate?

    override func awakeFromNib() {
        
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.backgroundColor = UIColor.clear
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
    
    
    @IBAction func menuBtnPressed(_ sender: AnyObject) {
        
        guard let _ = nvDelegate else {
            return
        }
        
        nvDelegate!.menuBtnPressed()
        
    }
    

    @IBAction func saveBtnPressed(_ sender: AnyObject) {
        
        guard let _ = nvDelegate else {
            return
        }
        
        nvDelegate!.saveBtnPressed()
    }
    

}
