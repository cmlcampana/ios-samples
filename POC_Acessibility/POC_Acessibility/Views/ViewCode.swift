//
//  ViewCode.swift
//  POC_Acessibility
//
//  Created by Camila Campana on 28/10/20.
//

protocol ViewCode {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCode {

    func configureViews() { }

    func buildLayout() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
