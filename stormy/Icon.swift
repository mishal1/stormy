//
//  Icon.swift
//  stormy
//
//  Created by Mishal Islam on 04/06/2015.
//  Copyright (c) 2015 Mishal. All rights reserved.
//

import Foundation
import UIKit

enum Icon: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    
    func toImage()-> UIImage? {
        var imageName: String
        switch self {
            case .ClearDay:
            imageName = "clear-day.png"
            case .ClearNight:
            imageName = "clear-night.png"
            case .Rain:
            imageName = "rain.png"
            case .Snow:
            imageName = "snow.png"
            case .Sleet:
            imageName = "sleet.png"
            case .Wind:
            imageName = "wind.png"
            case .Fog:
            imageName = "fog.png"
            case .Cloudy:
            imageName = "cloudy.png"
            case .PartlyCloudyDay:
            imageName = "cloudy-day.png"
            case .PartlyCloudyNight:
            imageName = "cloudy-night.png"
        }
        return UIImage(named: imageName)
    }
}
