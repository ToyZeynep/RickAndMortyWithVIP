//
//  Requester.swift
//  RickAndMortyWithVIP
//
//  Created by MacOS on 27.01.2022.
//

import Foundation
import UIKit
import Alamofire

enum NetworkResponse<T> {
    case httpSuccess(T)
    case httpFail(Error)
}

protocol ProviderProtocol {
    func request<T: Decodable>(model: T.Type,
                               //parameters: [String: Int],
                               completion: @escaping (NetworkResponse<T>) -> Void)
}

class Requester: ProviderProtocol {

    private lazy var baseUrl = "https://rickandmortyapi.com/api/character"

    func request<T: Decodable>(model: T.Type,
                              // parameters: [String: Int] = [:],
                               completion: @escaping (NetworkResponse<T>) -> Void) {
     //   var queryParams = parameters
      //  queryParams["page"] = 1
        let urlString = prepareUrl()
    AF.request(urlString, method: .get).responseData { data in
            switch data.result {
            case let .success(responseData):
                do {
                    let model = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.httpSuccess(model))
                } catch let error as NSError {
                    completion(.httpFail(error))
                }
            case .failure(let error):
                completion(.httpFail(error))
            }
        }
    }

    private func prepareUrl() -> String {
       let resultUrl = baseUrl
        return resultUrl
    }
}

// https://newsapi.org/v2/top-headlines?apiKey=93b6e88ee27d4a9e8d5947008eab41db&country=tr
