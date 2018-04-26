//
//  NetworkManager.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit
import Foundation

class NetworkManager: NSObject {
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    class func jsonRequest(urlString: String, method: HTTPMethod, completion: @escaping ((_ json: JsonParser?, _ error: Error?) -> Void)) {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.rawValue
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                completion(JsonParser(json: json), error)
            }
        })
        dataTask.resume()
    }
}
