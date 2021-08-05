//
//  NYBaseSpreadsheetController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 09/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import RESideMenu

class NYBaseSpreadsheetViewController: NYBaseViewController, NYSpreadheetFormatTemplateViewDelegate {
    
    var fields: [UIView]?
    var pageName: String = ""
    var spreadSheetViews: [NYSpreadsheetView]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpFieldIds()
        self.setUpValidations()
        
        self.setUpComputations()
        self.setUpHiddenFields()
        
        self.addLookUpFields()
        NYParser.shared.currentForm = formId
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NYUserSession.current.recordId = nil
        NYUserSession.current.moduleController = self
        NYUserSession.current.moduleId = self.formId
        
        self.setUpPresenterDetails()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        super.viewDidAppear(animated)

        if(NYUserSession.current.hasPendingOpenOfRecord.0) {
            
            NYParser.opQueue.waitUntilAllOperationsAreFinished()
            
            let recordId = NYUserSession.current.hasPendingOpenOfRecord.1
            let formId = NYUserSession.current.hasPendingOpenOfRecord.2
            
            if let _ = formId, let _ = recordId {
                if let _ = self.spreadSheetViews {
                    for spreadSheet in self.spreadSheetViews! {
                        spreadSheet.collectionView?.reloadData()
                        spreadSheet.collectionView?.performBatchUpdates(nil, completion: { (Bool) in
                             NYDBManager.fetchFieldsWithRecordName(recordId!, formId: formId!)
                        })
                    }
                } else {
                    NYDBManager.fetchFieldsWithRecordName(recordId!, formId: formId!)
                }
            }
            
            NYUserSession.current.recordId = recordId
            NYUserSession.current.hasPendingOpenOfRecord = (false, "", "")
        }
    }
    

    func addLookUpFields() {
       
    }
    
    
    func setUpFieldIds() {
        
    }
    
    
    func setUpComputations() {
        
    }
    
    
    func setUpHiddenFields() {

    }
    
    func setUpValidations() {
        
    }
    
    func setUpPresenterDetails() {
        
    }
    
    // MARK: RESideMenuDelegate
    func sideMenu(_ sideMenu: RESideMenu!, willShowMenuViewController menuViewController: UIViewController!) {

    }
    
    func getMortalityRateArr() ->[Double] {
        if NYUserSession.current.mortalityRate == "2001" {
            return [78.73, 77.79, 76.82, 75.85, 74.87, 73.88, 72.89, 71.91,
                        70.92, 69.94, 68.95, 67.97, 66.99, 66.01, 65.03, 64.06,
                        63.09, 62.12, 61.16, 60.20, 59.24, 58.29, 57.33, 56.37,
                        55.41, 54.46, 53.50, 52.54, 51.59, 50.63, 49.68, 48.72,
                        47.77, 46.81, 45.86, 44.90, 43.95, 43.00, 42.05, 41.11,
                        40.16, 39.22, 38.28, 37.35, 36.42, 35.49, 34.57, 33.65,
                        32.74, 31.84, 30.93, 30.04, 29.15, 28.27, 27.39, 26.53,
                        25.68, 24.83, 24.00, 23.18, 22.36, 21.56, 20.77, 19.99,
                        19.22, 18.46, 17.72, 16.99, 16.27, 15.56, 14.86, 14.18,
                        13.50, 12.85, 12.21, 11.58, 10.97, 10.38, 9.80, 9.24,
                        8.70, 8.18, 7.69, 7.22, 6.77, 6.34, 5.93, 5.55, 5.19,
                        4.86, 4.55, 4.27, 3.98, 3.70, 3.44, 3.21, 3.00, 2.82,
                        2.67, 2.50, 2.34, 2.19, 2.05, 1.91, 1.78, 1.65, 1.54,
                        1.43, 1.33, 1.24, 1.15, 1.07, 1.00, 0.93, 0.85, 0.79,
                        0.73, 0.67, 0.61, 0.56, 0.5]
        }
        else if  NYUserSession.current.mortalityRate == "1980" {
            return  [73.33, 72.59, 71.66, 70.72, 69.78, 68.84, 67.90, 66.95,
                        66.00, 65.05, 64.10, 63.14, 62.19, 61.24, 60.29, 59.35,
                        58.41, 57.48, 56.55, 55.63, 54.71, 53.79, 52.87, 51.94,
                        51.02, 50.09, 49.16, 48.23, 47.30, 46.37, 45.44, 44.51,
                        43.58, 42.65, 41.72, 40.80, 39.87, 38.95, 38.03, 37.12,
                        36.21, 35.31, 34.41, 33.52, 32.63, 31.75, 30.88, 30.01,
                        29.15, 28.29, 27.44, 26.60, 25.76, 24.93, 24.11, 23.30,
                        22.50, 21.71, 20.92, 20.15, 19.38, 18.61, 17.86, 17.12,
                        16.39, 15.68, 14.98, 14.29, 13.62, 12.96, 12.31, 11.68,
                        11.06, 10.45, 9.87, 9.31, 8.77, 8.26, 7.76, 7.29,
                        6.83, 6.39, 5.96, 5.56, 5.18, 4.82, 4.49, 4.17,
                        3.87, 3.59, 3.32, 3.05, 2.77, 2.50, 2.20, 1.89,
                        1.55, 1.20, 0.84, 0.50]
        }
        else if NYUserSession.current.mortalityRate == "1958" {
            return [69.73, 69.19, 68.31, 67.41, 66.50, 65.59, 64.68, 63.76,
                        62.83, 61.91, 60.98, 60.05, 59.12, 58.19, 57.26, 56.33,
                        55.41, 54.49, 53.57, 52.65, 51.74, 50.83, 49.92, 49.00,
                        48.09, 47.18, 46.27, 45.36, 44.45, 43.53, 42.62, 41.71,
                        40.80, 39.88, 38.97, 38.06, 37.15, 36.24, 35.33, 34.43,
                        33.53, 32.63, 31.74, 30.86, 29.98, 29.11, 28.24, 27.39,
                        26.54, 25.70, 24.87, 24.05, 23.24, 22.44, 21.65, 20.87,
                        20.11, 19.35, 18.61, 17.89, 17.18, 16.48, 15.79, 15.13,
                        14.48, 13.84, 13.22, 12.62, 12.04, 11.47, 10.93, 10.40,
                        9.89, 9.41, 8.93, 8.48, 8.04, 7.61, 7.20, 6.80, 6.42,
                        6.05, 5.70, 5.37, 5.06, 4.76, 4.47, 4.20, 3.94, 3.68,
                        3.43, 3.19, 2.94, 2.70, 2.45, 2.19, 1.92, 1.63, 1.32,
                        1.00, 0.59, 0.42, 0.25]
        }
        
        return []
    }
    
    func getBenefitSellingArr() ->[Double] {
        
        return [78.73, 77.79, 76.82, 75.85, 74.87, 73.88, 72.89, 71.91, 70.92, 69.94, 68.95, 67.97, 66.99, 66.01, 65.03, 64.06, 63.09, 62.12, 61.16, 60.20, 59.24, 58.29, 57.33, 56.37, 55.41, 54.46, 53.50, 52.54, 51.59, 50.63, 49.68, 48.72, 47.77, 46.81, 45.86, 44.90, 43.95, 43.00, 42.05, 41.11, 40.16, 39.22, 38.28, 37.35, 36.42, 35.49, 34.57, 33.65, 32.74, 31.84, 30.93, 30.04, 29.15, 28.27, 27.39, 26.53, 25.68, 24.83, 24.00, 23.18, 22.36, 21.56, 20.77, 19.99, 19.22, 18.46, 17.72, 16.99, 16.27, 15.56, 14.86, 14.18, 13.50, 12.85, 12.21, 11.58, 10.97, 10.38, 9.80, 9.24, 8.70, 8.18, 7.69, 7.22, 6.77, 6.34, 5.93, 5.55, 5.19, 4.86, 4.55, 4.27, 3.98, 3.70, 3.44, 3.21, 3.00, 2.82, 2.67, 2.50, 2.34, 2.19, 2.05, 1.91, 1.78, 1.65, 1.54, 1.43, 1.33, 1.24, 1.15, 1.07, 1.00, 0.93, 0.85, 0.79, 0.73, 0.67, 0.61, 0.56, 0.50]
    }
    
    func getLifeExpectancyArr() -> [Double] {
        
        return [78.73, 77.79, 76.82, 75.85, 74.87, 73.88, 72.89, 71.91, 70.92, 69.94, 68.95, 67.97, 66.99, 66.01, 65.03, 64.06, 63.09, 62.12, 61.16, 60.20, 59.24, 58.29, 57.33, 56.37, 55.41, 54.46, 53.50, 52.54, 51.59, 50.63, 49.68, 48.72, 47.77, 46.81, 45.86, 44.90, 43.95, 43.00, 42.05, 41.11, 40.16, 39.22, 38.28, 37.35, 36.42, 35.49, 34.57, 33.65, 32.74, 31.84, 30.93, 30.04, 29.15, 28.27, 27.39, 26.53, 25.68, 24.83, 24.00, 23.18, 22.36, 21.56, 20.77, 19.99, 19.22, 18.46, 17.72, 16.99, 16.27, 15.56, 14.86, 14.18, 13.50, 12.85, 12.21, 11.58, 10.97, 10.38, 9.80, 9.24, 8.70, 8.18, 7.69, 7.22, 6.77, 6.34, 5.93, 5.55, 5.19, 4.86, 4.55, 4.27, 3.98, 3.70, 3.44, 3.21, 3.00, 2.82, 2.67, 2.50, 2.34, 2.19, 2.05, 1.91, 1.78, 1.65, 1.54, 1.43, 1.33, 1.24, 1.15, 1.07, 1.00, 0.93, 0.85, 0.79, 0.73, 0.67, 0.61, 0.56, 0.50]
        
    }
    
}
