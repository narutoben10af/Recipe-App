//
//  RecipeHighlights.swift
//  Recipe App
//
//  Created by Lim Si Eian on 25/10/21.
//

import SwiftUI

struct RecipeHighlights: View
{
    var allHighlights = ""

    init(_ highlights: [String])
    {
        //loop through the highlights and build the string
        for index in 0..<highlights.count
        {
            //if last item don't add a comma
            if(index == highlights.count - 1)
            {
                allHighlights.append(highlights[index])
            }
            else
            {
                allHighlights.append(highlights[index] + ", ")
            }
            
        }
    }
    
    var body: some View
    {
        Text(allHighlights).font(Font.custom("Avenir", size: 15))

        
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(["test", "test 2", "test 3"])
    }
}
