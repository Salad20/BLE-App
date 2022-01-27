//
//  LocationManager.swift
//  BLE4
//
//  Created by Jianzhi Guo on 2022-01-26.
//

import CoreLocation
class LocationManager: NSObject, ObservableObject{
    private let manager=CLLocationManager()
    @Published var userLocation: CLLocation?
    
    static let shared=LocationManager()
    override init(){
        super.init()
        manager.delegate=self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
            
        case .notDetermined:
            print("Not Determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Always")
        case .authorizedWhenInUse:
            print("In Use")
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location=locations.last else{return}
        self.userLocation=location
    }
}
