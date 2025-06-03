//
//  TabBarCoordinator.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class TabBarCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {

    var finishDelegate: CoordinatorFinishDelegate?

    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var parentCoordinator: Coordinator?

    var tabbarController: UITabBarController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabbarController = .init()
    }

    func start() {
        print("TabbarCoordinator")
        let vc = TabBarController()
        navigationController.pushViewController(vc, animated: false)
    }

}



