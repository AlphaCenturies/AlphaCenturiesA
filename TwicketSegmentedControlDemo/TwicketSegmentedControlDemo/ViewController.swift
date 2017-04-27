//
//  ViewController.swift
//  TwicketSegmentedControlDemo
//
//  Created by Pol Quintana on 17/09/16.
//  Copyright © 2016 Pol Quintana. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // The TwicketSegmentedControl
        let titles = ["First", "Second", "Third"]
        let frame = CGRect(x: 5, y: view.frame.height / 2 - 20, width: view.frame.width - 10, height: 40)
        // set position

        let segmentedControl = TwicketSegmentedControl(frame: frame)
        // initial the twicketSegment in the frame
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self
        //

        view.addSubview(segmentedControl)
        // TwicketSegmentedControl End
        
    }
}

extension ViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        print("Selected index: \(segmentIndex)")
    }
}
