//
//  CurrentWeather.swift
//  stormy
//
//  Created by Mishal Islam on 03/06/2015.
//  Copyright (c) 2015 Mishal. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Int?
    var humidity: Int? = nil
    var precipProbability: Int? = nil
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    
    init(weatherDictionary: [String: AnyObject]){
        temperature = weatherDictionary["temperature"] as? Int
        if let humidityFloat = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
        }
        if let precipProbabilityFloat = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipProbabilityFloat * 100)
        }
        summary = weatherDictionary["summary"] as? String
        if let iconString = weatherDictionary["icon"] as? String,
        let weatherIcon: Icon = Icon(rawValue: iconString) {
            icon = weatherIcon.toImage()
        }
    }
    
}

