//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class LocationsViewController: UIViewController {
    
    var coordinator: LocationsCoordinator?
    var ui = LocationsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    
}

extension LocationsViewController {
    
}

