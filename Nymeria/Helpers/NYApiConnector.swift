//
//  NYApiConnector.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NYApiConnector {
    
    static func login( _ params: [String: AnyObject]?,
                       onSuccess: @escaping (DataResponse<Any>) -> Void,
                       onFailure: @escaping (DataResponse<Any>) -> Void) {
        
        let URL = Foundation.URL(string: NYConstants.ENDPOINT_LOGIN)!
        var mutableURLRequest = URLRequest(url: URL)
        mutableURLRequest.httpMethod = "POST"
        
        let loginString = String(format: "%@", params!)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        do {
            mutableURLRequest.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
        } catch { }

        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        mutableURLRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(mutableURLRequest as URLRequestConvertible)
            .responseJSON { response in
                print("request: \(String(describing: response.request))")
                print("response: \(String(describing: response.result.value))")
                
                if response.response?.statusCode == 200 {
                    onSuccess(response)
                } else {
                    onFailure(response)
                }
        }
        
    }
    
    static func signup(_ params: [String: AnyObject]?,
                       onSuccess: @escaping (DataResponse<Any>) -> Void,
                       onFailure: @escaping (DataResponse<Any>) -> Void) {
        
        let URL = Foundation.URL(string: NYConstants.ENDPOINT_SIGNUP)!
        var mutableURLRequest = URLRequest(url: URL)
        mutableURLRequest.httpMethod = "POST"
        
        do {
            mutableURLRequest.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
        } catch { }
        
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Authorization")
        
        Alamofire.request( mutableURLRequest as URLRequestConvertible )
            .responseJSON { response in
                print("request: \(String(describing: response.request))")
                print("response: \(String(describing: response.result.value))")
                
                if response.response?.statusCode == 200 {
                    if let JSON = response.result.value as! [String : AnyObject]? {
                        if JSON["statusCode"]?.integerValue == 200 {
                            onSuccess( response )
                        } else {
                            onFailure( response )
                        }
                    }
                } else {
                    onFailure( response )
                }
        }
    }
    
//    class func getHeadersWithAuth() -> HTTPHeaders {
//        
//        let username = UserHelper.getUsername()!
//        let password = UserHelper.getPassword()!
//        let loginString = String(format: "%@:%@", username, password)
//        let loginData = loginString.data(using: String.Encoding.utf8)!
//        let base64LoginString = loginData.base64EncodedString()
//        var headersWithAuth = getHeaders()
//        headersWithAuth["Authorization"] = "Basic \(base64LoginString)"
//        return headersWithAuth
//        
//    }
//    
//    class func getHeaders() -> HTTPHeaders {
//        
//        let headers: HTTPHeaders = [
//            "Accept": "application/json",
//            "Content-Type": "application/json"
//        ]
//        
//        return headers
//    }
    
    
    
}
