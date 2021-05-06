//
//  UserViewController.swift
//  Week-3_Part-1
//
//  Created by Kerim Caglar on 1.05.2021.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var users = [User]()
    var filteredUsers = [User]()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        
        tableView.dataSource = self
        
        let userURLString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: userURLString) else { return }
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        self.users = users!
        
        configureSearchController()
    }
    
    private func configureSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search User"
        searchController.searchBar.tintColor = .black
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContextForSearchText(searchText: String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            if filteredUsers.isEmpty {
                return 1
            } else {
                return filteredUsers.count
            }
        }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isFiltering && filteredUsers.count == 0 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "notFoundCell")
            cell2?.textLabel?.text = "Not found!"
            return cell2!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
            let user:User
            if isFiltering {
                user = filteredUsers[indexPath.row]
            } else {
                user = users[indexPath.row]
            }
            cell?.textLabel?.text = user.name
            cell?.detailTextLabel?.text = user.company.name
            return cell!
        }
    }
}

extension UserViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchText(searchText:searchBar.text! )
    }
    
}

//MARK: Searchbar || SearchController => cell için custom bir cell tanımlayınız. Veri bulunamadığında ÖZEL bir mesaj gösteriniz. (DONE)
