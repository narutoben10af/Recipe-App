//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Lim Si Eian on 22/10/21.
//

import SwiftUI

struct RecipeDetailView: View
{
    var recipe: Recipe
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                //Title
//                Text(recipe.name)
//                    .font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center)
                //Image
                Image(recipe.image).resizable().scaledToFit().cornerRadius(15).frame(minWidth: nil, idealWidth: 500, maxWidth: 600, minHeight: nil, idealHeight: nil, maxHeight: 400, alignment: .center)
                
                //Description
                VStack(alignment: .center)
                {
                Text(recipe.description).font(.title).multilineTextAlignment(.center)
                }
            
                Spacer()
                //Divider
                Divider()
                //Ingredients
            VStack(alignment: .leading)
                {
                
                VStack(alignment: .leading)
                {
                    Text("Ingredients").font(.headline).fontWeight(.semibold).padding(.vertical, 5)
                    ForEach(recipe.ingredients)
                    {item in
                        Text("• " + item.name).padding(.bottom, 1)
                    }
                }.padding(.horizontal)
                    
                //Divider
                Divider()
                //Directions
                VStack(alignment: .leading)
                {
                    Text("Directions").font(.headline).fontWeight(.semibold).padding(.vertical, 5)
                    ForEach(0..<recipe.directions.count, id: \.self)
                    {index
                        in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom, 5)
                    }
                }.padding(.horizontal)
                
                
            }
        }
        }.navigationTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View
    {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
