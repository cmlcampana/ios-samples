//
//  ViewCodeConfiguration.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 16/10/20.
//

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {

    func configureViews() { }

    func buildLayout() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
