//
//  CharacterDetailsPresenter.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation
protocol CharacterDetailsPresentationLogic: AnyObject {
    func presentCharacter(response: Character.Fetch.Response)
    func presentAlert(error: Error)
}

final class CharacterDetailsPresenter: CharacterDetailsPresentationLogic {
    weak var viewController: CharacterDetailsDisplayLogic?
    
    func presentCharacter(response: Character.Fetch.Response) {
       
        viewController?.displayCharacter(viewModel: Character.Fetch.ViewModel(name: response.character.name, status: response.character.status, image: response.character.image , gender: response.character.gender, species: response.character.species))
        
    }
  
    func presentAlert(error: Error) {
        
    }
}
