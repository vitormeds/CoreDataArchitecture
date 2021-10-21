//
//  ProductGateway.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import CoreData

struct ProductGateway {
    
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func save(obj: ProductModel) {
        let entityName = String(describing: Product.self)
        var objCoreData: Product?
        objCoreData = NSEntityDescription.insertNewObject(
            forEntityName: entityName,
            into: managedObjectContext
        ) as? Product
        objCoreData?.name = obj.name
        objCoreData?.quantity = obj.quantity
        objCoreData?.note = obj.note
        do {
            try managedObjectContext.save()
        } catch {
            return
        }
    }

    func getProducts() -> [ProductModel] {
        do {
            let fetch: NSFetchRequest<Product> = Product.fetchRequest()
            let obj = try managedObjectContext.fetch(fetch)
            return obj.map(generateEntity)
        } catch {
            return []
        }
    }

    private func generateEntity(obj: Product) -> ProductModel {
        return ProductModel(name: obj.name ?? "", quantity: obj.quantity ?? "", note: obj.note ?? "")
    }
}
