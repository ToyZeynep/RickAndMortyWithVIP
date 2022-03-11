//
//  Characters.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation

struct CharacterListResponse : Codable {
    let info : Info?
    let charactersDetails : [CharacterDetails]?
    
    enum CodingKeys: String, CodingKey {
        
        case info = "info"
        case charactersDetails = "results"
    }
}

struct Info : Codable {
    let count : Int?
    let pages : Int?
    let next : String?
    let prev : String?
    
    enum CodingKeys: String, CodingKey {
        
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
}

class Origin :   Codable {
    var name : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case url = "url"
    }
}

class Location :  Codable {
    var name : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case url = "url"
    }
}

class CharacterDetails :  Codable {
    var id = 0
    var name : String?
    var status : String?
    var species : String?
    var type : String?
    var gender : String?
    var origin : Origin?
    var location : Location?
    var image : String?
    var episode : [String]?
    var url : String?
    var created : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case origin = "origin"
        case location = "location"
        case image = "image"
        case episode = "episode"
        case url = "url"
        case created = "created"
    }
    
}

