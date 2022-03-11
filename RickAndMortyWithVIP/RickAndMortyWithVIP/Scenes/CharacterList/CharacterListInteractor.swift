//
//  MovieListInteractor.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation

protocol CharactersBusinessLogic: AnyObject {
    func fetchCharacters(params: [String: Any])
}

protocol CharactersDataStore: AnyObject {
    var characters: [CharacterDetails]? { get }
}

class CharactersInteractor: CharactersBusinessLogic, CharactersDataStore {
    var characters: [CharacterDetails]?
    var presenter: CharactersPresentationLogic?
    var worker: CharactersWorkingLogic

    init(worker: CharactersWorkingLogic) {
        self.worker = worker
    }

    

    func fetchCharacters(params: [String: Any]) {
        // 2
        worker.getCharacters(params: params) { [weak self] result in
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
