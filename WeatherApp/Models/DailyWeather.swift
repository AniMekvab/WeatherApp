//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Mac User on 9/3/21.
//

import Foundation
struct DailyWeather {
    let icon: String
    let description: String
    let temperature: Double
    let date: Date
}

extension DailyWeather {
    init(response: WeeklyForecastResponse.Item) {
        let weather = response.weather.first!
        self.icon = weather.icon
        self.description = weather.weatherDescription
        self.temperature = response.main.temp
        self.date = response.date
    }
}
