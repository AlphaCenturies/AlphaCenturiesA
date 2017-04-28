//
//  AphaCenturiesA.swift
//  AlphaCenturiesA
//
//  Created by Erick Su on 4/28/17.
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
        
        //mannualy move the selection into index
        segmentedControl.move(to: 0)
        
        // set transparence back ground
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        view.insertSubview(segmentedControl, at: 1)
        // TwicketSegmentedControl End
        
        // Put constraint of segmenttedControl
        
       
        
        /******************twicket end********************/
        
        
        
        // set Constraints
        
        let margin = view.layoutMarginsGuide
        
        // set Map auto constraints as false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        // set the togglebar auto constraints as false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        
        
        let segLeftC = NSLayoutConstraint(item: segmentedControl, attribute: .leading, relatedBy: .equal, toItem: margin, attribute: .leading, multiplier: 1, constant: 0)
        let segRightC = NSLayoutConstraint(item: segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: margin, attribute: .trailing, multiplier: 1, constant: 0)
        let segBotC = NSLayoutConstraint(item: segmentedControl, attribute: .bottom, relatedBy: .equal, toItem: margin, attribute: .bottom, multiplier: 1, constant: -50)
        let segHeightC = NSLayoutConstraint(item: segmentedControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        
        // Activate constraints
        
        NSLayoutConstraint.activate([segLeftC,segRightC,segBotC,segHeightC])
        
        // Constraint map to the superview
        mapView.bindFrameToSuperviewBounds()
        
    }
    
    // End of viewdidload

    
    
    // detect rotation of the screen
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            
        } else {
            
            print("Portrait")

        }
    }
    
    
    
    
}

// offer automatically constrait
extension UIView {
    
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
}


// do something while click on button of toggle
extension AlphaCenturiesA: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        print("Selected index: \(segmentIndex)")
        if(segmentIndex==1){
            performSegue(withIdentifier: "SegueToSchedule", sender: self)
        }
    }
}
