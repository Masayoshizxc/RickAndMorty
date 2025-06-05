//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import Foundation

enum SuccessFailure {
    case success
    case failure
}

protocol CharactersViewModelProtocol {
    func getAllCharacters(completion: @escaping ((SuccessFailure) -> Void))
    func getSpecialCharacter(id: Int, completion: @escaping (Result<SpecialCharacter, Error>) -> Void)
    var characters: [Characters] { get }
}

class CharactersViewModel: CharactersViewModelProtocol {
    
    let networkService = NetworkService.shared
    
    var characters = [Characters]()
    var specialCharacter: SpecialCharacter?
    
    func getAllCharacters(completion: @escaping ((SuccessFailure) -> Void)) {
        networkService.sendRequest(urlRequest: CharacterRouter.getAllCharacters.createURLRequest(), successModel: CharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.characters = model.results
                print(model)
                completion(.success)
            case .badRequest(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .failure(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .unauthorized(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .notFound(let error):
                debugPrint(#function, error)
                completion(.failure)
            }
        }
    }
    
    func getSpecialCharacter(id: Int, completion: @escaping (Result<SpecialCharacter, Error>) -> Void) {
        networkService.sendRequest(urlRequest: CharacterRouter.getSpecialCharacter(id: id).createURLRequest(), successModel: SpecialCharacter.self) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error as! Error))
            default:
                completion(.failure(NSError(domain: "", code: -1)))
            }
        }
    }

    
}
