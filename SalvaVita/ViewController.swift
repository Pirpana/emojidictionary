//
//  ViewController.swift
//  SalvaVita
//
//  Created by Maria Salminen-Bavaro on 11.2.2017.
//  Copyright © 2017 Maria Salminen-Bavaro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    //Latitudine
    @IBOutlet weak var posizione: UILabel!
    
    //Longitudine
    @IBOutlet weak var posizione2: UILabel!
    
    /*
    @IBAction func ambulanza(_ sender: Any)
    {
        
        let url = URL(string: "tel:// 118")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func fuoco(_ sender: Any)
    {
        let url = URL(string: "tel:// 115")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func polizia(_ sender: Any)
    {
        let url = URL(string: "tel:// 113")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    */
    
    //Map
    @IBOutlet weak var map: MKMapView!
    
    
    
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        print(location.coordinate)
        print(location.altitude)
        
        self.map.showsUserLocation = true
        
        posizione.text = String(location.coordinate.latitude)
        posizione2.text = String(location.coordinate.longitude)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        
        
        

        
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    
    
    @IBAction func rileva(_ sender: Any)
    {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

