//
//  CharacterRouter.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import Foundation

enum CharacterRouter: BaseRouter {
    
    case getAllCharacters
    case getSpecialCharacter(id: Int)
    
    var path: String {
        switch self {
        case .getAllCharacters:
            return "/api/character/"
        case let .getSpecialCharacter(id):
            return "/api/character/\(id)"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getAllCharacters:
            return .GET
        case .getSpecialCharacter:
            return .GET
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getAllCharacters:
            return nil
        case .getSpecialCharacter:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .getAllCharacters:
            return nil
        case .getSpecialCharacter:
            return nil
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        case .getAllCharacters:
            return nil
        case .getSpecialCharacter:
            return nil
        }
    }
    
    
}
