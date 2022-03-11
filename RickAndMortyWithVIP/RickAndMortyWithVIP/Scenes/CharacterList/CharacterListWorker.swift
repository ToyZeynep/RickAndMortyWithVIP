//
//  CharacterListWorker.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//


import Foundation

protocol CharactersWorkingLogic: AnyObject {
    func getCharacters(params: [String: Any], completion: @escaping ((Result<CharacterListResponse, Error>) -> Void))
}

final class CharactersWorker: CharactersWorkingLogic {
    //use case
    func getCharacters(params: [String: Any], completion: @escaping ((Result<CharacterListResponse, Error>) -> Void)) {
        ApiClient.request(ApiEndPoint.characterList(params: params)) {(_ result: Result<CharacterListResponse, Error>) in
            completion(result)
        }
    }
}
