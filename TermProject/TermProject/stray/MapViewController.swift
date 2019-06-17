//
//  MapViewController.swift
//  Hospital
//
//  Created by kpugame on 2019. 4. 22..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var posts: [String] = ["","","","","","", "", "", ""]
    
    var addr : String?
    
    var coords: CLLocationCoordinate2D?
    let regionRadius: CLLocationDistance = 5000
    
    var cd : CLLocation?

    func initData() {
        addr = posts[7]
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addr!, completionHandler: {(placemarks: [CLPlacemark]!, error: Error!) in
            if error != nil {
                print("Geocode failed with error: \(error.localizedDescription)")
            } else if placemarks.count > 0 {
                // 주소를 1개만 사용한다고 가정
                let placemark = placemarks[0]
                let location = placemark.location
                self.coords = location?.coordinate
                // 성공적으로 변환이 되었을 때 아래 사용자 정의 메서드를 실행한다.
                self.showMap()
            }
        })
    }
    
    func showMap() {
        // Dictionary 객체 형식으로 지리적 좌표로 초기화 되어야한다.
        // CNPostalAddressStreetKey 외에도 여러가지 키가 있지만 딱히 상관은 없다.
        // import Contacts를 해야한다.
        let coordinateRegion = MKCoordinateRegion(center: coords!, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coords!
        mapView.addAnnotation(annotation)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
//        let initialLocation = CLLocation(latitude: 37.5384514, longitude: 127.0709764)
        mapView.delegate = self
//        loadInitialData()
    }
}
