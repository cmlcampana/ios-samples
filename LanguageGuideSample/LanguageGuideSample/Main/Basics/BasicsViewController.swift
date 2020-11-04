//
//  BasicsViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 16/10/20.
//

import UIKit
import SnapKit
import Foundation

final class BasicsViewController: UIViewController {
    
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
        items.append(Item(title: R.string.localizable.basicsTypeAliasesTitle(),
                          description: R.string.localizable.basicsTypeAliasesDescription(),
                          type: .typealiases))
        items.append(Item(title: R.string.localizable.basicsTuplesTitle(),
                          description: R.string.localizable.basicsTuplesDescription(),
                          type: .tuples))
    }
}

extension BasicsViewController: ViewCodeConfiguration {
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

extension BasicsViewController: UITableViewDataSource {
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

extension BasicsViewController: CustomCellDelegate {
    func showAlert(title: String, itemType: ItemType) {
        switch itemType {
        case .typealiases:
            openModal(vc: TypeAliasesSampleViewController())
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
