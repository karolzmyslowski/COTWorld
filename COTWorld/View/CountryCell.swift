//
//  CountryCell.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 08.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

  
    @IBOutlet weak var titleLbn: UILabel!
    @IBOutlet weak var subtitleLbn: UILabel!
    
    
    func configureCell(country: Country) {
        titleLbn.text = country.name
        subtitleLbn.text = country.capital
    }
}
