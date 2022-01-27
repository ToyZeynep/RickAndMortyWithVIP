//
//  MovieListInteractor.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation

protocol CharactersBusinessLogic: AnyObject {
    func fetchCharacters(request: Characters.Fetch.Request)
}

protocol CharactersDataStore: AnyObject {
    var characters: [CharacterDetails]? { get }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {

    var presenter: CharactersPresentationLogic?
    var worker: CharactersWorkingLogic

    init(worker: CharactersWorkingLogic) {
        self.worker = worker
    }

    var characters: [CharacterDetails]?

    func fetchCharacters(request: Characters.Fetch.Request) {
        // 2
        worker.getCharacters(request: CharacterListResponse.Request(page: request.page)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.characters = response.charactersDetails
                guard let characters = self?.characters else { return }
                self?.presenter?.presentCharacters(response: Characters.Fetch.Response(characters: characters))
            case .failure(let error):
                self?.presenter?.presentAlert(error: error)
            }
        }
    }
}
