
//
//  NYDBManager.swift
//  Nymeria
//
//  Created by UserHanet on 9/7/16.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import CoreData

class NYDBManager {

    static func saveFormData(_ recordName: String, formId: String, formName: String) {

        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let userEntity =  NSEntityDescription.entity(forEntityName: "User",
            in:managedContext)
        
        let user = NSManagedObject(entity: userEntity!,
            insertInto: managedContext) as! User
        
        user.id = NYUserSession.current.user?.userId
        user.firstName = NYUserSession.current.user?.firstName
        user.lastName = NYUserSession.current.user?.lastName
        
        let formEntity =  NSEntityDescription.entity(forEntityName: "Form",
            in:managedContext)
        let form = NSManagedObject(entity: formEntity!,
            insertInto: managedContext) as! Form
        form.id = formId
        form.name = formName
   
        let recordEntity =  NSEntityDescription.entity(forEntityName: "Record",
            in:managedContext)
        let record = NSManagedObject(entity: recordEntity!,
            insertInto: managedContext) as! Record
        
        record.name = recordName
        record.id = "\(String(describing: user.firstName))\(recordName)\(NYUtility.timestamp())"
        record.form = form
        record.user = user
        record.timestamp = Date()

        for parserField in NYParser.shared.fields! {
            if let txtField = parserField.1 as? NYTextField {

                let field = NSEntityDescription.insertNewObject(forEntityName: "Field", into: managedContext) as! Field
                field.id = txtField.id
                field.value = txtField.value
                field.text = txtField.text
                field.record = record
                
                print("save field\(String(describing: txtField.id))")
    
                if txtField.isPreloadedVal {
                    if let val = txtField.preloadedVal {
                        txtField.text = val
                        txtField.value = val
                    }
                } else {
                    txtField.text = ""
                    txtField.value = ""
                }
                
            } else if let lbl = parserField.1 as? NYLabel {
                let fieldEntity =  NSEntityDescription.entity(forEntityName: "Field",
                    in:managedContext)
                let lblField = NSManagedObject(entity: fieldEntity!,
                    insertInto: managedContext) as! Field
                
                print("save bl\(String(describing: lbl.id)) \(String(describing: lbl.text))")
                
                lblField.id = lbl.id
                lblField.value = lbl.value
                lblField.text = lbl.text
                lblField.record = record

                if lbl.isPreloadedVal {
                    if let val = lbl.preloadedVal {
                        lbl.text = val
                        lbl.value = val
                    }
                } else {
                    lbl.text = ""
                    lbl.value = ""
                }

            }
        }
        
        
        (NYUserSession.current.moduleController as? NYBaseSpreadsheetViewController)?.setUpPresenterDetails()
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }

    
    static func updateFormData(_ recordId: String, formId: String, formName: String) {
        
        deleteAllFieldsWithRecordId(recordId)
        
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let record = fetchRecordOfFormId(recordId, formId: formId)

        for parserField in NYParser.shared.fields! {
            
            
            if (parserField.1 as! NYFieldDelegate).id == "X24" {
                
            }
            
            if let txtField = parserField.1 as? NYTextField {
                
                let field = NSEntityDescription.insertNewObject(forEntityName: "Field", into: managedContext) as! Field
                field.id = txtField.id
                field.value = txtField.value
                field.text = txtField.text
                field.record = record
                
                if txtField.isPreloadedVal {
                    if let val = txtField.preloadedVal {
                        txtField.text = val
                        txtField.value = val
                    }
                } else {
                    txtField.text = ""
                    txtField.value = ""
                }
                
            } else if let lbl = parserField.1 as? NYLabel {
                let fieldEntity =  NSEntityDescription.entity(forEntityName: "Field",
                    in:managedContext)
                let lblField = NSManagedObject(entity: fieldEntity!,
                    insertInto: managedContext) as! Field
                
                lblField.id = lbl.id
                lblField.value = lbl.value
                lblField.text = lbl.text
                lblField.record = record
                
                if lbl.isPreloadedVal {
                    if let val = lbl.preloadedVal {
                        lbl.text = val
                        lbl.value = val
                    }
                } else {
                    lbl.text = ""
                    lbl.value = ""
                }
                
            }
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        

    }

    
    static func deleteAllFieldsWithRecordId(_ recordId: String) {
        let records = fetchRecordsOfFormId(recordId)
        
        if records == nil { return }
        
        for record in records! {
            deleteRecord(record)
        }
    }
    
    
    static func fetchRecordsOfFormId(_ formId: String) -> [Record]? {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate.init(format: "form.id = %@", argumentArray: [formId])
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            var records: [Record]? = []
            
            for record in result as! [Record] {
                records!.append(record)
            }
            
            return records
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return nil
    }

    
    static func fetchRecordOfFormId(_ recordId: String, formId: String) -> Record? {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate.init(format: "id = %@ AND form.id = %@", argumentArray: [recordId, formId])
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            for record in result as! [Record] {
                return record
            }
            
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return nil
        
    }

    
    static func fetchAllRecords() -> [Record]? {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            var records: [Record]? = []
            
            for record in result as! [Record] {
                records!.append(record)
            }
            
            return records
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return nil
    }
    
    static func fetchFieldsWithRecordName(_ recordId: String, formId: String) {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Field")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate.init(format: "record.id = %@ AND record.form.id = %@", argumentArray: [recordId, formId])
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
        
            
            for field in result as! [Field] {
                
                let fieldId = field.id
                let fieldValue = field.value
                let fieldText = field.text
                
                 print("saved fields\(String(describing: fieldId))")
                
                for parserField in NYParser.shared.fields! {
                    
                    if (parserField.1 as! NYFieldDelegate).id == "X24" {
                        
                    }

                    if let txtField = parserField.1 as? NYTextField, txtField.id == fieldId {
                        txtField.value = fieldValue
                        txtField.text = fieldText
                        print("open fields with match\(String(describing: txtField.id))")
                    } else if let datePicker = parserField.1 as? NYDatePicker, datePicker.id == fieldId {
                        datePicker.value = fieldValue
                        datePicker.text = fieldText
                    } else if let lbl = parserField.1 as? NYLabel, lbl.id == fieldId {
                        lbl.value = fieldValue
                        lbl.text = fieldText
                    }
                 }
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
    }

    
    static func fetchRecordsWithKeyword(_ keyword: String, formId: String, startDate: Date, endDate: Date) -> [Record]? {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        

    
        var cal = Calendar.init(identifier: Calendar.Identifier.gregorian)
        cal.timeZone = TimeZone.current
        
        var startComp = (cal as NSCalendar?)?.components([.year, .month , .day , .hour , .minute], from: startDate)
        
        startComp!.minute = 0
        startComp!.hour = 0
        
        let nStartDate = cal.date(from: startComp!)
        
        
        var endComp = (cal as NSCalendar?)?.components([.year, .month , .day , .hour , .minute], from: endDate)
        
        endComp!.minute = 59
        endComp!.hour = 23
        
        let nEndDate = cal.date(from: endComp!)
    

        if keyword != "" {
            let predicate = NSPredicate.init(format: "timestamp >= %@ AND timestamp <= %@ AND name CONTAINS[cd] %@", argumentArray: [nStartDate!, nEndDate!, keyword,formId])
            fetchRequest.predicate = predicate
        } else {
            let predicate = NSPredicate.init(format: "timestamp >= %@ AND timestamp <= %@", argumentArray: [nStartDate!, nEndDate!, formId])
            fetchRequest.predicate = predicate
        }
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            var records: [Record]? = []
            
            for record in result as! [Record] {
                records!.append(record)
            }
            
            return records
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return nil
    }
    
    static func fetchRecordsWithKeyword(_ keyword: String, formId: String) -> [Record]? {
        
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate.init(format: "name CONTAINS[cd] %@", argumentArray: [keyword,formId])
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            var records: [Record]? = []
            
            for record in result as! [Record] {
                records!.append(record)
            }
            
            return records
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return nil
    }
    
    
    static func deleteRecord(_ record: Record) {
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        context.delete(record)
        
        deleteAllFieldsWithRecordId(record.id!)
        
        do {
            try context.save()
        } catch _ {
            
        }
        
    }

    
}
