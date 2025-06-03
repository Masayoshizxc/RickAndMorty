//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var coordinator: CharactersCoordinator?
    var ui = CharactersView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    
}

extension CharactersViewController {
    
}

