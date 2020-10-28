//
//  TypeAliasesSampleViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 23/10/20.
//

import UIKit

final class TypeAliasesSampleViewController: UIViewController {
    
//    private(set) lazy var 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Type Aliases"
        
        let closeBarButtonItem = UIBarButtonItem(
            title: "Close",
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
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        view.backgroundColor = .white
    }
}
