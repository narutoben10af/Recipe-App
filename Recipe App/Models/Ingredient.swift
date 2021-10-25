//
//  Ingredient.swift
//  Recipe App
//
//  Created by Lim Si Eian on 24/10/21.
//

import Foundation

class Ingredient : Identifiable, Decodable
{
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
    
//    func getPortion(_ userServingSize:Int, _ servingSize: Int, _ unit: String) -> String
//    {
//        if (num == nil)
//        {
//            return unit
//        }
//        else
//        {
//        var portion:Double = 0
//        if denom != nil
//        {
//        portion = Double((num!*userServingSize))/Double((denom!*servingSize))
//        }
//        else
//        {
//            portion = Double((num!*userServingSize))/Double((servingSize))
//        }
//
//        var newUnit = unit
//
//        if(portion > 1)
//        {
//            newUnit = unit + "s"
//        }
//
//        let newServing = String(portion) + " " + newUnit
//
//        return newServing
//        }
//    }
    
}
