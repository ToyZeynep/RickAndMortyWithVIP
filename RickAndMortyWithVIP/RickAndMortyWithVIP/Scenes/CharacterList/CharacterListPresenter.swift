//
//  CharacterListPresenter.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//


import Foundation

protocol CharactersPresentationLogic: AnyObject {
    func presentCharacters(response: Characters.Fetch.Response)
    func presentAlert(error: Error)
}

final class CharactersPresenter: CharactersPresentationLogic {
    
    weak var viewController: CharactersDisplayLogic?
    
    func presentCharacters(response: Characters.Fetch.Response) {
        // 3
        var characters: [Characters.Fetch.ViewModel.Character] = []
        
        response.characters.forEach {
            characters.append(Characters.Fetch.ViewModel.Character(name: $0.name ,
                                                                   status: $0.status,
                                                                   image: $0.image))
        }
        
        viewController?.displayCharacters(viewModel: Characters.Fetch.ViewModel(characters: characters))
    }
    
    func presentAlert(error: Error) {
        
    }
}
