//
//  ViewController.swift
//  Maps
//
//  Created by Thyme Nawaphanarat on 16/04/19.
//  Copyright © 2019 Thyme. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Coordinate on the map eg. (x, y)
        let latitude: CLLocationDegrees = 27.17
        let longitude: CLLocationDegrees = 8.04
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        // The same to
        // let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        // This is because it more clear to see the type of variable
        // Can be used for other below(location and region)
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        annotation.subtitle = "A place to visit"
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)
        
        let uiLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        
        uiLongPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(uiLongPress)
    }
    
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "A place to visit"
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)
    }


}

