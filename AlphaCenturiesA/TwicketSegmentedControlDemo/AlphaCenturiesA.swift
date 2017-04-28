//
//  AlphaCenturiesA.swift
//
//  Created by Ruoyu Su on 17/09/16.
//  Copyright © 2017 AlphaCenturies. All rights reserved.
//

import UIKit
import TwicketSegmentedControl
import GoogleMaps

class AlphaCenturiesA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        

        
        
        /******************Map Start****************/
        
        
        // You don't need to modify the default init(nibName:bundle:) method.
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
//       If you want to add a mapView after the loading of the view, then you need to create an object of GMSMapView. So break the outlets of your mapView since it will be created dynamically.
        
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), camera: GMSCameraPosition.camera(withLatitude: 37.5413311, longitude: -122.303767, zoom: 10))
        
        view.insertSubview(mapView, at: 0)
        
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//        
        
        
        /******************Map End****************/

        
        
        
        /******************twicket start********************/
        
        // The TwicketSegmentedControl
        let titles = ["First", "Second", "Third"]
        let frame = CGRect(x: 5, y: view.frame.height-90, width: view.frame.width - 10, height: 40)
        // set frame
        
        // set position
        
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        // initial the twicketSegment in the frame
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self
        
        
        // set transparence back ground
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        view.insertSubview(segmentedControl, at: 1)
        // TwicketSegmentedControl End
        
        // Put constraint of segmenttedControl
        
        let margin = view.layoutMarginsGuide
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let leftC = NSLayoutConstraint(item: segmentedControl, attribute: .leading, relatedBy: .equal, toItem: margin, attribute: .leading, multiplier: 1, constant: -8)
        let rightC = NSLayoutConstraint(item: segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: margin, attribute: .trailing, multiplier: 1, constant: 8)
        let botC = NSLayoutConstraint(item: segmentedControl, attribute: .bottom, relatedBy: .equal, toItem: margin, attribute: .bottom, multiplier: 1, constant: -50)
        let heightC = NSLayoutConstraint(item: segmentedControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        
        // Activate constraints
        
        NSLayoutConstraint.activate([leftC,rightC,botC,heightC])
        
        /******************twicket end********************/
        
        
        
        
    }
    

    
    
    // detect rotation of the screen
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            
        } else {
            
            print("Portrait")

        }
    }
    
    
    
    
}

extension AlphaCenturiesA: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        print("Selected index: \(segmentIndex)")
    }
}
