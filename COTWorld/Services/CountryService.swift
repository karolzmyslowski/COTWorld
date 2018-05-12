//
//  CountryService.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 08.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class CountryService{
   
    private init() {}
    
    static let shared = CountryService()
    
    let urlString = "https://restcountries.eu/rest/v2/all"
    
    func downloadCountry(urlString: String, tableView: UITableView?, closure: @escaping ([Country]?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
           guard let data = data else {
            return closure(nil)
            
            }
            do {
                let country = try JSONDecoder().decode([Country].self, from: data)
                closure(country)
            } catch {
                print("Error \(error)")
            }
            DispatchQueue.main.async {
                tableView?.reloadData()
            }
        }.resume()
    }
}
