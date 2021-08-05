//
//  NYLoginViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import RESideMenu

class NYLoginViewController: NYBaseViewController {

    var v: NYLoginView?

    override func viewDidLoad() {

        super.viewDidLoad()

        v = NYLoginView.fromNib("NYLoginView")
        self.v?.delegate = self

        self.view = v
        self.navigationController?.isNavigationBarHidden = true

    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }

}


extension NYLoginViewController: NYLoginViewDelegate {

    func submitBtnPressed() {
        
        var params = [String : String]()
        params["username"] = self.v!.username.text
        params["password"] = self.v!.password.text
        
        //BEGIN: CREATE TEMPORARY USER
        
        NYUserSession.current.user = NYUser(
            userId          : "user1234",
            username        : "jrizal",
            fullName        : "Jose Rizal",
            userTitle       : "Financial Advisor",
            firstName       : "Jose",
            middleName      : "",
            lastName        : "Rizal",
            contactNo       : "09196582619",
            emailAddress    : "a123@gmail.com")
        self.performSegue(withIdentifier: "TO_HOME", sender: self)
        
//        self.view.endEditing(true)
//        self.showLoadingIndicator()
//
//        NYApiConnector.login( params as [String : AnyObject]?,
//            onSuccess: { (response) -> Void in
//                self.hideLoadingIndicator()
//                if let JSON = response.result.value {
//                    let data = ((JSON as AnyObject)["result"] as! NSDictionary)
//                    var fullName: String = ""
//                    fullName = ((data.value(forKey: "firstName") as AnyObject).appending(" "))
//                    fullName = fullName.appending((data.value(forKey: "lastName"))! as! String)
//                    
//                    NYUserSession.current.user = NYUser(
//                        userId          : "\(String(describing: data.value(forKey: "userId")))",
//                        username        : "\(String(describing: data.value(forKey: "usename")))",
//                        fullName        : fullName,
//                        userTitle       : "Financial Advisor",
//                        firstName       : "\(String(describing: data.value(forKey: "firstName")))",
//                        middleName      : "\(String(describing: data.value(forKey: "middleName")))",
//                        lastName        : "\(String(describing: data.value(forKey: "lastName")))",
//                        contactNo       : "\(String(describing: data.value(forKey: "contactNo")))",
//                        emailAddress    : "\(String(describing: data.value(forKey: "email")))")
//
//                    self.performSegue(withIdentifier: "TO_HOME", sender: self)
//                }
//            }, onFailure: { (response) -> Void in
//                self.hideLoadingIndicator()
//                if let _ = response.result.value {
//                    self.showAlertView("Login", message: "Invalid username or password")
//                } else {
//                    self.showAlertView("Login", message: "Cannot connect to server")
//                }
//            })

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
