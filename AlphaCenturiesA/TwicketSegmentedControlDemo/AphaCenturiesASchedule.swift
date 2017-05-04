//
//  AphaCenturiesASchedule.swift
//  AlphaCenturiesA
//
//  Created by Erick Su on 4/28/17.
//  Copyright © 2017 AlphaCenturies. All rights reserved.
//

import Foundation
import UIKit
import TwicketSegmentedControl

class AlphaCenturiesASchedule: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /******************Prepare for UI Same As AlphaCenturiesA********************/
        /******************twicket start********************/
        
        // The TwicketSegmentedControl
        let titles = ["First", "Second", "Third"]
        
        // set frame
        let frame = CGRect(x: 5, y: view.frame.height-90, width: view.frame.width - 10, height: 40) // set position
        
        
        
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        // initial the twicketSegment in the frame
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self
        
        //mannualy move the selection into index
        segmentedControl.move(to: 1)
        
        // set transparence back ground
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        view.insertSubview(segmentedControl, at: 1)
        // TwicketSegmentedControl End
        
        // Put constraint of segmenttedControl
        
        
        
        /******************twicket end********************/
        
        
        
        // set Constraints
        
        let margin = view.layoutMarginsGuide
        

        
        // set the togglebar auto constraints as false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let segLeftC = NSLayoutConstraint(item: segmentedControl, attribute: .leading, relatedBy: .equal, toItem: margin, attribute: .leading, multiplier: 1, constant: 0)
        let segRightC = NSLayoutConstraint(item: segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: margin, attribute: .trailing, multiplier: 1, constant: 0)
        let segBotC = NSLayoutConstraint(item: segmentedControl, attribute: .bottom, relatedBy: .equal, toItem: margin, attribute: .bottom, multiplier: 1, constant: -50)
        let segHeightC = NSLayoutConstraint(item: segmentedControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        
        // Activate constraints
        
        NSLayoutConstraint.activate([segLeftC,segRightC,segBotC,segHeightC])
        
        
         /******************Same as AlphaCenturiesA End********************/
        
    }
    
    // End of viewdidload
    
    
    
     /******************UI Same As AlphaCenturiesA********************/
    // detect rotation of the screen
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            
        } else {
            
            print("Portrait")
            
        }
    }
    
    /******************* End********************/
    
    
    
}



/******************Prepare for tansistion********************/
// do something while click on button of toggle
extension AlphaCenturiesASchedule: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        
        print("Selected index: \(segmentIndex)")
        if(segmentIndex==0){
            performSegue(withIdentifier: "showTheMap", sender: self)
        }else if(segmentIndex==2){
            performSegue(withIdentifier: "showThePerfect", sender: self)
        }

    }
    
/*******************tansistion End********************/
}
