//
//  NYLog.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//


class NYLog {
    
    static func log(_ classObj: AnyObject?, log: AnyObject?) {
        print("================")
        print("\(String(describing: classObj.self))")
        print("Log: \(String(describing: log))")
        print("================")
    }

}
