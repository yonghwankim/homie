//
//  MyMapView.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2016. 12. 26..
//  Copyright © 2016년 yonghwankim's macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps

class MyMapView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // googleMaps 사용
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6)
        let gmapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        gmapView.isMyLocationEnabled = true
        self.view = gmapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = gmapView
    }
    
    
    
    
    
    
    
    // MapKit 사용
    @IBOutlet var mapView: MKMapView!
    
    @IBAction func findMe(_ sender: Any) {
        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
    }
    
    
    // unwind segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
