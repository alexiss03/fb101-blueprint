//
//  NYUserSession.swift
//  Nymeria
//
//  Created by UserHanet on 9/18/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


struct NYUser {
    
    var userId          : String! = ""
    var username        : String! = ""
    var fullName        : String! = ""
    var userTitle       : String! = ""
    var firstName       : String! = ""
    var middleName      : String! = ""
    var lastName        : String! = ""
    var contactNo       : String! = ""
    var emailAddress    : String! = ""

}

class NYUserSession: NSObject, NSCoding {
    
    static var current = NYUserSession()
    
    var mortalityRate = "2001"
    
    
    var hasBeenAskedToRestore = false
    var recordId: String?
    var moduleController: NYBaseViewController?
    var moduleId: String?
    var hasPendingOpenOfRecord: (Bool, recordId: String?, formId: String?) = (false, nil, nil)
    
    var user: NYUser?
    
    required init?(coder aDecoder: NSCoder) {
        mortalityRate = aDecoder.decodeObject(forKey: "mortalityRate") as! String
        moduleController = aDecoder.decodeObject(forKey: "moduleController") as? NYBaseViewController
        moduleId = aDecoder.decodeObject(forKey: "moduleId") as? String
        recordId = aDecoder.decodeObject(forKey: "recordId") as? String
    
    }
    
    override init() {
    
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mortalityRate, forKey: "mortalityRate")
        aCoder.encode(moduleController, forKey: "moduleController")
        aCoder.encode(recordId, forKey: "recordId")
        aCoder.encode(moduleId, forKey: "moduleId")
    }
}
