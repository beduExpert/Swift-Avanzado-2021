//
//  RestServiceManager.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 14/11/21.
//

import Foundation
import Alamofire

class RestServiceManager{
    let baseURL = "https://gorest.co.in/public/v1/" //"https://my-json-server.typicode.com/oguzman/music_server/"
    let apiKey = "d5ec48ffb10ee60967c2003e84abb7d7638605328e3e2ba9f9810d568fbfab44"
    
    static let shared = RestServiceManager()
    
    func GoToInfo<T: Decodable, U: Encodable>(responseType: T.Type, method: HTTPMethod, endpoint : String, body: U?, completionHandler: @escaping (_ status: Bool, _ data: T?) -> ()){
        
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
               
        do {
            var request = URLRequest(url: URL(string: "\(baseURL)\(endpoint)")!)
            request.httpMethod = method.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        
            AF.request(request)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    print(String(data: response.data ?? Data(), encoding: .utf8) ?? "")

                    switch response.result {
                    case .success(let value):
                        do {
                            let data = try JSONDecoder().decode(T.self, from: value)
                            completionHandler(true, data)
                        } catch {
                            print(error)
                            completionHandler(false, nil)
                        }

                        break
                    case .failure(let error):
                        print(error)
                        completionHandler(false, nil)
                        break
                    }
            }
        } catch {
            print(error)
        }
    }
    
    func GoToInfo<T: Decodable>(responseType: T.Type, method: HTTPMethod, endpoint : String, completionHandler: @escaping (_ status: Bool, _ data: T?) -> ()){
        
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        var request = URLRequest(url: URL(string: "\(self.baseURL)\(endpoint)")!)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        AF.request(request)
            .validate(statusCode: 200..<300)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONDecoder().decode(T.self, from: value)
                        completionHandler(true, data)
                    } catch {
                        print(error)
                        completionHandler(false, nil)
                    }
                    break
                case .failure(let error):
                    print(error)
                    completionHandler(false, nil)
                    break
                }
            }
    }
    
}
