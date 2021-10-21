//
//  AddProductViewModel.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import Foundation

class AddProductViewModel {
    
    let productGateway = ProductGateway(managedObjectContext: ManagedObjectContextFactory.make())
    
    func saveProduct(product: ProductModel) {
        productGateway.save(obj: product)
    }
}
