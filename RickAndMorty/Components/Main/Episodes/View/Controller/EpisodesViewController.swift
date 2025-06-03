//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    var coordinator: EpisodesCoordinator?
    var ui = EpisodesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    
}

extension EpisodesViewController {
    
}

