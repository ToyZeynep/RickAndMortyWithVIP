//
//  CharacterListRouter.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation
import UIKit

protocol CharactersRoutingLogic: AnyObject {

    func routeToCharacterDetail(index: Int)
}

protocol CharactersDataPassing: AnyObject {
    var dataStore: CharactersDataStore? { get }
}

final class CharactersRouter: CharactersRoutingLogic, CharactersDataPassing {

    weak var viewController: CharacterListViewController?
    var dataStore: CharactersDataStore?

    func routeToCharacterDetail(index: Int) {
        let storyBoard = UIStoryboard(name: "CharacterDetails", bundle: nil)
        let destVC: CharacterDetailsViewController = storyBoard.instantiateViewController(identifier: "CharacterDetails")
        destVC.router?.dataStore?.character = (dataStore?.characters![index])
        destVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
