//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class EpisodesCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = EpisodesViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.third.tabbarItem
        navigationController.pushViewController(vc, animated: true)
    }
    
}
