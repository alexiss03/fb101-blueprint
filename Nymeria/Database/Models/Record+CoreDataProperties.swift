//
//  Record+CoreDataProperties.swift
//  
//
//  Created by UserHanet on 9/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Record {

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var timestamp: Date?
    @NSManaged var form: Form?
    @NSManaged var user: User?

}
