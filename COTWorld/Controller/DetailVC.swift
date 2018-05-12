//
//  DetailVC.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 11.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import MapKit

class DetailVC: UIViewController {

    @IBOutlet weak var nameLbn: UILabel!
    @IBOutlet weak var capitalLbn: UILabel!
    @IBOutlet weak var regionLbn: UILabel!
    @IBOutlet weak var populationLbn: UILabel!
    @IBOutlet weak var areaLbn: UILabel!
    @IBOutlet weak var timeZoneLbn: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var detailCountry: Country?
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        configureView(country: detailCountry!)
        setMap(country: detailCountry!)
    }
    
    func configureView(country: Country) {
        nameLbn.text = country.name
        if country.capital == ""{
            capitalLbn.text = "-"
        } else {
            capitalLbn.text = country.capital
        }
        regionLbn.text = country.region
        populationLbn.text = String(country.population)
        if let area = country.area {
            areaLbn.text = String(area)
        } else {
            areaLbn.text = "-"
        }
        timeZoneLbn.text = country.timezones[0]
    }
    
    func setMap(country: Country) {
        if country.latlng.count > 0 {
        let lat = country.latlng[0]
        let lng = country.latlng[1]
        let location = CLLocation(latitude: lat, longitude: lng)
        let regionRadius: CLLocationDistance
        if let area = country.area {
            regionRadius = sqrt(area) * 2000
        } else {
            regionRadius = 1000 * 2000
        }
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        }
 
    }
}

