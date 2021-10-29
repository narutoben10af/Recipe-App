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
    @State var storedValue:String?
    @State var isTapped : Bool = false
    //    @Binding var selectedTab:Int
    
    
    private var title: String
    {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultlistFilter
        {
            return "All Recipes"
        }
        else
        {
            return model.selectedCategory!
        }
    }
    //    @State var tabIndex = 1
    
    var body: some View
    {
        //        TabView (selection: $tabIndex)
        //        {
        NavigationView
        {
            //                VStack(alignment: .trailing, spacing: 0)
            //                {
            
            VStack(alignment: .leading)
            {
                HStack
                {
                    Text(title).bold().font(Font.custom("Avenir Heavy", size: 24)).padding(.top, 40)
                    
                    Spacer()
//                    if(model.selectedCategory != Constants.defaultlistFilter )
//                    {
                        Button
                        {
                            if(model.selectedCategory != Constants.defaultlistFilter)
                            {
                                storedValue = model.selectedCategory
                                model.selectedCategory = Constants.defaultlistFilter
                                self.isTapped.toggle()
                            }
                            else
                            {
                                model.selectedCategory = storedValue
                                self.isTapped.toggle()
                            }
                        }
                    label:
                        {
                            Image(systemName: self.isTapped == false ? "xmark.circle" : "arrowshape.turn.up.backward.circle.fill").font(.largeTitle).padding(.horizontal)
//                            Image(systemName: "xmark.circle.fill").font(.largeTitle).padding(.horizontal)
                        }
//                    }
                    
                    //                        Picker("Filter", selection: $selectedTab)
                    //                        {
                    //                            ForEach(Array(model.categories), id: \.self)
                    //                            {
                    //                                category in
                    //                                Text(category)
                    //                                selectedTab = Constants.listTab
                    //                                //Set the selected Category
                    //                                model.selectedCategory = category
                    //
                    //                            }
                    //                        }
                    
                }
                
                ScrollView
                {
                    LazyVStack(alignment: .leading)
                    {
                        ForEach(model.recipes)
                        { recipe in
                            
                            if model.selectedCategory == nil || model.selectedCategory == Constants.defaultlistFilter || model.selectedCategory != nil && recipe.category == model.selectedCategory
                            {
                                
                                NavigationLink(destination: RecipeDetailView(recipe: recipe),
                                               label:
                                                {
                                    HStack(spacing: 20.0)
                                    {
                                        Image(recipe.image).resizable().scaledToFill().clipped().frame(width: 50, height:50, alignment: .center).cornerRadius(10)
                                        
                                        VStack(alignment: .leading)
                                        {
                                            Text(recipe.name).bold().font(Font.custom("Avenir Heavy", size: 16))
                                            RecipeHighlights(recipe.highlights).font(Font.custom("Avenir Heavy", size: 15))
                                            
                                            
                                        }.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    }
                                    
                                })
                                
                            }
                            
                        }.navigationBarHidden(true)
                    }
                }
            }.padding(.leading)
            //                }
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
