//
//  ViewController.swift
//  Finding User Location
//
//  Created by Thyme Nawaphanarat on 18/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var altitudeLabel: UILabel!
    
    @IBOutlet weak var nearestAddressLabel: UILabel!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Allow the viewcontroller to control locationManager
        manager.delegate = self
        
        // Consume less battery
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    @objc func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // first is safer that [0] since it will return an option
        let userLocation = locations[0]
        
        self.latitudeLabel.text = String(userLocation.coordinate.latitude)
        self.longitudeLabel.text = String(userLocation.coordinate.longitude)
        
        self.courseLabel.text = String(userLocation.course)
        self.speedLabel.text = String(userLocation.speed)
        
        self.altitudeLabel.text = String(userLocation.altitude)
        
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        CLGeocoder().reverseGeocodeLocation(userLocation) { (placeMarks, error) in
            if error != nil {
                print(error!)
            } else {
                
                var address = ""
                
                if let placeMark = placeMarks?[0] {
                    var subThroughFare = ""
                    if placeMark.subThoroughfare != nil {
                        subThroughFare = placeMark.subThoroughfare!
                        address += subThroughFare + " "
                    }

                    var throughFare = ""
                    if placeMark.thoroughfare != nil {
                        throughFare = placeMark.thoroughfare!
                        address += throughFare + "\n"
                    }

                    var subLocality = ""
                    if placeMark.subLocality != nil {
                        subLocality = placeMark.subLocality!
                        address += subLocality + "\n"
                    }

                    var subAdministrativeArea = ""
                    if placeMark.subAdministrativeArea != nil {
                        subAdministrativeArea = placeMark.subAdministrativeArea!
                        address += subAdministrativeArea + "\n"
                    }

                    var postalCode = ""
                    if placeMark.postalCode != nil {
                        postalCode = placeMark.postalCode!
                        address += postalCode + "\n"
                    }

                    var country = ""
                    if placeMark.country != nil {
                        country = placeMark.country!
                        address += country + "\n"
                    }
                    
                    self.nearestAddressLabel.text = address

//                    print(subThroughFare + throughFare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)

                }
            }
        }
    }
    
    // Reduced overuse code
//    @objc func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // first is safer that [0] since it will return an option
//        if let userLocation = locations.first {
//            CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, maybeError) in
//                // remove warnings, get the error from the option
//                if let error = maybeError {
//                    print(error)
//                } else if let placemark = placemarks?.first {
//                    // this is ugly but demonstrates using `??` to unwrap options
//                    print("""
//                        \(placemark.subThoroughfare?.appending(" ") ?? "")\(placemark.thoroughfare ?? "")
//                        \(placemark.subLocality?.appending(" ") ?? "")\(placemark.locality ?? "")
//                        \(placemark.subAdministrativeArea?.appending(" ") ?? "")\(placemark.postalCode ?? "")
//                        \(placemark.country ?? "")
//
//                        """)
//                }
//            }
//        }
//    }


}

