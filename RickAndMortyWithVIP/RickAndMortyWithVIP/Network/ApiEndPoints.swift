//
//  ApiEndPoints.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 11.03.2022.
//

import Foundation
import Alamofire

enum ApiEndPoint: APIConfiguration {
    
    case characterList(params: [String: Any])
    
    var characterURL: String {
        return "api/"
    }
    
    var method: HTTPMethod {
        switch self {
        case .characterList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .characterList:
            return characterURL + "character"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .characterList(let params):
            return params
        }
    }
    //https://rickandmortyapi.com/api/character/?page=2
    func asURLRequest() throws -> URLRequest {
        
        let url = try "https://rickandmortyapi.com/".asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        
        // Parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        print(urlRequest)
        return try encoding.encode(urlRequest, with: parameters)
    }
}


