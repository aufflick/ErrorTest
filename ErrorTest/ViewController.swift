//
//  ViewController.swift
//  ErrorTest
//
//  Created by Mark Aufflick on 25/4/17.
//  Copyright © 2017 The High Technology Bureau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let e = ErrorTest()
            try e.doWithError()
        } catch (let error) {
            print("caught: \(error)")
        }
        
    }
}

