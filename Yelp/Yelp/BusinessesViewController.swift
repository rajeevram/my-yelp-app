//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // API/Logic Variables
    var businesses: [Business]!
    //var searchBar = UISearchBar()
    
    // UI, UX Variables
    @IBOutlet weak var businessTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessTableView.delegate = self
        businessTableView.dataSource = self
        businessTableView.rowHeight = UITableViewAutomaticDimension
        businessTableView.estimatedRowHeight = 120
        
        //navigationItem.titleView = searchBar
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
                self.businesses = businesses
                self.businessTableView.reloadData()
            
                if let businesses = businesses {
                    for business in businesses {
                        print(business.name!)
                        print(business.address!)
                    }
                }
            
            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm(term: "Restaurants", sort: .distance, categories: ["asianfusion", "burgers"]) { (businesses, error) in
                self.businesses = businesses
                 for business in self.businesses {
                     print(business.name!)
                     print(business.address!)
                 }
         }
         */
        
    }
    
    // Delegate Protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    
}
