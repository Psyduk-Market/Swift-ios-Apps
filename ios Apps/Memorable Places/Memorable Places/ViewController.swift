//
//  ViewController.swift
//  Memorable Places
//
//  Created by Thyme Nawaphanarat on 18/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        if activeLocation == -1 {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            // Get location details display on the map
            
            if locations.count > activeLocation {
                
                if let name =  locations[activeLocation]["name"] {
                    if let lat = locations[activeLocation]["latitude"] {
                        if let long = locations[activeLocation]["longitude"]{
                            if let latitude = Double(lat){
                                if let longitude = Double(long){
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
                
            }
            
        }
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = gestureRecognizer.location(in: self.map)
            
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            let newLocation = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            print(newCoordinate)
            
            var title = ""
            
            CLGeocoder().reverseGeocodeLocation(newLocation) { (placemarks, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let placemark = placemarks?[0] {
                        if placemark.subThoroughfare != nil {
                            title += placemark.subThoroughfare! + " "
                        }
                        if placemark.thoroughfare != nil {
                            title += placemark.thoroughfare!
                        }
                    }
                }
                if title == "" {
                    title = "Added \(NSDate())"
                }
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
                
                locations.append(["name": title, "latittude": String(newCoordinate.latitude), "longitude": String(newCoordinate.longitude)])
                
                UserDefaults.standard.set(locations, forKey: "locations")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations places: [CLLocation]) {
        let place = CLLocationCoordinate2D(latitude: places[0].coordinate.latitude, longitude: places[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: place, span: span)
        
        self.map.setRegion(region, animated: true)
    }


}

