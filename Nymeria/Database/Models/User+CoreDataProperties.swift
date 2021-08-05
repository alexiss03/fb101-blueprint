//
//  User+CoreDataProperties.swift
//  
//
//  Created by UserHanet on 9/7/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var firstName: String?
    @NSManaged var id: String?
    @NSManaged var lastName: String?

}
