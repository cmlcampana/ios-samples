//
//  MainViewController.swift
//  FoundationSample
//
//  Created by Camila Campana on 12/10/20.
//

import UIKit
import SnapKit
import Foundation

final class MainViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Foundation"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Foundation Sample"
        buildLayout()
    }
}

extension MainViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
