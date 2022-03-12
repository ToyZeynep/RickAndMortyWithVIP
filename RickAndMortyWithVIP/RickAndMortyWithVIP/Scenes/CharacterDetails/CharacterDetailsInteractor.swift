//
//  CharacterDetailsInteractor.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation

protocol CharacterDetailsBusinessLogic: AnyObject {
    func fetchCharacter()
}

protocol CharacterDetailsDataStore: AnyObject {
    var character: CharacterDetails? { get set }
}

class CharacterDetailsInteractor: CharacterDetailsBusinessLogic, CharacterDetailsDataStore {
    var character: CharacterDetails?
    var presenter: CharacterDetailsPresentationLogic?
    var worker: CharacterDetailsWorkingLogic
    
    init(worker: CharacterDetailsWorkingLogic) {
        self.worker = worker
    }
    
    func fetchCharacter(){
        guard let character = self.character else{
            return
        }
        self.presenter?.presentCharacter(response: Character.Fetch.Response(character: character))
    }
}
