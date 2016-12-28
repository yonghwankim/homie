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

class MyMapView: UIViewController {
        
    @IBOutlet var mapView: MKMapView!
    
    @IBAction func findMe(_ sender: Any) {

        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
        
        
        // 시청 위도경도
        /*
        var region = MKCoordinateRegion()
        var span = MKCoordinateSpan()
        
        span.latitudeDelta = 0.00005
        span.longitudeDelta = 0.00005
        
        region.center = CLLocationCoordinate2DMake(37.564123, 126.974702)
        region.span = span
        
        mapView.setRegion(region, animated: true)
        mapView.setCenter(region.center, animated: true)
        mapView.regionThatFits(region)
 */
        
    }
    
    
    // unwind segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_map" {
            if let destination = segue.destination as? ListViewController {
                
            }
        }
    }
}
