//
//  RMTabBarController.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import Foundation
import UIKit

final class RMTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
    }
    
    func setupTabs(){
        let charVC = RMCharacterViewController()
        let epiVC = RMEpisodesViewController()
        let locVC = RMLocationsViewController()
        let settingsVC = RMSettingsViewController()
        
        charVC.navigationItem.largeTitleDisplayMode = .automatic
        epiVC.navigationItem.largeTitleDisplayMode = .automatic
        locVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: charVC)
        let nav2 = UINavigationController(rootViewController: epiVC)
        let nav3 = UINavigationController(rootViewController: locVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 4)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
    
}
