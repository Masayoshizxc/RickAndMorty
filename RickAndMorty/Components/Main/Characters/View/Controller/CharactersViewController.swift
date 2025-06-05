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
    
    private var viewModel: CharactersViewModelProtocol
    
    init(viewModel: CharactersViewModelProtocol = CharactersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
        setupController()
        getAllCharacters()
    }
    
    func setupController() {
        
        ui.characterCollectionView.dataSource = self
        ui.characterCollectionView.delegate = self
        
    }
    
    func getAllCharacters() {
        viewModel.getAllCharacters { result in
            switch result {
            case .success:
                self.ui.characterCollectionView.reloadData()
            case .failure:
                print("Error via getting characters")
            }
        }
    }
    func getSpecialCharacter(id: Int) {
        viewModel.getSpecialCharacter(id: id) { result in
            switch result {
            case .success:
                print("Received special character \(id)")
            case .failure:
                print("Error via getting special character")
            }
        }
    }
    
}

extension CharactersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getReuseCell(CollectionViewCell.self, indexPath: indexPath)
        cell.setupData(model: viewModel.characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width - 50) / 2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 31, left: 0, bottom: -31, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = viewModel.characters[indexPath.row].id ?? 0
        
        viewModel.getSpecialCharacter(id: id) { [weak self] result in
            switch result {
            case .success(let character):
                self?.coordinator?.character(model: character)
            case .failure:
                print("Failed to fetch special character")
            }
        }
    }
    
}

