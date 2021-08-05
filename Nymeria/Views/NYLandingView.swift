//
//  NYLandingView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import iCarousel

protocol NYLandingViewDelegate {
    
    func loginBtnPressed()
    func signUpBtnPressed()
}


class NYLandingView: NYBaseView {
    
    
    var delegate: NYLandingViewDelegate?
    

    @IBOutlet weak var carousel: iCarousel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func loginBtnPressed(_ sender: AnyObject) {
        
        guard let _ = self.delegate else {
            return
        }
        
        self.delegate?.loginBtnPressed()
        
    }

    @IBAction func signUpBtnPressed(_ sender: AnyObject) {
       
        guard let _ = self.delegate else {
            return
        }
        
        self.delegate?.signUpBtnPressed()
    }
}
