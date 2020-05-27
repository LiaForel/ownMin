//
//  HomeViewController.swift
//  ownMin
//
//  Created by Bakulia Kurmant on 4/28/20.
//  Copyright © 2020 Bakulia Kurmant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var itemsArray = [Items]() // to set table
    var currentItemsArray = [Items]()
    
    var existingOutfits = ["Outfit_One", "Outfit_Two", "Outfit_Three", "Outfit_Four", "Outfit_Five", "Outfit_Six","Outfit_Seven"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItems()
        setUpSearchBar()
        alterLayout()
    

     }
    
    private func setUpItems(){
        // ALL
        itemsArray.append(Items(name: "one", category: .all, image: "1"))
        itemsArray.append(Items(name: "two", category: .all, image: "2"))
        itemsArray.append(Items(name: "three", category: .all, image: "3"))
        itemsArray.append(Items(name: "four", category: .all, image: "4"))
        itemsArray.append(Items(name: "five", category: .all, image: "5"))
         
        
        // Favorites
        itemsArray.append(Items(name: "one", category: .favorites, image: "1"))
        itemsArray.append(Items(name: "three", category: .favorites, image: "3"))
        
        currentItemsArray = itemsArray
        
    }
    
    
    
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func alterLayout() {
        table.tableHeaderView = searchBar
        // search bar in section header
        table.estimatedSectionHeaderHeight = 100
        // search bar in navigation bar
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
    
        searchBar.showsScopeBar = true // you can show/hide this dependant on your layout
        searchBar.placeholder = "Search"
        searchBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" ) as? TableCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = currentItemsArray[indexPath.row].name
        cell.categoryLabel.text = currentItemsArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named:currentItemsArray[indexPath.row].image)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentItemsArray = itemsArray.filter({ item -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return item.name.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty { return item.category == .all }
                return item.name.lowercased().contains(searchText.lowercased()) &&
                item.category == .all
            case 2:
                if searchText.isEmpty { return item.category == .favorites }
                return item.name.lowercased().contains(searchText.lowercased()) &&
                item.category == .favorites
            default:
                return false
            }
        })
        table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            switch selectedScope {
            case 0:
                currentItemsArray = itemsArray.filter({ item -> Bool in
                    item.category == ItemsType.all
                })
            case 1:
                currentItemsArray = itemsArray.filter({ item -> Bool in
                    item.category == ItemsType.favorites
                })
            default:
                break
            }
            table.reloadData()
        }
    



func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return existingOutfits.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AddToClosetCollectionViewCell
    
    cell.OutfitNameLabel.text = existingOutfits[indexPath.item]
    
    return cell
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}




class Items {
    
    let name: String
    let image: String
    let category: ItemsType
    
    
    init(name: String, category: ItemsType, image: String) {

        self.name = name
        self.category = category
        self.image = image
    }
    
}

// Add to the existing closet

class ExistingItems {
    
    let existingName: String
    let existingImage: String
   
    init(existingName: String, existingImage: String) {
        self.existingName = existingName
        self.existingImage = existingImage
    }
    
}

enum ItemsType: String {
    case all = "All"
    case favorites = "Favorites"
}
