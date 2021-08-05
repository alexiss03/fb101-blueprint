//
//  NYSpreadsheetView.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 14/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit


protocol NYSpreadsheetViewDelegate {

}


@objc protocol NYSpreadsheetViewDataSource {
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool
    
    
    @objc optional func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField?
    @objc optional func headerForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> String
    @objc optional func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float
}



class NYSpreadsheetView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var dataSource: NYSpreadsheetViewDataSource?
    var delegate: NYSpreadsheetViewDelegate?
    
    var inputs: [String: String]? = [:]
  
    var collectionView: UICollectionView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.backgroundColor = UIColor.white
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumInteritemSpacing = 0
        
        self.collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: collectionFlowLayout)
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = self.backgroundColor

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.isScrollEnabled = true
        
        
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.register (UINib(nibName: "NYSpreadsheetColHeaderView", bundle: Bundle.main), forCellWithReuseIdentifier:"CellHeader")
        
        self.addSubview(self.collectionView!)
        
    }
    
    // MARK: UICollectionViewDataSource
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numOfCols = 0
        
        if let cols = self.dataSource?.spreadsheetView(self, numberOfColumnsInSpreadsheet: section) {
            numOfCols = cols
        }
        
        if let cols = self.dataSource?.spreadsheetView(self, numberOfColumnsInSpreadsheet: 0) {
            for index in 0..<cols {
                self.collectionView?.register(UINib(nibName: "NYSpreadsheetTextFieldCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CellTextField\(index)")
            }
        }
        
        
        return numOfCols
    }
    
    
    
    final func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cell: UICollectionViewCell?
        
        if indexPath.section == 0  && self.dataSource!.hasHeader(self) {
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellHeader", for: indexPath)
            if let title =  self.dataSource?.headerForColumnInSpreadsheet!(self, column: indexPath.item) {
                (cell  as! NYSpreadsheetColHeaderView).titleLbl.text = title
            }
        }
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTextField\(indexPath.row)", for: indexPath)
            
            weak var txtField = (cell as! NYSpreadsheetTextFieldCell).txtField

            
            if let id = txtField!.id {
                self.inputs?[id] = txtField!.text
            }
            
            if let _ = self.dataSource?.textFieldInSpreadsheet {
                (cell as! NYSpreadsheetTextFieldCell).txtField = self.dataSource?.textFieldInSpreadsheet!(self, column: indexPath.row, row: indexPath.section - (self.dataSource!.hasHeader(self) ?1 : 0 ), field:txtField)
            }
            
        }
        
        return cell!
    }
    
    
    
    final func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let numOfRows = self.dataSource?.numberOfRowsInSpreadsheet(self) {
            return numOfRows
        }
        
        return 1
        
    }
    
    
    final func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell: UICollectionViewCell?
        
        if indexPath.section == 0 {
            cell = NYSpreadsheetColHeaderView.fromNib("NYSpreadsheetColHeaderView")
        }
        else {
            cell = NYSpreadsheetTextFieldCell.fromNib("NYSpreadsheetTextFieldCell")
        }
        
        
        let numOfCols = CGFloat(collectionView.numberOfItems(inSection: indexPath.section))
        var cellWidth = floor(self.collectionView!.frame.size.width/numOfCols)
        
        if let _ = self.dataSource?.widthPercentForColumnInSpreadsheet,
           let percent = self.dataSource?.widthPercentForColumnInSpreadsheet!(self, column: indexPath.row) {
            cellWidth = floor((self.collectionView!.frame.size.width * CGFloat(percent)))
        }
        
        var height = cell!.frame.height
        
        if !self.dataSource!.hasHeader(self) && indexPath.section == 0 {
            height = NYSpreadsheetTextFieldCell.fromNib("NYSpreadsheetTextFieldCell").frame.size.height
        }
    
        
        return CGSize(width: cellWidth, height: height)
    }
    
    
    func prepareForReuse() {
        
    }
    
    
}



