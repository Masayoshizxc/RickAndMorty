//
//  SettingsViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var coordinator: SettingsCoordinator?
    var ui = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    
}

extension SettingsViewController {
    
}

