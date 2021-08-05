//
//  NYOpenFormRecordView.swift
//  Nymeria
//
//  Created by UserHanet on 9/5/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


protocol NYOpenFormRecordViewDelegate {
    func dismissBtnTapped()
    func editBtnTapped()
    func filterBtnTapped(_ sender: AnyObject)
}

class NYOpenFormRecordView: NYBaseView {
    
    var delegate: NYOpenFormRecordViewDelegate?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    @IBOutlet weak var startDate: NYDatePicker!
    @IBOutlet weak var endDate: NYDatePicker!
    
    
    @IBAction func dismissBtnTapped(_ sender: AnyObject) {
        self.delegate?.dismissBtnTapped()
    }
    
    
    @IBAction func editBtnTapped(_ sender: AnyObject) {
        self.delegate?.editBtnTapped()
    }
    
    
    @IBAction func filterBtnTapped(_ sender: AnyObject) {
        self.delegate?.filterBtnTapped(sender)
        
    }

}
