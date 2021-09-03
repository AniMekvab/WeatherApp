//
//  LocationService.swift
//  WeatherApp
//
//  Created by Mac User on 9/3/21.
//

import PromiseKit
import CoreLocation

protocol LocationServiceDelegate: AnyObject {
    func openWeatherServiceDidReceivedNetworkError(_ viewController: UIViewController)
}

protocol LocationService: AnyObject {
    func getLocation() -> Promise<CLPlacemark>
}

class LocationServiceImpl: LocationService {
    let geocoder: CLGeocoder
    weak var delegate: LocationServiceDelegate?
    
    // MARK: - Object Lifecycle
    init(geocoder: CLGeocoder = .init()) {
        self.geocoder = geocoder
    }
    
     func getLocation() -> Promise<CLPlacemark> {
        return CLLocationManager.requestLocation()
                                .lastValue.then { (location) -> Promise<CLPlacemark> in
                                    return self.geocoder.reverseGeocode(location: location).firstValue
                                }
    }
    
}
