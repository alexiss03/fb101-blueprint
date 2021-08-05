//
//  NYBaseTableViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYBaseTableViewController: NYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isUserInteractionEnabled = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.isUserInteractionEnabled = true
    }
    


}
