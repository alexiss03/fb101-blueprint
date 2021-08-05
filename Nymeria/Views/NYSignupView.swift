//
//  NYSignupView.swift
//  Nymeria
//
//  Created by Mac on 6/8/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYSignupViewDelegate {
    func didSubmitButtonPressed()
}

class NYSignupView: NYBaseView {
    
    var delegate: NYSignupViewDelegate?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var contactNoTextField: UITextField!
    
    // IBActions
    @IBAction func didSubmitButtonPressed(_ sender: AnyObject) {
        guard let _ = self.delegate else {
            return
        }
        
        self.delegate?.didSubmitButtonPressed()
    }
}
