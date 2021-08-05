//
//  NYHomeViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import RESideMenu
import PDFGenerator


class NYHomeViewController: NYBaseViewController {

    var docController: UIDocumentInteractionController?
    
    var pageView: NYHomeView?
    var menu: RESideMenu?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageView = NYHomeView.fromNib("NYHomeView")
        self.view = self.pageView        
        self.setUpMenuItems(self.navigationController!.navigationBar, title: "", hasCRUD: false)
    
        
        if let _ = NYUserSession.current.moduleController {
            
            
            
            let alertController: UIAlertController
            
            alertController = UIAlertController.init(title: "Restore Previous Session", message: "Do you want to restore your previous session?", preferredStyle: .alert)
            
            let noThanksAction = UIAlertAction.init(title: "No, thanks!", style: .cancel) { (UIAlertAction) in
                NYUserSession.current.hasBeenAskedToRestore = true
            }
            
            
            let yesAction = UIAlertAction.init(title: "Yes", style: .default) { (UIAlertAction) in
                
                if let fields = UserDefaults.standard.object(forKey: "FIELDS") as? Data {
                    NYParser.shared.fields = NSKeyedUnarchiver.unarchiveObject(with: fields) as! [String:UIView]?
                }
               
                NYUserSession.current.hasPendingOpenOfRecord = (true, nil , nil)
                
                let viewControllerName = NYUtility.getControllerNameWithId(NYUserSession.current.moduleId!)
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewControllerName) as UIViewController
                self.sideMenuViewController.setContentViewController(viewController
                    , animated: true)
                
                NYUserSession.current.hasBeenAskedToRestore = true
                
            }
            
            alertController.addAction(noThanksAction)
            alertController.addAction(yesAction)
            
            self.present(alertController, animated: true, completion: {(Void) in
                
            })
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
         NYUserSession.current.mortalityRate = self.pageView!.mortalityRatePickerView.value!
    }

}
