//
//  NYMenuRootViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import RESideMenu

class NYMenuRootViewController: RESideMenu, RESideMenuDelegate {

    
    override func awakeFromNib() {
        
        
        self.contentViewScaleValue = 0.9

        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "contentViewController")
        self.leftMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "leftMenuViewController")
        self.rightMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "rightMenuViewController")
        
        self.backgroundImage = UIImage(named:"MenuBackground")
        self.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
