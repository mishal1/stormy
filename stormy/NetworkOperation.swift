//
//  NetworkOperation.swift
//  stormy
//
//  Created by Mishal Islam on 03/06/2015.
//  Copyright (c) 2015 Mishal. All rights reserved.
//

import Foundation

class NetworkOperation {
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURl: NSURL
    
    typealias JSONDictionarayCompletion = ([String: AnyObject]?) -> ()
    
    init(url: NSURL){
        self.queryURl = url
    }
    
    func downloadJSONFromUrL(completion: JSONDictionarayCompletion){
        let request: NSURLRequest = NSURLRequest(URL: queryURl)
        let dataTask = session.dataTaskWithRequest(request){
            (let data, response, let error) in
            if let httpResponse = response as? NSHTTPURLResponse {
                switch(httpResponse.statusCode) {
                case 200:
                    let jsonDicitionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                    completion(jsonDicitionary)
                default:
                    println("GET request is not successful. HTTP status code: \(httpResponse.statusCode)")
                }
            } else {
                println("Error: Not a valid HTTP response")
            }
        }
        
        dataTask.resume()
    }
}