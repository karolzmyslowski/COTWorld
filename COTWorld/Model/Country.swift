//
//  Country.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 08.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let callingCodes: [String]
    let capital: String
    let region: String
    let population: Int
    let latlng: [Double]
    let area: Double?
    let timezones: [String]
    let flag: String
    
}
