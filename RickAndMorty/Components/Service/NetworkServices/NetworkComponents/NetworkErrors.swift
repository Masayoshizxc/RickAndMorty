//
//  NetworkErrors.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    //case methodNotAllowed
    //case gone
    //case unsupportedMediaType
    //case internalServerError
    //case notImplemented
    //case serviceUnavailable
    case success
}


