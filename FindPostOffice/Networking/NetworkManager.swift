//
//  NetworkManager.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit

enum httpMethod {
    case get
    case post
}

typealias Response<T> = Promise<T>

protocol NetworkManagerProtocol {
    func request<T: Codable>(httpMethod:httpMethod, url: URL,type: T.Type,httpBody:Data?) -> Response<T>
}


class NetworkManger: NetworkManagerProtocol {
    func request<T>(httpMethod: httpMethod, url: URL, type: T.Type, httpBody: Data?) -> Response<T> where T : Decodable, T : Encodable {
        return Promise { seal in
            var request = URLRequest(url: url)
            request.httpMethod = "\(httpMethod)"
            
            if httpMethod == .post {
                request.httpBody = httpBody
            }
            
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    seal.reject(error)
                } else {
                    do {
                        if let dataRecieved = data {
                            let decoder = JSONDecoder()
                            let decodedObject = try decoder.decode(type, from: dataRecieved)
                            seal.fulfill(decodedObject)
                        }
                    } catch {
                        print(error.localizedDescription)
                        seal.reject(error)
                    }
                }
            }
            task.resume()
        }
    }
    

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}
