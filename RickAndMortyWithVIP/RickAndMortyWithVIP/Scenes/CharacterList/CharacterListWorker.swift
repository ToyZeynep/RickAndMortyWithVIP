//
//  CharacterListWorker.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//


import Foundation

protocol CharactersWorkingLogic: AnyObject {
    func getCharacters(request: CharacterListResponse.Request, completion: @escaping ((Result<CharacterListResponse, Error>) -> Void))
}

final class CharactersWorker: CharactersWorkingLogic {
    
    func getCharacters(request: CharacterListResponse.Request, completion: @escaping ((Result<CharacterListResponse, Error>) -> Void)) {

        Requester().request(model: CharacterListResponse.self) { result in
            switch result {
            case .httpSuccess(let response):
                completion(.success(response))
            case .httpFail(let error):
                completion(.failure(error))
            }
        }
    }
}
