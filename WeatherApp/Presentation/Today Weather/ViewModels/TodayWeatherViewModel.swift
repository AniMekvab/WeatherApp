//
//  TodayWeatherViewModel.swift
//  WeatherApp
//
//  Created by Mac User on 9/3/21.
//

import UIKit
import CoreLocation

public class TodayWeatherViewModel {
    // MARK: - Instance Properties
    private let place: CLPlacemark
    private let weather: CurrentWeather
    
    // MARK: - Object Lifecycle
    init(place: CLPlacemark, weather: CurrentWeather) {
        self.place = place
        self.weather = weather
    }
    
    public var description: String {
        return "The forecast for today in \(location): \(temperature)."
    }
    
    public var weatherIcon: UIImage? {
        return UIImage(named: weather.icon)
    }
    
    
    
    public var location: String {
        
        // Pod PromiseKit/CoreLocation არ ასაფორთებს ქართულ კონკრეტულ ლოკაციებს.
        //[GEOAddressObject] [NSLocale currentLocale] failed for NSLocaleCountryCode@
        //ქვემოთ დაკომენტარებულ კოდს მოაქვს კონკრეტული ლოკაცია თუმცა არა საქართველოში.
        
//        guard let locality = place.locality, let country = place.country else { return "" }
                
        guard let locality = place.administrativeArea, let country = place.isoCountryCode else { return "" }
        return "\(locality), \(country)"
    }
    
    
    
    public var temperature: String {
        return "\(String(format: "%.0f", weather.temperature)) °C | \(weather.title)"
    }
    
    public var humidity: String {
        return "\(String(format: "%.0f", weather.temperature)) %"
    }
    
    public var rain: String {
        guard let rain = weather.rain else { return "---"}
        return "\(String(format: "%.1f", rain)) mm"
    }
    
    public var pressure: String {
        guard let pressure = weather.pressure else { return "---"}
        return "\(String(format: "%.0f", pressure)) hPa"
    }
    
    public var windSpeed: String {
        guard let windSpeed = weather.wind.speed else { return "---"}
        return "\(String(format: "%.1f", windSpeed)) km/h"
    }
    
    public var windDirection: String {
        // https://stackoverflow.com/a/48119496
        guard let windDirection = weather.wind.deg else { return "---"}
        if windDirection <= 0, windDirection >= 360 { return "---"}

        let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
        let index = Int((windDirection + 22.5) / 45.0) & 7
        return directions[index]
    }
}

extension TodayWeatherViewModel {
    public func configure(_ view: TodayView) {
        view.curentLocationImage.isHidden = false
        
        view.weatherIconImage.image = weatherIcon
        view.currentLocationLabel.text = location
        view.temperatureLabel.text = temperature
        view.humidityLabel.text = humidity
        view.precipitationLabel.text = rain
        view.pressureLabel.text = pressure
        view.windSpeedLabel.text = windSpeed
        view.windDirectionLabel.text = windDirection
    }
}
