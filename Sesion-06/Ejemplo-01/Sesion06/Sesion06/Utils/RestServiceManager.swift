//
//  RestServiceManager.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 14/11/21.
//

import Foundation
import Alamofire

class RestServiceManager{
    let baseURL = "https://my-json-server.typicode.com/oguzman/music_server/"
    
    static let shared = RestServiceManager()
    
    
    func GoToInfo<T: Decodable>(responseType: T.Type, method: HTTPMethod, endpoint : String, completionHandler: @escaping (_ status: Bool, _ data: T?) -> ()){
        
        Alamofire.Session.default.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        

        var request = URLRequest(url: URL(string: "\(self.baseURL)\(endpoint)")!)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        

        
        AF.request(request) //("\(self.baseURL)\(endpoint)", method: method, parameters: body , encoding: JSONEncoding.default, headers: nil)
        //AF.request("\(self.baseURL)\(endpoint)")
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
