//
//  ItemStore.swift
//  Homepwner
//
//  Created by Graduando on 2/3/16.
//  Copyright © 2016 DP Content. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init(){
        for _ in 0..<5 {
            createItem()
        }
    }
    
}
