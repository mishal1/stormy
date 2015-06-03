//
//  ViewController.swift
//  stormy
//
//  Created by Mishal Islam on 03/06/2015.
//  Copyright (c) 2015 Mishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipLabel: UILabel?
    
    private let forecastAPIKey = "12277cb417f92c92601ad59f82772dae"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseUrl = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "51.5173716, -0.0734206", relativeToURL: baseUrl)
        
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"), let weatherDictionary = NSDictionary(contentsOfFile: plistPath), let currentWeatherDicitionary = weatherDictionary["currently"] as? [String: AnyObject]{
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDicitionary)
            currentTempLabel?.text = "\(currentWeather.temperature)º"
            currentHumidityLabel?.text = "\(currentWeather.humidity)%"
            currentPrecipLabel?.text = "\(currentWeather.precipProbability)%"
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

