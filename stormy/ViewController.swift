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
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var currentWeatherSummary: UILabel?
    
    private let forecastAPIKey = "12277cb417f92c92601ad59f82772dae"
    let coordinate: (lat: Double, long: Double) = (51.5173716 , -0.0734206)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveWeatherForecast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func retrieveWeatherForecast(){
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let currently) in
            
            if let currentWeather = currently {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    if let temperature = currentWeather.temperature {
                        self.currentTempLabel?.text = "\(temperature)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let precipitation = currentWeather.precipProbability {
                        self.currentPrecipLabel?.text = "\(precipitation)%"
                    }
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    
                    if let summary = currentWeather.summary {
                        self.currentWeatherSummary?.text = summary
                    }
                    
                }
                
            }
        }

    }

    @IBAction func refreshWeather() {
        retrieveWeatherForecast()
    }

}

