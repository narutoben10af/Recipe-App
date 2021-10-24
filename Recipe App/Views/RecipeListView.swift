//
//  ContentView.swift
//  Recipe List App
//
//  Created by Lim Si Eian on 22/10/21.
//

import SwiftUI

struct RecipeListView: View
{
    @EnvironmentObject var model:RecipeModel
    @Environment(\.colorScheme) var colorScheme
//    @State var tabIndex = 1
    
    var body: some View
    {
//        TabView (selection: $tabIndex)
//        {
            NavigationView
            {
                VStack(alignment: .leading)
                {
                    Text("All Recipes").bold().font(.largeTitle).padding(.top, 40)
                    
                    ScrollView
                    {
                        
                        LazyVStack(alignment: .leading)
                        {
                            ForEach(model.recipes)
                            { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe),
                                label:
                                {
                                    HStack(spacing: 20.0)
                                    {
                                        Image(recipe.image).resizable().scaledToFill().clipped().frame(width: 50, height:50, alignment: .center).cornerRadius(10)
                                        Text(recipe.name).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    }

                                })

                            }.navigationBarHidden(true)
                        }
                    }
                }.padding(.leading)
//                .navigationTitle("Recipe List")
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
        RecipeListView().environmentObject(RecipeModel())
    }
}
