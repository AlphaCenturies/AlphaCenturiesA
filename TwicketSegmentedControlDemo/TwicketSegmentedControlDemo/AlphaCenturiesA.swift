//
//  AlphaCenturiesA.swift
//
//  Created by Ruoyu Su on 17/09/16.
//  Copyright © 2017 AlphaCenturies. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

class AlphaCenturiesA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        // The TwicketSegmentedControl
        let titles = ["First", "Second", "Third"]
        let frame = CGRect(x: 5, y: view.frame.height-90, width: view.frame.width - 10, height: 40)
        // set frame
        
        // set position

        let segmentedControl = TwicketSegmentedControl(frame: frame)
        // initial the twicketSegment in the frame
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self
        //

        view.addSubview(segmentedControl)
        // TwicketSegmentedControl End
        
        // Put constraint of segmenttedControl
        let margin = view.layoutMarginsGuide
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let leftC = NSLayoutConstraint(item: segmentedControl, attribute: .leading, relatedBy: .equal, toItem: margin, attribute: .leading, multiplier: 1, constant: 8)
        let rightC = NSLayoutConstraint(item: segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: margin, attribute: .trailing, multiplier: 1, constant: 8)
        let botC = NSLayoutConstraint(item: segmentedControl, attribute: .bottom, relatedBy: .equal, toItem: margin, attribute: .bottom, multiplier: 1, constant: -20)
        let heightC = NSLayoutConstraint(item: segmentedControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        // Activate constraints
        NSLayoutConstraint.activate([leftC,rightC,botC,heightC])
        
    }
    

    
    
    // detect rotation
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
