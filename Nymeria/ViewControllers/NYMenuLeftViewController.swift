//
//  NYMenuLeftViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import NAExpandableTableController


struct LeftSubMenuItem {
    
    var subMenuTitle: String?
    var viewController: String?
}


struct LeftMenuItem {
    var menuTitle: String?
    var subMenu: [LeftSubMenuItem]
}


class NYMenuLeftViewController: NYBaseViewController,
        NAExpandableTableViewDataSource,
        NAExpandableTableViewDelegate,
        UITableViewDelegate {

    static var leftMenuManager: NYMenuLeftViewController?

    var pageView: NYMenuLeftView?
    var menu: [LeftMenuItem] = []

    var expandableController: NAExpandableTableController?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageView = NYMenuLeftView.fromNib("NYMenuLeftView")
        
        self.expandableController = NAExpandableTableController(dataSource: self, delegate: self)
    
        self.pageView?.tableView.delegate = self.expandableController
        self.pageView?.tableView.dataSource = self.expandableController
        
        self.loadMenuFromPlist()
        
        self.pageView?.tableView?.register (
            UINib (
                nibName: "NYMenuTableViewCell",
                bundle: Bundle.main),
            forCellReuseIdentifier:"Cell")
        
        self.pageView?.tableView?.register (
            UINib (
                nibName: "NYMenuTableHeaderViewCell",
                bundle: Bundle.main),
            forCellReuseIdentifier:"CellHeader")
        
        self.view = self.pageView

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func loadMenuFromPlist() {
        
        if let path = Bundle.main.path(forResource: "LeftMenu", ofType: "plist"), let arr = NSArray(contentsOfFile: path) as [AnyObject]? {
            
            for menuItem in arr {
    
                if let menuDict = menuItem as? [String: AnyObject] {
                    
                    let menuItemTitle = menuDict["menuTitle"] as! String
                    var subMenu: [LeftSubMenuItem] = []
                    
                    if let subMenuArr = menuDict["subMenu"] as? [AnyObject] {
                        
                        for subMenuItem in subMenuArr {
                            if let subMenuDict = subMenuItem as? [String: AnyObject] {
                                let item = LeftSubMenuItem(subMenuTitle: subMenuDict["subMenuTitle"] as? String, viewController: subMenuDict["viewController"] as? String)
                                subMenu.append(item)
                            }
                        }
                    }
                    menu.append(LeftMenuItem(menuTitle: menuItemTitle, subMenu: subMenu))
                }
                
                
            }
        }

    }

}


//MARK:
extension NYMenuLeftViewController {

    func expandableTableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? NYMenuTableViewCell
        
        if cell == nil {
            cell = NYMenuTableViewCell()
        }
        
        cell!.selectionStyle = .none
        cell!.backgroundColor = UIColor.clear
        cell!.titleLbl.text = menu[indexPath.section].subMenu[indexPath.row].subMenuTitle
        return cell!
    }
    
    
    
    func expandableTableView(_ tableView: UITableView, titleCellForSection section: Int, expanded: Bool) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellHeader") as? NYMenuTableHeaderViewCell
        
        if cell == nil {
            cell = NYMenuTableHeaderViewCell()
        }
        
        cell!.selectionStyle = .none
        cell!.backgroundColor = UIColor.clear
        cell!.titleLbl.text = menu[section].menuTitle
        return cell!
    }
    
    
    func expandableTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        let viewControllerName = menu[indexPath.section].subMenu[indexPath.row].viewController!
        if (viewControllerName == "NYLogoutViewController") {
            self.performSegue(withIdentifier: "logoutToLoginSegue", sender: self)
        } else {
            NYParser.opQueue.waitUntilAllOperationsAreFinished()
            
            let viewControllerName = menu[indexPath.section].subMenu[indexPath.row].viewController!
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewControllerName) as UIViewController
            self.sideMenuViewController.setContentViewController(viewController
                , animated: true)
            self.sideMenuViewController.hideViewController()
        }
    }
    
    func numberOfSectionsInExpandableTableView(_ tableView: UITableView) -> Int {
        return menu.count
    }
    
    func expandableTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[section].subMenu.count
    }

    
}
