//
//  ViewController.swift
//  CoreDataArchitecture
//
//  Created by Vitor Mendes de Souza on 20/10/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupTableView()
        viewModel.getProducts()
    }

    func setupButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func addItem() {
        let viewController = AddProductViewController.newInstance(viewModel: AddProductViewModel(), delegate: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.products[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ListViewController: AddProductDelegate {
    
    func reloadProducts() {
        viewModel.getProducts()
        tableView.reloadData()
    }
}
