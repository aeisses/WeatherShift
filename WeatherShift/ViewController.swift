//
//  ViewController.swift
//  WeatherShift
//
//  Created by Aaron Eisses on 11/8/17.
//  Copyright © 2017 Salesforce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let manager = RESTManager()
//        manager.weatherDataForLocation(location: "Liverpool")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showGraph(_ sender: Any) {
        performSegue(withIdentifier: "Graph", sender:nil)
    }

    @IBAction func showMap(_ sender: Any) {
        performSegue(withIdentifier: "Map", sender:nil)
    }
}

