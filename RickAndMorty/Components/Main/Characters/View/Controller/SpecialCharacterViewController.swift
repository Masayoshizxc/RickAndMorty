//
//  SpecialCharacterViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 5/6/25.
//

import UIKit
import Kingfisher

class SpecialCharacterViewController: UIViewController {
    private let specialModel: SpecialCharacter
    
    init(model: SpecialCharacter) {
        self.specialModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var coordinator: CharactersCoordinator?
    var ui = SpecialCharacterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
        setupController()
    }
    
    func setupController() {
        ui.mainImage.kf.setImage(with: URL(string: specialModel.image ?? ""))
        ui.statusLabel.text = specialModel.status.orNone
        ui.genderLabel.text = specialModel.gender.orNone
        ui.typeLabel.text = specialModel.type.orNone
        ui.speciesLabel.text = specialModel.species.orNone
    }
    
}

extension SpecialCharacterViewController {
    
}

