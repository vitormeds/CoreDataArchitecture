//
//  ListViewModel.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import Foundation

class ListViewModel {
    
    let productGateway = ProductGateway(managedObjectContext: ManagedObjectContextFactory.make())
    var products = [ProductModel]()
    
    func getProducts() {
        products = productGateway.getProducts()
    }
    
}
