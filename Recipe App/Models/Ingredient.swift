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
}
