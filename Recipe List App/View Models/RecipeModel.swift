//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Lim Si Eian on 22/10/21.
//

import Foundation

class RecipeModel: ObservableObject
{
    @Published var recipes = [Recipe]()
    
    init()
    {
        // Create an instance of data service
        //        let service = DataService()
        //^^not necessarily as we instead place it as static method in DataService since we only use methods in services
        
        // Get the data
        self.recipes = DataService.getLocalData()
        
        // Set the recipes property
        
    }
    
}
