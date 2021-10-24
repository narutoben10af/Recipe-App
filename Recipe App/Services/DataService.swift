//
//  DataService.swift
//  Recipe List App
//
//  Created by Lim Si Eian on 22/10/21.
//

import Foundation

class DataService
{
    static func getLocalData() -> [Recipe]
    {
        //Parse 1ocal json file
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //Check if pathString is not nill, otherwise return empty recipe list
        guard pathString != nil else
        {
            return [Recipe]()
        }
        // Create a url obiect
        let url = URL(fileURLWithPath: pathString!)
        
        do
        {
            // Create a data obiect
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do
            {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData
                {
                    r.id = UUID()
                    for i in r.ingredients
                    {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch
            {
                print(error)
            }
            

        }
        catch
        {
            print(error)
        }
        
        return [Recipe]()
    }
}


