//
//  NYProfileView.swift
//  Nymeria
//
//  Created by Mac on 8/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

protocol NYProfileViewDelegate {
    
}

class NYProfileView: NYBaseView {
    
    var delegate: NYProfileViewDelegate?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var birthdateTextField: NYDatePicker!
    @IBOutlet weak var contactNoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var branchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
}