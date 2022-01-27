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
        let storyBoard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let destVC: CharacterDetailsViewController = storyBoard.instantiateViewController(
            identifier: "NewsDetailViewController"
        )
        // data passing sample
       // destVC.router?.dataStore?.characters = dataStore?.characters?[index]
        self.viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
