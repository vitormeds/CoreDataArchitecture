//
//  AddProductViewController.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import Foundation
import UIKit

protocol AddProductDelegate {
    func reloadProducts()
}

class AddProductViewController: UIViewController {
    
    var viewModel: AddProductViewModel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    var delegate: AddProductDelegate!
    
    override func viewDidLoad() {
        setupButtons()
    }
    
    func setupButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
    }

    @objc func saveItem() {
        viewModel.saveProduct(product: ProductModel(name: nameTextField.text ?? "", quantity: quantityTextField.text ?? "", note: noteTextField.text ?? ""))
        delegate.reloadProducts()
        navigationController?.popViewController(animated: true)
    }
    
    static func newInstance(viewModel: AddProductViewModel, delegate: AddProductDelegate) -> AddProductViewController {
        let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        viewController.viewModel = viewModel
        viewController.delegate = delegate
        return viewController
    }

}
