//
//  BasicsViewController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 16/10/20.
//

import UIKit
import SnapKit
import Foundation

final class BasicsViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Basics"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildLayout()
    }
}

extension BasicsViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
