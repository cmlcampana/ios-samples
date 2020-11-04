//
//  ArraysSampleViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 03/11/20.
//

import UIKit

final class ArraysSampleViewController: UIViewController {
    
    private var array = [Int]()
    private var arrayResultText: String = ""
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = R.string.localizable.arraysItemTitle()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var descritpionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = R.string.localizable.arraysItemSampleType()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var itemTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    private(set) lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.setTitle(R.string.localizable.arraysItemButtonAddItem(), for: .normal)
        button.addTarget(self, action: #selector(addItemArray), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [descritpionLabel, itemTextField, addItemButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private(set) lazy var resultArrayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var clearArrayButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.setTitle(R.string.localizable.arraysItemButtonClearArray(), for: .normal)
        button.addTarget(self, action: #selector(clearArray), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = R.string.localizable.structuresCollectionTypesArrayTitle()
        
        let closeBarButtonItem = UIBarButtonItem(
            title: R.string.localizable.generalClose(),
            style: .done,
            target: self,
            action: #selector(self.dismissModal)
        )

        self.navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    override func loadView() {
        super.loadView()
        buildLayout()
    }
    
    @objc
    private func dismissModal() {
        dismiss(animated: true)
    }
    
    @objc
    private func addItemArray() {
        guard let value = itemTextField.text else { return }
        
        array.append(Int(value) ?? 0)
        itemTextField.text = ""
        
        refreshArrayResult()
        clearArrayButton.isHidden = false
    }
    
    @objc
    private func clearArray() {
        array.removeAll()
        resultArrayLabel.text = ""
        clearArrayButton.isHidden = true
    }
    
    private func refreshArrayResult() {
        arrayResultText = ""
        
        array.forEach {
            arrayResultText = "\(arrayResultText) \($0) "
        }
        
        resultArrayLabel.text = arrayResultText
    }
}

extension ArraysSampleViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(containerStackView)
        view.addSubview(resultArrayLabel)
        view.addSubview(clearArrayButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        containerStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        resultArrayLabel.snp.makeConstraints {
            $0.top.equalTo(containerStackView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        clearArrayButton.snp.makeConstraints {
            $0.top.equalTo(containerStackView.snp.bottom).offset(16)
            $0.leading.equalTo(resultArrayLabel.snp.trailing).offset(-8)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}
