//
//  ViewController.swift
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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        CountryService.shared.downloadCountry(urlString: urlString) { (country) in
            self.countries = country!
            self.currentCountries = self.countries
            self.tableView.reloadData()
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryCell {
            let item = currentCountries[indexPath.row]
            cell.configureCell(country: item)
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
        performSegue(withIdentifier: "toDetailView", sender: currentCountries[indexPath.row])
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentCountries = countries.filter({ country -> Bool in
                if searchText.isEmpty { return true }
                return country.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}





