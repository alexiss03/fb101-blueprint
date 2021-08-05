//
//  NYBaseViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import CoreData
import RESideMenu
import Google


class NYBaseViewController: GAITrackedViewController, UIScrollViewDelegate,
        NYNavBarDelegate, RESideMenuDelegate {
    
    var scrollView: UIScrollView?
    var loadingContainer : UIView?
    var loadingIndicator : UIActivityIndicatorView?
    var hasNavBar: Bool = true
    var showLoadingUponLoad : Bool = false
    
    var formName = "Base-Module"
    var formId = ""
    weak var txtFieldReferenceFieldRecordName: NYTextField?

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.scrollView?.delegate = self
        self.screenName = NSStringFromClass(self.classForCoder)
        
        self.initKeyboardObservers()
        
        hasNavBar = true
        
        
        if let _ = self.sideMenuViewController {
            self.sideMenuViewController.delegate = self
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    override func viewWillAppear (_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //Google Analytics
        let tracker = GAI.sharedInstance().defaultTracker
        tracker?.set(kGAIScreenName, value: formName)
        
        _ = GAIDictionaryBuilder.createScreenView()
        //tracker?.send(builder?.build() as [AnyHashable: Any])
        
        
        if let _ = scrollView {
            scrollView?.contentInset = UIEdgeInsets.zero
        }
    }

    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        self.initLoadingIndicator()
        
    }
    
    
    // MARK: Nav Bar
    
    func setUpMenuItems(_ navBar: UINavigationBar, title: String="", hasCRUD: Bool = true) {
        
        let navItem = UINavigationItem.init(title: title)
        
        let menuBtn = UIBarButtonItem.init(image: UIImage.init(named: "menu_x24"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(NYBaseViewController.menuBtnPressed))
        
        if hasCRUD {
            let resetFormDataBtn = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(NYBaseViewController.resetFormDataBtnPressed))
            let openFormDataBtn = UIBarButtonItem.init(barButtonSystemItem: .organize, target: self, action: #selector(NYBaseViewController.openFormDataBtnPressed))
            let saveFormDataBtn = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(NYBaseViewController.saveFormDataBtnPressed))
            let exportFormDataBtn = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(NYBaseViewController.exportFormDataBtnPressed))
            navItem.setRightBarButtonItems([resetFormDataBtn, openFormDataBtn, exportFormDataBtn, saveFormDataBtn], animated: true)
        }
        
        navBar.tintColor = UIColor.black
        navItem.setLeftBarButton(menuBtn, animated: true)
        
        navBar.items = [navItem]
    }
    
    
    // MARK: Loading indicator
    
    func initLoadingIndicator(){
        
        if self.loadingIndicator == nil{
            
            self.loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            self.loadingIndicator!.color = UIColor.white
            self.loadingIndicator?.center = self.view.center
            
            self.loadingContainer = UIView(frame: NYConstants.SCREEN_SIZE)
            
            let overlay = UIView(frame: (self.loadingContainer?.frame)!)
            overlay.backgroundColor = UIColor(netHex: 0x555555)
            overlay.alpha = 0.5
            overlay.addSubview(self.loadingIndicator!)
            
            self.loadingContainer?.addSubview(overlay)
            
            if let nController = self.navigationController {
                nController.view.addSubview(self.loadingContainer!)
            } else {
                self.view.addSubview(self.loadingContainer!)
            }
            
            if self.showLoadingUponLoad == true{
                self.showLoadingIndicator()
                return;
            }
        }
        
        self.loadingContainer?.isHidden = true
    }
    
    
    func showLoadingIndicator() {
        
        self.loadingContainer?.isHidden = false
        self.loadingIndicator?.startAnimating()
        self.view.bringSubview(toFront: self.loadingContainer!)
        self.view.bringSubview(toFront: self.loadingIndicator!)
        
    }
    
    
    func hideLoadingIndicator() {
        
        self.loadingContainer?.isHidden = true
        self.loadingIndicator?.stopAnimating()
        
    }
    
    func showAlertView(_ title: String, message: String) {
        
        let _alert: UIAlertView = UIAlertView.init(title: title, message: message, delegate: self, cancelButtonTitle: "OK")
        _alert.show()
        
    }
    
    
    // MARK: Scrolling
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.scrollView?.subviews[0]
    }
    
    
    // MARK: Keyboard methods
    
    func initKeyboardObservers() -> Void{
        NotificationCenter.default.addObserver(self, selector: #selector(NYBaseViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(NYBaseViewController.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(NYBaseViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(NYBaseViewController.keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    
    func keyboardWillShow(_ notification: Notification) {
    
        if let _scrollView = self.scrollView{
            if let userInfo = notification.userInfo {
                let keyboardSize: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
                _scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            }
        }
    }
    
    
    func keyboardDidShow(_ notification: Notification) {
        
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let _scrollView = self.scrollView{
            _scrollView.contentInset = UIEdgeInsets.zero;
        }
    }
    
    func keyboardDidHide(_ notification: Notification) {
        
    }
    
    
    // MARK: NYNavBarDelegate methods
    func menuBtnPressed() {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
    
    
    func openFormDataBtnPressed() {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "NYOpenFormRecordViewController")
            as? NYOpenFormRecordViewController {
            
            vc.records = NYDBManager.fetchAllRecords()
            vc.modalPresentationStyle = .formSheet
            vc.formIdToOpen = formId
        
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    
    func saveFormDataBtnPressed() {

        let alertController: UIAlertController
            
        if let _ = NYUserSession.current.recordId {
            alertController = UIAlertController.init(title: "Update Form Data", message: "Do you want to update this record?", preferredStyle: .alert)
        } else {
            alertController = UIAlertController.init(title: "Save Form Data", message: "Do you want to save this record?", preferredStyle: .alert)
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { (UIAlertAction) in
            
        }
        
        var saveAction: UIAlertAction?
        
        if let refTxtField = txtFieldReferenceFieldRecordName, let recordName = refTxtField.text {
            saveAction = UIAlertAction.init(title: "Save", style: .default, handler: { (UIAlertAction) in
                if recordName.characters.count > 0 {
                    NYParser.opQueue.waitUntilAllOperationsAreFinished()
                    
                    if let _ = NYUserSession.current.recordId {
                         NYDBManager.updateFormData(NYUserSession.current.recordId!, formId: self.formId, formName: self.formName)
                    }
                    else {
                        NYDBManager.saveFormData(recordName, formId: self.formId, formName: self.formName)
                    }
                } else {
                    self.present(NYUtility.popUpWithOKButton("Error", message: "Empty record name detected. Enter a name to proceed saving."), animated: true, completion: nil)
                }
            })
        }
        else {
            saveAction = UIAlertAction.init(title: "Save", style: .default, handler: { (UIAlertAction) in
                if let recordName = alertController.textFields?.first!.text, recordName.characters.count > 0 {
                    NYDBManager.saveFormData(recordName, formId: self.formId, formName: self.formName)
                } else {
                    self.present(NYUtility.popUpWithOKButton("Error", message: "Empty record name detected. Enter a name to proceed saving."), animated: true, completion: nil)
                }
            })
        }
        
        
        if txtFieldReferenceFieldRecordName == nil {
            alertController.addTextField { (textfield) in
                textfield.placeholder = "Record name"
            }
        }
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction!)
        
        self.present(alertController, animated: true, completion: {(Void) in
        
        })
    }
    
    
    func resetFormDataBtnPressed() {
        NYUserSession.current.recordId = nil
        
        for field in NYParser.shared.fields! {
            if field.1.superview != nil {
                if let txtField = field.1 as? NYTextField {
                    if !txtField.isPreloadedVal {
                        txtField.text = ""
                        txtField.value = ""
                    } else {
                        txtField.text = txtField.preloadedVal
                        txtField.value = txtField.preloadedVal
                    }
                } else if let lbl = field.1 as? NYLabel {
                    if !lbl.isPreloadedVal {
                        lbl.text = ""
                        lbl.value = ""
                    } else {
                        lbl.text = lbl.preloadedVal
                        lbl.value = lbl.preloadedVal
                    }
                }
            }
        }
        
        (self as? NYBaseSpreadsheetViewController)?.setUpPresenterDetails()
    }
    
    
    func exportFormDataBtnPressed() {
        if let _ = txtFieldReferenceFieldRecordName {
            NYUtility.sharedManager.generatePDF(viewToSaved: self.scrollView!, name: txtFieldReferenceFieldRecordName!.text!, module: NYUserSession.current.moduleId!)
        }
    }
    
    
    func saveBtnPressed() {
        NYUtility.sharedManager.generatePDF(viewToSaved: self.scrollView!, name: "BoyFlores", module: formName)
    }
    
    
    
    // MARK: Saving Form Data
    func saveFormData(_ recordName: String) {
            //
    }
    
    
    // MARK: Loading Xibs
    func loadXib(_ name:String) -> NYBaseView{
        return Bundle.main.loadNibNamed(name, owner: self, options: nil)!.first as! NYBaseView
    }
    
}


public extension UIView {
    public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil, type: self)
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil, type: T.self)
        return v!
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
}
