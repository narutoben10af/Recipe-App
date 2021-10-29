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
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
//    static var nState = false

    init()
    {
        // Create an instance of data service
        //        let service = DataService()
        //^^not necessarily as we instead place it as static method in DataService since we only use methods in services
        
        // Get the data
        self.recipes = DataService.getLocalData()
        
//        var categoryStringArray =
        self.categories = Set(self.recipes.map { r in
                                return r.category
                              })
        
        self.categories.update(with: Constants.defaultlistFilter)
        // Set the recipes property
        
    }
    
    static func getPortion(_ ingredient: Ingredient, _ recipeServing: Int, _ targetServing:Int) -> String
    {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if(ingredient.num != nil)
        {
            denominator *= recipeServing
            numerator *= targetServing
            
            // Reduce fraction by greatest common divisor
                
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if(numerator > denominator)
            {
                //Calculated whole portions
                wholePortions = numerator/denominator
                
                //calculated remainder
                numerator = numerator % denominator
                
                //Assign Portion to String
                if(numerator != 0)
                {
                    portion += String(wholePortions) + " \(numerator)/\(denominator)"
                }
                else
                {
                    portion += String(wholePortions)
                }
            }

            else if (numerator == denominator)
            {
                wholePortions = numerator/denominator
                portion += String(wholePortions)
            }
            else
            {
                portion += "\(numerator)/\(denominator)"

            }
            
            //OR
            // if (numerator > 0)
            //    {
            //   portion += wholePortions > 0 ? " " : ""
            //   portion += " \(numerator)/\(denominator)"
            //
            //     }
            
        }
        
        if var unit = ingredient.unit
        {
            
            if(ingredient.num == nil && ingredient.denom == nil)
            {
                portion += unit
            }
            else if(wholePortions > 1 || (wholePortions >= 1 && numerator > 0))
            {
                if unit.hasSuffix("ch")
                {
                    unit += "es"
                }
                else if unit.hasSuffix("f")
                {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else
                {
                    unit += "s"
                }
                
                portion += " " + unit

            }
            else
            {
                portion += " " + unit
            }
        }

        
        
        return portion
    }
    
    static func isPlain(_ ingredient: Ingredient) -> Bool
    {
        if(ingredient.num == nil && ingredient.denom == nil)
        {
            return true
        }

        return false
    }

    
}
