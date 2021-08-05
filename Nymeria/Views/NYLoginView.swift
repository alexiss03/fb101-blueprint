//
//  NYLoginViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


protocol NYLoginViewDelegate {
    
    func submitBtnPressed()
}


class NYLoginView: NYBaseView {

    var delegate: NYLoginViewDelegate?
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func submitBtnPressed(_ sender: AnyObject) {
        
        guard let _ = self.delegate else {
            return
        }
        
        self.delegate?.submitBtnPressed()
    }
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
    }

}
