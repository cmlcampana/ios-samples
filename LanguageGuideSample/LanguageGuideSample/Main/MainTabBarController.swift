//
//  MainTabBarController.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 16/10/20.
//

import UIKit

enum TabItem {
    case basics
    case structures
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .basics:
            let item = UITabBarItem()
            item.title = "Basics"
            return item
        case .structures:
            let item = UITabBarItem()
            item.title = "Structures"
            return item
        }
    }
}

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Language Guide"
        
        let basicsVC = BasicsViewController()
        basicsVC.tabBarItem = TabItem.basics.tabBarItem
        
        let structuresVC = StructuresViewController()
        structuresVC.tabBarItem = TabItem.structures.tabBarItem
        
        viewControllers = [basicsVC, structuresVC]
    }
}
