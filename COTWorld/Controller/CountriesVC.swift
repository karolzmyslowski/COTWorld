//
//  CountriesVC.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 08.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    let urlString = CountryService.shared.urlString
    var countries = [Country]()
    var currentCountries = [Country]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        CountryService.shared.downloadCountry(urlString: urlString,tableView: tableView) { (country) in
            self.countries = country!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            if let destination = segue.destination as? DetailVC {
                if let country = sender as? Country {
                    destination.detailCountry = country
                }
            }
        }
    }
}

extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if inSearchMode {
            return currentCountries.count
        }
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryCell {
            var country: Country?
            if inSearchMode {
                country = currentCountries[indexPath.row]
            } else {
                country = countries[indexPath.row]
            }
            
            cell.configureCell(country: country!)
            return cell
        }
        else {
            return CountryCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inSearchMode {
            performSegue(withIdentifier: "toDetailView", sender: currentCountries[indexPath.row])
        }else {
            performSegue(withIdentifier: "toDetailView", sender: countries[indexPath.row])
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension CountriesVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
        }
        currentCountries = countries.filter({ country -> Bool in
                if searchText.isEmpty { return true }
                inSearchMode = true
                return country.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}





