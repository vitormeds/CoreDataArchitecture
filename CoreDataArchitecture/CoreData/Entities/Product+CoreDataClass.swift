//
//  Product+CoreDataClass.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: String?
    @NSManaged public var note: String?
}
