//
//  CharacterDetailsModels.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation
enum Character {

    enum Fetch {

        struct Response {
            var character: CharacterDetails
        }

        struct ViewModel {
          
                let name: String?
                let status: String?
                let image: String?
        }
    }
}
