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
//    @State var tabIndex = 1
    
    var body: some View
    {
//        TabView (selection: $tabIndex)
//        {
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
//            .tabItem
//            {
//                VStack
//                {
//                    Image(systemName: "list.dash")
//                    Text("List")
//                }
//            }.tag(1)
//
//            Text("Hello World").tabItem
//            {
//                VStack
//                {
//                    Image(systemName: "pencil")
//                    Text("List")
//                }
//            }.tag(2)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View
    {
        RecipeListView()
    }
}
