//
//  StructuresViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 16/10/20.
//

import UIKit
import SnapKit
import Foundation

final class StructuresViewController: UIViewController {

    private(set) lazy var tableView = UITableView()
    
    private var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createItems()
    }
    
    override func loadView() {
        super.loadView()
        buildLayout()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
    }
    

    private func createItems() {
        items.append(Item(title: R.string.localizable.structuresCollectionTypesArrayTitle(),
                          description: R.string.localizable.structuresCollectionTypesArrayDescription(),
                          type: .arrays))
    }
}

extension StructuresViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        tableView.backgroundColor = .white
    }
}

extension StructuresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ItemTableViewCell
        cell.setItem(items[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

extension StructuresViewController: CustomCellDelegate {
    func showAlert(title: String, itemType: ItemType) {
        switch itemType {
        case .arrays:
            openModal(vc: ArraysSampleViewController())
        default:
            break
        }
    }
    
    // MARK: Private method
    private func openModal(vc: UIViewController) {
        let navController = UINavigationController(rootViewController: vc)
       
        self.navigationController?.present(navController, animated: true)
    }
}
