//
//  MainViewController.swift
//  POC_Acessibility
//
//  Created by Camila Campana on 28/10/20.
//

import UIKit
import SnapKit
import Foundation

class MainViewController: UIViewController {
    
    private(set) lazy var tableView = UITableView()
    private var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "POC Acessibilidade"
        createItems()
    }

    override func loadView() {
        super.loadView()
        buildLayout()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
    }
    
    private func createItems() {
        items.append(Item(title: "Título 1", description: "Descrição 1"))
        items.append(Item(title: "Título 2", description: "Descrição 2"))
        items.append(Item(title: "Título 3", description: "Descrição 3"))
        items.append(Item(title: "Título 4", description: "Descrição 4"))
        items.append(Item(title: "Título 5", description: "Descrição 5"))
    }
}

extension MainViewController: ViewCode {
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ItemTableViewCell
        cell.setItem(items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
