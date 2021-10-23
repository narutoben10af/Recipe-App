//
//  ContentView.swift
//  Recipe List App
//
//  Created by Lim Si Eian on 22/10/21.
//

import SwiftUI

struct RecipeListView: View
{
    @ObservedObject var model = RecipeModel()
//    @State var nCount = 0
    
    var body: some View
    {
        NavigationView
        {
            List(model.recipes)
            { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe),
                label:
                {
                    HStack(spacing: 20.0)
                    {
                        Image(recipe.image).resizable().scaledToFill().cornerRadius(15).frame(width: 50, height:50, alignment: .center).clipped()
                        Text(recipe.name)
                    }

                })

            }.navigationTitle("Recipe List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View
    {
        RecipeListView()
    }
}
