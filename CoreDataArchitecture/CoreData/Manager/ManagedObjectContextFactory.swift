//
//  ManagedObjectContextFactory.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import UIKit
import CoreData

struct ManagedObjectContextFactory {

    static func make() -> NSManagedObjectContext {
        let application = UIApplication.shared.delegate as! AppDelegate
        return application.persistentContainer.viewContext
    }

}
