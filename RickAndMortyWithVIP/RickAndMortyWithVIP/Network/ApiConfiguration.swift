//
//  ApiConfiguration.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 11.03.2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
