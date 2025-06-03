//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit
import SnapKit

enum TabBarItems: CaseIterable {
    case first
    case second
    case third
    case fourth

    var tabbarItem: UITabBarItem {
        switch self {
        case .first:
            return .init(
                title: "Characters",
                image: UIImage(systemName: "person"),
                tag: 1
            )

        case .second:
            return .init(
                title: "Locations",
                image: UIImage(systemName: "globe"),
                tag: 1
            )
            
        case .third:
            return .init(
                title: "Episodes",
                image: UIImage(systemName: "tv"),
                tag: 1
            )
        case .fourth:
            return .init(
                title: "Settings",
                image: UIImage(systemName: "gear"),
                tag: 1
            )
        }
    }
}

class TabBarController: UITabBarController {
    weak var coordinator: TabBarCoordinator?

    let charactersCoordinator = CharactersCoordinator(navigationController: UINavigationController())
    let locationsCoordinator = LocationsCoordinator(navigationController: UINavigationController())
    let episodesCoordinator = EpisodesCoordinator(navigationController: UINavigationController())
    let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        configureTabs()
//        UITabBar.appearance().tintColor = R.color.tabBarBlue()
//        UITabBar.appearance().unselectedItemTintColor = R.color.tabBarGray()

        navigationItem.hidesBackButton = true
//        navigationController?.navigationBar.backgroundColor = R.color.tint()
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.tabBar.backgroundColor = .none
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func configureTabs() {
        charactersCoordinator.start()
        locationsCoordinator.start()
        episodesCoordinator.start()
        settingsCoordinator.start()
        viewControllers = [
            charactersCoordinator.navigationController,
            locationsCoordinator.navigationController,
            episodesCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        let tab = UITabBarAppearance()
        tab.backgroundEffect = .none
//        tab.shadowColor = .clear

        tab.stackedItemWidth = 40
        tab.stackedItemSpacing = 100
//        tab.stackedItemPositioning =

        tabBar.standardAppearance = tab
        
//        tabBar.scrollEdgeAppearance = tab

    }

    private func setupConstraints() {
        let positionOnX: CGFloat = 99
        let positionOnY: CGFloat = 22
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let bg = UIView()
//        bg.backgroundColor = R.color.mainBackground()
        bg.layer.cornerRadius = 16
//        bg.layer.opacity = 40
        tabBar.addSubview(bg)
//        let clicked = UIView()
//        clicked.backgroundColor = R.color.backgroundYellow()
//        clicked.layer.cornerRadius = 20
        bg.snp.makeConstraints {make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
//            make.left.right.equalToSuperview().inset(59)
//            make.bottom.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
//        clicked.snp.makeConstraints {make in
//            make.width.equalTo(106)
//            make.height.equalTo(83)
//        }
//        bg.addSubview(clicked)

    }

}





