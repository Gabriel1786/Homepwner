//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Graduando on 2/3/16.
//  Copyright © 2016 DP Content. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) {
            return itemStore.valueMoreThan50.count
        }
        if (section == 1) {
            return itemStore.valueLessThan50.count + 1 //Silver Challenge
        }
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        // Create an instance of UITableViewCell, with default appearance
//        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        // Bronze Challenge
        if (indexPath.section == 0){
            let item = itemStore.valueMoreThan50[indexPath.row]
            
            cell.textLabel?.font = UIFont(name: "Avenir", size: 16)
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            
            return cell
        }
        if (indexPath.section == 1) {
            if (indexPath.row < itemStore.valueLessThan50.count) { //Silver Challenge
                let item = itemStore.valueLessThan50[indexPath.row]
                
                cell.textLabel?.font = UIFont(name: "Avenir", size: 16)
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
                
                return cell
                
            } else {
                cell.textLabel?.text = "NO MORE ITEMS!"
                cell.textLabel?.font = UIFont(name: "Avenir", size: 12)
                cell.textLabel?.textColor = UIColor.whiteColor()
                cell.detailTextLabel?.text = ""
                cell.backgroundColor? = UIColor.orangeColor()
            }
        }
//        
//        // Set the text on the cell with the description of the item that is at the nth index of items, where n = row this cell will appear in on the tableview
//        let item = itemStore.allItems[indexPath.row]
//        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
        }

    // Bronze Challenge
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section){
            case 0: return "Value More Than 50"
            case 1: return "Value Less Than 50"
            default: return ""
        }
    }
    // Gold Challenge
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 60
        }
        if (indexPath.section == 1) {
            if (indexPath.row < itemStore.valueLessThan50.count) {
                return 60
            } else {
                return 20
            }
        }
        return 44
    }
    
    
    
    
    
    
}
