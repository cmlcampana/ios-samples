//
//  TypeAliasesSampleViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 23/10/20.
//

import UIKit

final class TypeAliasesSampleViewController: UIViewController {
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstText, firstImage, secondText, secondImage])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private(set) lazy var firstText: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.typeAliasesItemTitle()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var secondText: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.typeAliasesItemDescription()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var firstImage: UIImageView = {
        let imageView = UIImageView(image: R.image.typeAliases_image1())
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var secondImage: UIImageView = {
        let imageView = UIImageView(image: R.image.typeAliases_image2())
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = R.string.localizable.basicsTypeAliasesTitle()
        
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
}

extension TypeAliasesSampleViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(containerStackView)
    }
    
    func setupConstraints() {
        containerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        firstImage.snp.makeConstraints {
            $0.height.equalTo(120)
        }
        
        secondImage.snp.makeConstraints {
            $0.height.equalTo(120)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}
