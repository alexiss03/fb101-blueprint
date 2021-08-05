//
//  NYOpenFormRecordViewController.swift
//  Nymeria
//
//  Created by UserHanet on 9/5/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import CoreData

class NYOpenFormRecordViewController: NYBaseViewController, NYOpenFormRecordViewDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var v: NYOpenFormRecordView =  NYOpenFormRecordView.fromNib("NYOpenFormRecordView")
    var records: [Record]?
    var formIdToOpen: String = ""
    
    override func viewDidLoad() {
        hasNavBar = false
        super.viewDidLoad()
        
        self.view = self.v
        self.v.delegate = self
        
        v.searchBar.delegate = self
        
        v.tableView.delegate = self
        v.tableView.dataSource = self
        
        v.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        v.tableView?.allowsMultipleSelection = false
        v.tableView?.allowsMultipleSelectionDuringEditing = false
    }
    
    
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = records![indexPath.row].name! + " - " + NYUtility.getStringFromDate(records![indexPath.row].timestamp!)!
        cell.detailTextLabel?.text = records![indexPath.row].form!.name!

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        NYUserSession.current.hasPendingOpenOfRecord = (true, records![indexPath.row].id!, records![indexPath.row].form!.id!)
        
        let viewControllerName = NYUtility.getControllerNameWithId(records![indexPath.row].form!.id!)
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewControllerName) as UIViewController
        NYUserSession.current.moduleController!.sideMenuViewController.setContentViewController(viewController
            , animated: true)
        NYUserSession.current.moduleController!.sideMenuViewController.hideViewController()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let _ = records {
            return records!.count
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            NYDBManager.deleteRecord(records![indexPath.row])
            records?.remove(at: indexPath.row)
            
            v.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: UISearchBarDelegate

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        records = NYDBManager.fetchRecordsWithKeyword(searchBar.text!, formId: NYParser.shared.currentForm)
        v.tableView.reloadData()
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == "" {
             records = NYDBManager.fetchAllRecords()
        } else {
            records = NYDBManager.fetchRecordsWithKeyword(searchBar.text!, formId: NYParser.shared.currentForm)
        }
        v.tableView.reloadData()
        
    }
    
    
    // MARK: NYOpenFormRecordViewDelegate
    
    func dismissBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    
    func editBtnTapped() {
        
        if v.tableView.isEditing {
            v.tableView.isEditing = false
            v.editBtn.title = "Edit"
            
        } else {
            v.tableView.isEditing = true
            v.tableView.allowsMultipleSelectionDuringEditing = false
            
            v.editBtn.title = "Cancel"
        }
    }
    
    
    func filterBtnTapped(_ sender: AnyObject) {
        if v.startDate.text != "" && v.endDate.text != "" {
            records = NYDBManager.fetchRecordsWithKeyword(v.searchBar.text!, formId: NYParser.shared.currentForm, startDate: NYUtility.getDate(v.startDate.text!)!, endDate: NYUtility.getDate(v.endDate.text!)!)
        } else if v.startDate.text == "" {
            self.present(NYUtility.popUpWithOKButton("Error", message: "Please choose a start date."), animated: true, completion: nil)
        } else if v.endDate.text == "" {
            self.present(NYUtility.popUpWithOKButton("Error", message: "Please choose an end date."), animated: true, completion: nil)
        }
        
        v.tableView.reloadData()
    }
}
