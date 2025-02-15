//
//  ViewController.swift
//  API Practice
//
//  Created by Harshit ‎ on 1/13/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherManager = WeatherManager()
        weatherManager.performRequest(with: weatherManager.weatherURL)
//        let wikipediaManager = WikipediaManager()
//        wikipediaManager.performRequest(with: wikipediaManager.wikiURL)
        
    }
}
