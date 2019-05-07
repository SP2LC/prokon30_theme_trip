//
//  ViewController.swift
//  MapSample
//
//  Created by maruo on 2019/04/28.
//  Copyright © 2019 maruo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let coordinate = CLLocationCoordinate2DMake(35.60490036, 139.35769708)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated:true)
        
        //ピン
        let annotation = TestMKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "現在地"
//        annotation.subtitle = "annotation"
        annotation.pinImage = "RedPoint.png"
        mapView.addAnnotation(annotation)
        
        let annotation1 = TestMKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2DMake(35.60577739, 139.35845453)
        annotation1.title = "サレジオ高専"
        annotation1.subtitle = "お気に入り登録"
        annotation1.pinImage = "salesio2.png"
        mapView.addAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2DMake(35.60717306, 139.35628094)
        annotation2.title = "サレジオトンネル"
        annotation2.subtitle = "”サレジオ高専”に行った人が訪問"
//        annotation2.pinColor = UIColor.black
        mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2DMake(35.60357917, 139.35676809)
        annotation3.title = "サレジオ公園"
        annotation3.subtitle = "運動好きの人が訪問"
//        annotation3.pinColor = UIColor.black
        mapView.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2DMake(35.60466084, 139.35945667)
        annotation4.title = "サレジオラーメン"
        annotation4.subtitle = "同年代の人がオススメ"
//        annotation4.pinColor = UIColor.black
        mapView.addAnnotation(annotation4)
        
        mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let test = annotation as? TestMKPointAnnotation {
            if(test.pinColor != nil) {
                
                //色が設定されている場合
                let testPinView = MKPinAnnotationView()
                testPinView.annotation = annotation
                testPinView.pinTintColor = test.pinColor
                testPinView.canShowCallout = true
                
                return testPinView
                
            } else if(test.pinImage != nil) {
                
                //画像が設定されている場合
                let testPinView = MKAnnotationView()
                testPinView.annotation = annotation
                testPinView.image = UIImage(named:test.pinImage)
                testPinView.canShowCallout = true
                
                return testPinView
            }
        }
        
        //色も画像も設定されていない場合
        let testPinView = MKPinAnnotationView()
        testPinView.canShowCallout = true
        testPinView.annotation = annotation
        
        return testPinView
    }
    
}

