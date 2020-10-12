//
//  ViewCodeConfiguration.swift
//  FoundationSample
//
//  Created by Camila Campana on 12/10/20.
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
