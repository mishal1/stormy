//
//  CurrentWeather.swift
//  stormy
//
//  Created by Mishal Islam on 03/06/2015.
//  Copyright (c) 2015 Mishal. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]){
        temperature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        let precipProbabilityFloat = weatherDictionary["precipProbability"] as! Int
        precipProbability = Int(precipProbabilityFloat * 100)
        summary = weatherDictionary["summary"] as! String
    }
    
}