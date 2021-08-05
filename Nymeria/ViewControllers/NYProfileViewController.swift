//
//  NYProfileViewController.swift
//  Nymeria
//
//  Created by Mac on 8/2/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYProfileViewController: NYBaseViewController, NYProfileViewDelegate {
    
    var pageView: NYProfileView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageView = NYProfileView.fromNib("NYProfileView")
        self.pageView?.delegate = self
        self.view = self.pageView
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let user = NYUserSession.current.user {
            self.pageView?.firstNameTextField.text  = user.firstName
            self.pageView?.middleNameTextField.text = user.middleName
            self.pageView?.lastNameTextField.text   = user.lastName
            self.pageView?.emailTextField.text      = user.emailAddress
            self.pageView?.contactNoTextField.text  = user.contactNo
            self.pageView?.titleTextField.text      = user.userTitle
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}
