//
//  ItemTableViewCell.swift
//  POC_Acessibility
//
//  Created by Camila Campana on 28/10/20.
//

import UIKit

struct Item {
    let title: String
    let description: String
}

final class ItemTableViewCell: UITableViewCell {
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
        
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
     }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: Item) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
    
    @objc
    func cellTapped() {
        print(titleLabel.text ?? "")
    }
}

extension ItemTableViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(containerStackView)
    }
    
    func setupConstraints() {
        containerStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    func configureViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tap)
        
//        accessibilityElementsHidden = true
//        containerStackView.isAccessibilityElement = true
        
    }
}
