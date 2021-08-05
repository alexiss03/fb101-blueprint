//
//  NYEPEducationSpreadsheetViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 17/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit

class NYEPEducationSpreadsheetViewController:
    NYBaseSpreadsheetViewController,
    NYSpreadsheetViewDataSource,
    NYSpreadsheetViewDelegate {

    var v: NYEPEducationSpreadsheetView?
    
    override func viewDidLoad() {
        
        formId = "NYEPSS"
        formName = "Educational Planning Education Spread Sheet"

        self.v = NYEPEducationSpreadsheetView.fromNib("NYEPEducationSpreadsheetView")
        self.scrollView = self.v?.scrollView
        self.view = self.v
        
        
        self.v?.spiralingFutureSpreadsheet1.delegate = self
        self.v?.spiralingFutureSpreadsheet1.dataSource = self
        
        self.v?.spiralingFutureSpreadsheet2.delegate = self
        self.v?.spiralingFutureSpreadsheet2.dataSource = self
        
        self.v?.spiralingFutureSpreadsheet3.delegate = self
        self.v?.spiralingFutureSpreadsheet3.dataSource = self
        
        v?.scrollView.delegate = self
        
        if NYConstants.IS_IPAD_PRO_1366 {
            v?.scrollView.minimumZoomScale = 1.33
            v?.scrollView.maximumZoomScale = 2.0
            v?.scrollView.zoomScale = 1.33
        } else {
            v?.scrollView.minimumZoomScale = 1.0
            v?.scrollView.maximumZoomScale = 2.0
        }
        
        self.setUpMenuItems(v!.navBar, title: "Education Spreadsheet")
        
        txtFieldReferenceFieldRecordName = v?.S2
        
        self.spreadSheetViews = []
        self.spreadSheetViews?.append(v!.spiralingFutureSpreadsheet1)
        self.spreadSheetViews?.append(v!.spiralingFutureSpreadsheet2)
        self.spreadSheetViews?.append(v!.spiralingFutureSpreadsheet3)
        
        
        super.viewDidLoad()
       
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let educationLvl =  ["Elementary", "High School", "College", "Masteral", "Doctorate"]
        
        self.v?.N5.toolbar.options = educationLvl as NSArray?
        self.v?.Z5.toolbar.options = educationLvl as NSArray?
        self.v?.AL5.toolbar.options = educationLvl as NSArray?
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: NYSpreadsheetViewDataSource
    func spreadsheetView(_ spreadSheetView: NYSpreadsheetView, numberOfColumnsInSpreadsheet section: Int) -> Int {
        return 2
    }
    
    func numberOfRowsInSpreadsheet(_ spreadSheetView: NYSpreadsheetView) -> Int {
        
        return 7
    }
    
    func hasHeader(_ spreadSheetView: NYSpreadsheetView) -> Bool {
        
        return false
    }
    
    
    func textFieldInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int, row: Int, field: NYTextField?) -> NYTextField? {
        
        field?.textColor = UIColor.init(red: 34, green: 68, blue: 180)
        spreadSheetView.collectionView?.isScrollEnabled = false
        
        if spreadSheetView == v?.spiralingFutureSpreadsheet1 {
            switch (column, row) {
                case (1, 0):
                    field?.formula = "IF(OR(N7='';N8='';N9='';N10='';M$6>N7);'';N8*(1+N9)^(N7-M$6))"
                    field?.id = "N\(13+row)"
                    field?.textAlignment = .center
                case (1, row):
                    field?.formula = "IF(N\(row+12)='';'';IF(AR$\(row+13)>N$10;0;N\(row+12)*(1+N$9)))"
                    field?.id = "N\(13+row)"
                    field?.textAlignment = .center
                case (0, row):
                    field?.formula = "IF(OR(N11='';N\(13+row)=0);'';IF(N$5='Elementary';'Grade  \(row+1)';AT$\(13+row)))"
                    field?.id = "L\(row+13)"
                    field?.textAlignment = .right
                    field?.borderStyle = .none
                    field?.inputType = .text
                    field?.font = field?.font?.withSize(13.0)
                    field?.layer.sublayerTransform = CATransform3DMakeTranslation(-20, 000, 0);
                default:
                    break
               
            }
        } else if spreadSheetView == v?.spiralingFutureSpreadsheet2 {
            switch (column, row) {
                case (1, 0):
                    field?.formula = "IF(OR(Z7='';Z8='';Z9='';Z10='';Y$6>Z7);'';Z8*(1+Z9)^(Z7-Y$6))"
                    field?.id = "Z\(13+row)"
                    field?.textAlignment = .center
                case (1, row):
                    field?.formula = "IF(Z\(row+12)='';'';IF(AR$\(row+13)>Z$10;0;Z\(row+12)*(1+Z$9)))"
                    field?.id = "Z\(13+row)"
                    field?.textAlignment = .center
                case (0, row):
                    field?.formula = "IF(OR(Z11='';Z\(13+row)=0);'';IF(Z$5='Elementary';'Grade  \(row+1)';$AU\(13+row)))"
                    field?.id = "X\(row+13)"
                    field?.textAlignment = .right
                    field?.borderStyle = .none
                    field?.inputType = .text
                    field?.font = field?.font?.withSize(13.0)
                    field?.layer.sublayerTransform = CATransform3DMakeTranslation(-20, 000, 0);
                default:
                    break
                
            }
        } else if spreadSheetView == v?.spiralingFutureSpreadsheet3 {
                switch (column, row) {
                case (1, 0):
                    field?.formula = "IF(OR(AL7='';AL8='';AL9='';AL10='';AK$6>AL7);'';AL8*(1+AL9)^(AL7-AK$6))"
                    field?.id = "AL\(13+row)"
                    field?.textAlignment = .center
                case (1, row):
                    field?.formula = "IF(AL\(row+12)='';'';IF(AR$\(row+13)>AL$10;0;AL\(row+12)*(1+AL$9)))"
                    field?.id = "AL\(13+row)"
                    field?.textAlignment = .center
                case (0, row):
                    field?.formula = "IF(OR(AJ11='';AJ\(13+row)=0);'';IF(AJ$5='Elementary';'Grade  \(row+1)';$AV\(13+row)))"
                    field?.id = "X\(row+13)"
                    field?.textAlignment = .right
                    field?.borderStyle = .none
                    field?.inputType = .text
                    field?.font = field?.font?.withSize(13.0)
                    field?.layer.sublayerTransform = CATransform3DMakeTranslation(-20, 000, 0);
                default:
                    break
                    
                }
        }
        
        field?.isUserInteractionEnabled = false
        return field
    }
    
    
    
    func widthPercentForColumnInSpreadsheet(_ spreadSheetView: NYSpreadsheetView, column: Int) -> Float {
        if column == 0 {
            return 0.6
        } else if column == 1 {
            return 0.4
        }
        return 0.1
    }
    
    
    override func setUpFieldIds() {
        
        self.v?.S2.id = "S2"
        
        //FIRST COLUMN
        
        
        self.v?.L5.id = "L5"
        self.v?.L6.id = "L6"
        self.v?.L7.id = "L7"
        self.v?.L8.id = "L8"
        self.v?.L9.id = "L9"
        self.v?.L10.id = "L10"
        self.v?.L11.id = "L11"
        
        self.v?.M6.id = "M6"
        self.v?.M27.id = "M27"
        self.v?.M28.id = "M28"
        self.v?.M32.id = "M32"
        self.v?.M35.id = "M35"
        
        
        self.v?.N4.id = "N4"
        self.v?.N5.id = "N5"
        self.v?.N6.id = "N6"
        self.v?.N7.id = "N7"
        self.v?.N8.id = "N8"
        self.v?.N9.id = "N9"
        self.v?.N10.id = "N10"
        self.v?.N11.id = "N11"
        self.v?.N23.id = "N23"
        self.v?.N26.id = "N26"
        self.v?.N27.id = "N27"
        self.v?.N28.id = "N28"
        self.v?.N29.id = "N29"
        
 
        self.v?.N30.id = "N30"
        self.v?.N32.id = "N32"
        self.v?.N33.id = "N33"
        self.v?.N34.id = "N34"
        self.v?.N35.id = "N35"
        self.v?.N36.id = "N36"
        self.v?.N37.id = "N37"
        self.v?.N39.id = "N39"
        
        
        
        //SECOND COLUMN
        self.v?.X5.id = "X5"
        self.v?.X6.id = "X6"
        self.v?.X7.id = "X7"
        self.v?.X8.id = "X8"
        self.v?.X9.id = "X9"
        self.v?.X10.id = "X10"
        self.v?.X11.id = "X11"
        
        self.v?.Y6.id = "Y6"
        self.v?.Y27.id = "Y27"
        self.v?.Y28.id = "Y28"
        self.v?.Y32.id = "Y32"
        self.v?.Y35.id = "Y35"
        
        
        self.v?.Z4.id = "Z4"
        self.v?.Z5.id = "Z5"
        self.v?.Z6.id = "Z6"
        self.v?.Z7.id = "Z7"
        self.v?.Z8.id = "Z8"
        self.v?.Z9.id = "Z9"
        self.v?.Z10.id = "Z10"
        self.v?.Z11.id = "Z11"
        self.v?.Z23.id = "Z23"
        self.v?.Z26.id = "Z26"
        self.v?.Z27.id = "Z27"
        self.v?.Z28.id = "Z28"
        self.v?.Z29.id = "Z29"
        
        
        self.v?.Z30.id = "Z30"
        self.v?.Z32.id = "Z32"
        self.v?.Z33.id = "Z33"
        self.v?.Z34.id = "Z34"
        self.v?.Z35.id = "Z35"
        self.v?.Z36.id = "Z36"
        self.v?.Z37.id = "Z37"
        self.v?.Z39.id = "Z39"

        
        
        //THIRD COLUMN
        self.v?.AJ5.id = "AJ5"
        self.v?.AJ6.id = "AJ6"
        self.v?.AJ7.id = "AJ7"
        self.v?.AJ8.id = "AJ8"
        self.v?.AJ9.id = "AJ9"
        self.v?.AJ10.id = "AJ10"
        self.v?.AJ11.id = "AJ11"
        
        self.v?.AK6.id = "AK6"
        self.v?.AK27.id = "AK27"
        self.v?.AK28.id = "AK28"
        self.v?.AK32.id = "AK32"
        self.v?.AK35.id = "AK35"
        
        
        self.v?.AL4.id = "AL4"
        self.v?.AL5.id = "AL5"
        self.v?.AL6.id = "AL6"
        self.v?.AL7.id = "AL7"
        self.v?.AL8.id = "AL8"
        self.v?.AL9.id = "AL9"
        self.v?.AL10.id = "AL10"
        self.v?.AL11.id = "AL11"
        self.v?.AL23.id = "AL23"
        self.v?.AL26.id = "AL26"
        self.v?.AL27.id = "AL27"
        self.v?.AL28.id = "AL28"
        self.v?.AL29.id = "AL29"
        
        
        self.v?.AL30.id = "AL30"
        self.v?.AL32.id = "AL32"
        self.v?.AL33.id = "AL33"
        self.v?.AL34.id = "AL34"
        self.v?.AL35.id = "AL35"
        self.v?.AL36.id = "AL36"
        self.v?.AL37.id = "AL37"
        self.v?.AL39.id = "AL39"

        //Set text to empty strings
        self.v?.M6.text = ""
        self.v?.L5.text = ""
        self.v?.L6.text = ""
        self.v?.L7.text = ""
        self.v?.L8.text = ""
        self.v?.L9.text = ""
        self.v?.L10.text = ""
        self.v?.L11.text = ""
        
        self.v?.Y6.text = ""
        self.v?.X5.text = ""
        self.v?.X6.text = ""
        self.v?.X7.text = ""
        self.v?.X8.text = ""
        self.v?.X9.text = ""
        self.v?.X10.text = ""
        self.v?.X11.text = ""
        
        self.v?.AK6.text = ""
        self.v?.AJ5.text = ""
        self.v?.AJ6.text = ""
        self.v?.AJ7.text = ""
        self.v?.AJ8.text = ""
        self.v?.AJ9.text = ""
        self.v?.AJ10.text = ""
        self.v?.AJ11.text = ""
        
        
    }
    
    override func setUpComputations() {
        //FIRST COLUMN
        self.v?.M6.formula = "IF(N6>0;ROUNDDOWN((TODAY-N6)/365;0);'')"
        
        self.v?.N11.formula = "IF(OR(N7='';N8='';N9='';N10='';M$6>N7);'';MAX(NPV(N33;N14:N19)+N13-N30;0))"
        
        //=IF(OR(N7="";N8="";N9="";N10="";M$6>N7);"";MAX(NPV(N33;N14:N22)+N13-N30;0))
        
        self.v?.N23.formula = "IF(N13='';'';SUM(N13:N22))"
        
        self.v?.N29.formula = "IF(N$6='';'';SUM(N26:N28))"
        self.v?.N30.formula = "IF(N13='';'';N26+N27*(1+M27)^(N7-M$6)+N28*(1+M28)^(N7-M$6))"
        self.v?.M32.formula = "IF(OR(N11='';N$6='';N7='');'';MAX(N7-M$6;0))"
        self.v?.N34.formula = "IF(OR(N11='';N32=0;N32='');'';N11/(1+N33)^MAX(N7-M6;0)/((1-1/P40^MIN(N32;MAX(N7-M6;0)))/P41*P40))"
        self.v?.M35.formula = "IF(N35='';M6+0;IF(OR(N11='';N$6='';N7'';N35<M$6);'';N7-N35))"
        self.v?.N36.formula = "IF(OR(N11='';N32=0;N33='';N35='');'';IF(N35=N7;N11;N11/((1-1/P40^MIN(N32;MAX(N7-N35;0)))/P41*P40)/(1+N33)^MAX(N7-N35;0)))"
        self.v?.N39.formula = "IF(OR(N32='';N11='');'';N29+SUM(N40:N59)*N34)"

        

        self.v?.L5.formula = "IF(N4='';'';'School Level:')"
        self.v?.L6.formula = "IF(N5='';'';'Birthday:')"
        self.v?.L7.formula = "IF(N6='';'';'Age @'&AT5&':')"
        self.v?.L8.formula = "IF(N7='';'';'Annual Tuition Fee:')"
        self.v?.L9.formula = "IF(N8='';'';'Annual Increase:')"
        self.v?.L10.formula = "IF(N9='';'';'Years in '&N5&':')"
        self.v?.L11.formula = "IF(N10='';'';'Fund Required @'&N7&':')"
        

        
        //SECOND COLUMN
        self.v?.Y6.formula = "IF(Z6>0;ROUNDDOWN((TODAY-Z6)/365;0);'')"
        
        self.v?.Z11.formula = "IF(OR(Z7='';Z8='';Z9='';Z10='';Y$6>Z7);'';MAX(NPV(Z33;Z14:Z19)+Z13-Z30;0))"
        self.v?.Z23.formula = "IF(Z13='';'';SUM(Z13:Z22))"
        
        self.v?.Z29.formula = "IF(Z$6='';'';SUM(Z26:Z28))"
        self.v?.Z30.formula = "IF(Z13='';'';Z26+Z27*(1+Y27)^(Z7-Y$6)+Z28*(1+Y28)^(Z7-Y$6))"
        self.v?.Y32.formula = "IF(OR(Z11='';Z$6='';Z7='');'';MAX(Z7-Y$6;0))"
        self.v?.Z34.formula = "IF(OR(Z11='';Z32=0;Z32='');'';Z11/(1+Z33)^MAX(Z7-Y6;0)/((1-1/AB40^MIN(Z32;MAX(Z7-Y6;0)))/AB41*AB40))"
        self.v?.Y35.formula = "IF(Z35='';Y6+0;IF(OR(Z11='';Z$6='';Z7='';Z35<Y$6);'';Z7-Z35))"
        self.v?.Z36.formula = "IF(OR(Z11='';Z32=0;Z33='';Z35='');'';IF(Z35=Z7;Z11;Z11/((1-1/AB40^MIN(Z32;MAX(Z7-Z35;0)))/AB41*AB40)/(1+Z33)^MAX(Z7-Z35;0)))"
        self.v?.Z39.formula = "IF(OR(Z32='';Z11='');'';Z29+SUM(Z40:Z59)*Z34)"
        
        
        self.v?.X5.formula = "IF(Z4='';'';'School Level:')"
        self.v?.X6.formula = "IF(Z5='';'';'Birthday:')"
        self.v?.X7.formula = "IF(Z6='';'';'Age @'&AU5&':')"
        self.v?.X8.formula = "IF(Z7='';'';'Annual Tuition Fee:')"
        self.v?.X9.formula = "IF(Z8='';'';'Annual Increase:')"
        self.v?.X10.formula = "IF(Z9='';'';'Years in '&Z5&':')"
        self.v?.X11.formula = "IF(Z10='';'';'Fund Required @'&Z7&':')"
        
        //THIRD COLUMN
        self.v?.AK6.formula = "IF(AL6>0;ROUNDDOWN((TODAY-AL6)/365;0);'')"
        
        self.v?.AL11.formula = "IF(OR(AL7='';AL8='';AL9='';AL10='';AK$6>AL7);'';MAX(NPV(AL33;AL14:AL19)+AL13-AL30;0))"
        self.v?.AL23.formula = "IF(AL13='';'';SUM(AL13:AL22))"
        
        
        self.v?.AL29.formula = "IF(AL$8='';'';SUM(AL26:AL28))"
        self.v?.AL30.formula = "IF(AL13='';'';AL26+AL27*(1+AK27)^(AL7-AK$6)+AL28*(1+AK28)^(AL7-AK$6))"
        self.v?.AK32.formula = "IF(OR(AL11='';AL$6='';AL7='');'';MAX(AL7-AK$6;0))"
        self.v?.AL34.formula = "IF(OR(AL11='';AL32=0;AL32='');'';AL11/(1+AL33)^MAX(AL7-AK6;0)/((1-1/AN40^MIN(AL32;MAX(AL7-AK6;0)))/AN41*AN40))"
        self.v?.AK35.formula = "IF(AL35='';AK6+0;IF(OR(AL11='';AK$6='';AL7='';AL35<AK$6);'';AL7-AL35))"
        self.v?.AL36.formula = "IF(OR(AL11='';AL32=0;AL33='';AL35='');'';IF(AL35=AL7;AL11;AL11/((1-1/AN40^MIN(AL32;MAX(AL7-AL35;0)))/AN41*AN40)/(1+AL33)^MAX(AL7-AL35;0)))"
        self.v?.AL39.formula = "IF(OR(AL32='';AL11='');'';AL29+SUM(AL40:AL59)*AL34)"
        
        
        self.v?.AJ5.formula = "IF(AL4='';'';'School Level:')"
        self.v?.AJ6.formula = "IF(AL5='';'';'Birthday:')"
        self.v?.AJ7.formula = "IF(AL6='';'';'Age @'&AV5&':')"
        self.v?.AJ8.formula = "IF(AL7='';'';'Annual Tuition Fee:')"
        self.v?.AJ9.formula = "IF(AL8='';'';'Annual Increase:')"
        self.v?.AJ10.formula = "IF(AL9='';'';'Years in '&AL5&':')"
        self.v?.AJ11.formula = "IF(AL10='';'';'Fund Required @'&AL7&':')"
    }
    
    
    override func setUpHiddenFields() {
        for index in 13...22 {
            let txtField = NYTextField()
            txtField.id = "AR\(index)"
            txtField.formula = "\(index-12)"
            txtField.text = "\(index-12)"
            txtField.value = "\(index-12)"
            NYParser.shared.willAppendToFields(txtField)
        }
        
        //BOTTOM FIELDS
        var nString = "N"
        var pString = "P"
        
        for index in 0...2 {
            if index == 1 {
                nString = "Z"
                pString = "AB"
            } else if index == 2 {
                nString = "AL"
                pString = "AN"
            }
            
            let N40 = NYTextField()
            N40.id = "\(nString)40"
            N40.formula = "1"
            N40.text = "1"
            N40.value = "1"
            NYParser.shared.willAppendToFields(N40)
            
            //FIRST
            let P40 = NYTextField()
            P40.id = "\(pString)40"
            P40.formula = "(1+\(nString)33)/(1+\(nString)37)+IF(\(nString)33=\(nString)37;0.000000000001;0)"
            P40.text = "1"
            P40.value = "1"
            NYParser.shared.willAppendToFields(P40)
            
            let P41 = NYTextField()
            P41.id = "\(pString)41"
            P41.formula = "\(pString)40-1"
            P41.text = "0"
            P41.value = "0"
            NYParser.shared.willAppendToFields(P41)
            
            let P43 = NYTextField()
            P43.id = "\(pString)43"
            P43.formula = "(1+\(nString)33)/(1+N9)+IF(\(nString)33=\(nString)9;0.000000000001;0)"
            P43.text = "1.1"
            P43.value = "1.1"
            NYParser.shared.willAppendToFields(P43)
            
            let P44 = NYTextField()
            P44.id = "\(pString)44"
            P44.formula = "\(pString)43-1"
            P44.text = "0.1"
            P44.value = "0.1"
            NYParser.shared.willAppendToFields(P44)
            
            for index in 41...59 {
                let txtField = NYTextField()
                txtField.id = "\(nString)\(index)"
                txtField.formula = "IF(\(nString)32<(COUNTIF(\(nString)40:\(nString)\(index-1);'>0')+1);0;(1+\(nString)37)^(COUNTIF(\(nString)40:\(nString)\(index-1);'>0')))"
                txtField.text = "1"
                txtField.value = "1"
                NYParser.shared.willAppendToFields(txtField)
            }
        }
        
        
        //RIGHT FIELDS
        let AT5 = NYTextField()
        AT5.id = "AT5"
        AT5.formula = "IF(N5='Elementary';'Grade 1';IF(N5='High School';'1st Yr. H.S.';IF(N5='College';'1st Yr. Col.';IF(N5='Masteral';'1st Yr. Mast.';'1st Yr. Doc.'))))"
        AT5.text = "1st"
        AT5.value = "1st"
        AT5.inputType = .text
        NYParser.shared.willAppendToFields(AT5)
        
        let AU5 = NYTextField()
        AU5.id = "AU5"
        AU5.formula = "IF(Z5='Elementary';'Grade 1';IF(Z5='High School';'1st Yr. H.S.';IF(Z5='College';'1st Yr. Col.';IF(Z5='Masteral';'1st Yr. Mast.';'1st Yr. Doc.'))))"
        AU5.text = "1st"
        AU5.value = "1st"
        AU5.inputType = .text
        NYParser.shared.willAppendToFields(AU5)
        
        let AV5 = NYTextField()
        AV5.id = "AV5"
        AV5.formula = "IF(AL5='Elementary';'Grade 1';IF(AL5='High School';'1st Yr. H.S.';IF(AL5='College';'1st Yr. Col.';IF(AL5='Masteral';'1st Yr. Mast.';'1st Yr. Doc.'))))"
        AV5.text = "1st"
        AV5.value = "1st"
        AV5.inputType = .text
        NYParser.shared.willAppendToFields(AV5)
        
        
        for index in 1...10 {
            let txtField = NYTextField()
            txtField.id = "AR\(12+index)"
            txtField.formula = "\(index)"
            txtField.text = "\(index)"
            txtField.value = "\(index)"
            NYParser.shared.willAppendToFields(txtField)
        }
        
        
        for index in 1...10 {
            for col in 0...2 {
                let txtField = NYTextField()
                var formulaColRef = ""
                
                switch col {
                    case 0:
                        txtField.id = "AT\(12+index)"
                        formulaColRef = "N5"
                    case 1:
                        txtField.id = "AU\(12+index)"
                        formulaColRef = "Z5"
                    case 2:
                        txtField.id = "AV\(12+index)"
                        formulaColRef = "AL5"
                    default:
                        break
                }
                
                switch index {
                    case 1:
                        txtField.formula = "'1st Yr '&\(formulaColRef)&':'"
                        txtField.inputType = .text
                        txtField.text = "1st Yr :"
                        txtField.value = "1st Yr :"
                    case 2:
                        txtField.formula = "'2nd Yr '&\(formulaColRef)&':'"
                        txtField.inputType = .text
                        txtField.text = "2nd Yr :"
                        txtField.value = "2nd Yr :"
                    case 3:
                        txtField.formula = "'3rd Yr '&\(formulaColRef)&':'"
                        txtField.inputType = .text
                        txtField.text = "3rd Yr :"
                        txtField.value = "3rd Yr :"
                    case 4...10:
                        txtField.formula = "'\(index)th Yr '&\(formulaColRef)&':"
                        txtField.inputType = .text
                        txtField.text = "\(index)th Yr :"
                        txtField.value = "\(index)th Yr :"
                    default:
                        break
                }

                NYParser.shared.willAppendToFields(txtField)
            }
        }
        
    }
    
    
    override func addLookUpFields() {
        let AR14 = NYTextField()
        AR14.id = "AR14"
        AR14.formula = ""
        AR14.text = ""
        AR14.value = ""
        NYParser.shared.willAppendToFields(AR14)
    }
    
    
    override func setUpPresenterDetails() {
        
        if let user = NYUserSession.current.user {
            
            if !NYUserSession.current.hasPendingOpenOfRecord.0 {
                v?.presenterNameLbl.text = user.fullName
                v?.roleLbl.text = user.userTitle
                v?.emailAddressLbl.text = user.emailAddress
                v?.contactNumberLbl.text  = user.contactNo
                v?.datePresentedLbl.text = NYUtility.getStringFromDate(Date())
            }
            
            
            v?.presenterNameLbl.id = "USER_NAME"
            v?.roleLbl.id = "USER_ROLE"
            v?.contactNumberLbl.id = "USER_CONTACT_NUMBER"
            v?.emailAddressLbl.id = "USER_EMAIL"
            v?.datePresentedLbl.id = "USER_DATE_PRESENTED"
            v?.presenterNameLbl.formula = ""
            v?.roleLbl.formula = ""
            v?.contactNumberLbl.formula = ""
            v?.emailAddressLbl.formula = ""
            v?.datePresentedLbl.formula = ""

        }
    }


}
