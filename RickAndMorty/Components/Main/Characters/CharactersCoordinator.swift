//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class CharactersCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CharactersViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.first.tabbarItem
        navigationController.pushViewController(vc, animated: true)
    }
    
}
