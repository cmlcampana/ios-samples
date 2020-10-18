//
//  ItemTableViewCell.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 18/10/20.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    var delegate: CustomCellDelegate?
    
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
        delegate?.showAlert(title: titleLabel.text ?? "")
    }
}

extension ItemTableViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configureViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tap)
    }
}
