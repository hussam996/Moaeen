//
//  ViewController.swift
//  Where Am I
//
//  Created by Rob Percival on 13/03/2015.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MyLocation: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var manager:CLLocationManager!
    
    var annotation = MKPointAnnotation()
    
    @IBOutlet weak var confermLocation: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        self.map.showsUserLocation = true
        
        
        
    }
    
    //NOTE: [AnyObject] changed to [CLLocation]
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
 
        
        let userLocation:CLLocation = locations[0]

        let latitude:CLLocationDegrees = userLocation.coordinate.latitude

        let longitude:CLLocationDegrees = userLocation.coordinate.longitude

        let latDelta:CLLocationDegrees = 0.01

        let lonDelta:CLLocationDegrees = 0.01

        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)

        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)

        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)

        map.setRegion(region, animated: false)

        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       map.addAnnotation(annotation)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confermLoc(_ sender: Any) {
        
        performSegue(withIdentifier: "toCreatRequest", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCreatRequest" {
            let destinationVC = segue.destination as! Request
            
            
            destinationVC.request.latitude  = "21.40474"
            destinationVC.request.longitude = "39.892742"
        }
        
    }
    
    
}

