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
        items.append(Item(title: "Type Aliases",
                          description: "Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword."))
        items.append(Item(title: "Tuples",
                          description: "Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other."))
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
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
