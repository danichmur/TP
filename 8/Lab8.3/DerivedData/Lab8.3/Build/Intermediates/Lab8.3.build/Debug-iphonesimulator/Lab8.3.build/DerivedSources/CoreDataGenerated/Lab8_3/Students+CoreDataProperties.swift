//
//  Students+CoreDataProperties.swift
//  
//
//  Created by Daniel Muraveyko on 15/05/2017.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var name: String?

}
