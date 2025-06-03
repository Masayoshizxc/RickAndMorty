//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class LocationsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LocationsViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.second.tabbarItem
        navigationController.pushViewController(vc, animated: true)
    }
    
}
