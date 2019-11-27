//
//  SearchViewController.swift
//  LeaseMaster
//
//  Created by Ernest Boamah Gaisie on 18/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var locations: [Location] = [Location]()
    var searchLocation: [Location] = [Location]()
    
    var searching = false
    var selectedLocation = ""
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchPresenter.sharedInstance.queryLocations()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onLocationsReceived(notification:)), name: Notification.Name("locationsReceived"), object: nil)
    }
    
    @objc func onLocationsReceived(notification: Notification){
        if let locations: [Location] = notification.object as? [Location]
        {
            self.locations = locations
            self.tableView.reloadData()
            
        }
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchLocation.count
        }
        else
        {
            return locations.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SearchTableViewCell
        
        let location = locations[indexPath.row]
        
        if searching{
            cell?.locationLabel.text = searchLocation[indexPath.row].name
        }
        else
        {
            cell?.locationLabel.text = location.name
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchPropertyTableView: searchPropertyViewController = searchPropertyViewController()
        if searching{
            selectedLocation = searchLocation[indexPath.row].slug
            SearchPropertyPresenter.sharedInstance.callFetchproperties(location: selectedLocation)
           
        }
        else
        {
            selectedLocation = locations[indexPath.row].slug
            SearchPropertyPresenter.sharedInstance.callFetchproperties(location: selectedLocation)
            
        }
        let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
        
        let foundPropertiesViewController = (storyboard.instantiateViewController(withIdentifier: "foundProperties") as? searchPropertyViewController)!
        
        
       navigationController?.pushViewController(foundPropertiesViewController, animated: true)

        //tableView.reloadData()
    }
    
    
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchLocation = locations.filter({$0.name.lowercased().contains(searchText.lowercased())})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
