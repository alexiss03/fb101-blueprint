//
//  NYConstants.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 06/08/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYConstants {
    
//    static var BASE_URL = "http://128.199.236.86:5000/api"
    static var BASE_URL = "http://192.168.1.3:5003/api"
    static var ENDPOINT_LOGIN = BASE_URL + "/account/login"
    static var ENDPOINT_SIGNUP = BASE_URL + "/account/signup"
    
    static var COLOR_RED = UIColor.init(netHex: 0xE73B3F)
    static var COLOR_LIGHT_BLUE = UIColor.init(netHex: 0x2244B4)
    
    static var SCREEN_SIZE = UIScreen.main.bounds
    static var IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad)
    static var SCREEN_WIDTH =  UIScreen.main.bounds.size.width //([[UIScreen mainScreen] bounds].size.width)
    static var SCREEN_HEIGHT =  UIScreen.main.bounds.size.height //([[UIScreen mainScreen] bounds].size.height)
    static var IS_IPAD_PRO_1366 = (IS_IPAD && max(SCREEN_WIDTH,SCREEN_HEIGHT) == 1366.0)
    static var IS_IPAD_PRO_1024 =  (IS_IPAD && max(SCREEN_WIDTH,SCREEN_HEIGHT) == 1024.0)

}
