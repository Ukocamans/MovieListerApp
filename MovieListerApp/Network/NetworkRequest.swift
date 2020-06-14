//
//  NetworkRequest.swift
//  CampaingPage
//
//  Created by Umurcan Kocaman on 18.12.2019.
//  Copyright © 2019 ukocaman. All rights reserved.
//

import Foundation
import Alamofire

protocol Request: class {
    
    var endpoint: String{get}
    var paramHeaders: [String]{get}
    var showLoading: Bool{get}
    var httpMethod: HTTPMethod {get}
    var host: String{get}
}

class NetworkRequest<M: Codable, RM: Codable>: Request{
    
    var endpoint: String = ""
    var paramHeaders: [String] = []
    var showLoading: Bool = true
    var httpMethod: HTTPMethod = .post
    var host: String = "https://api.coronatracker.com/"
    
    func send(reqModel: RM, completion: @escaping (M?, Error?) -> Void) {
        guard checkInternet() else { return }
        
        //let link = createPath()
        let link = host + endpoint
        let parameters = reqModel.dictionary
        let encoding:ParameterEncoding = httpMethod == .get ? URLEncoding.default : JSONEncoding.default
        
        let request = Alamofire.request(link, method: httpMethod, parameters: parameters, encoding: encoding, headers: nil)
        request.responseJSON { response in
            print("Request: \(String(describing: response.request))") //original url request
            if response.error == nil {
                do {
                    let model = try JSONDecoder().decode(M.self, from: response.data!)
                    completion(model, nil)
                } catch {
                    completion(nil, error)
                }
            }else {
                completion(nil, response.error)
            }
            
        }
    }
    
    func checkInternet() -> Bool {
        if Connectivity.isConnectedToInternet {
            return true
        } else {
            return false
        }
    }
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
