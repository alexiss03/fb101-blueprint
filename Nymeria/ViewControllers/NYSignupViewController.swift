//
//  NYSignupViewController.swift
//  Nymeria
//
//  Created by Gilmar San Buenaventura on 6/8/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYSignupViewController: NYBaseViewController {
    
    var pageView: NYSignupView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageView = NYSignupView.fromNib("NYSignupView")
        self.pageView?.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
        self.view = self.pageView
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}


extension NYSignupViewController: NYSignupViewDelegate {
    
    func didSubmitButtonPressed() {
        
        var params = [String : String]()
        params["email"] = self.pageView?.emailAddressTextField.text
        params["username"] = self.pageView?.usernameTextField.text
        params["password"] = self.pageView?.passwordTextField.text
        params["lastName"] = self.pageView?.lastNameTextField.text
        params["firstName"] = self.pageView?.firstNameTextField.text
        params["contactNo"] = self.pageView?.contactNoTextField.text
        params["middleName"] = self.pageView?.middleNameTextField.text
        
        self.view.endEditing(true)
        self.showLoadingIndicator()
        
        NYApiConnector.signup( params as [String : AnyObject]?, onSuccess: { (response) -> Void in
            self.hideLoadingIndicator()
            self.dismiss(animated: true, completion: nil)
        }, onFailure: { (response) -> Void in
            self.hideLoadingIndicator()
            if let JSON = response.result.value as! [String : AnyObject]? {
                if JSON["statusCode"]!.integerValue == 204 {
                    self.showAlertView("Sign up", message: "Username or email already taken!")
                } else {
                    self.showAlertView("Sign up", message: "Sorry, there was an error on saving data.")
                }
            } else {
                self.showAlertView("Sign up", message: "Sorry, there was an error on saving data.")
            }
        })
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
