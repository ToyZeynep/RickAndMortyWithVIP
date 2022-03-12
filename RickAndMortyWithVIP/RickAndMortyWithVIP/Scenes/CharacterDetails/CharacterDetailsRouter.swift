//
//  CharacterDetailsRouter.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation
import UIKit

protocol CharacterDetailsRoutingLogic: AnyObject {

}

protocol CharacterDetailsDataPassing: AnyObject {
    var dataStore: CharacterDetailsDataStore? { get }
}

final class CharacterDetailsRouter: CharacterDetailsRoutingLogic, CharacterDetailsDataPassing {

    weak var viewController: CharacterDetailsViewController?
    var dataStore: CharacterDetailsDataStore?
}
