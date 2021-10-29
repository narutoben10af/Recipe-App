//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Lim Si Eian on 23/10/21.
//

import SwiftUI

struct RecipeTabView: View
{
    @State var tabIndex = Constants.featuredTab
//    @State var tabIndex = Constants.defaultlistFilter

    var body: some View
    {
        TabView(selection: $tabIndex)
        {
            RecipeFeaturedView().tabItem
            {
                VStack
                {
                    Image(systemName: "star")
                    Text("Featured")
                }
            }.tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $tabIndex).tabItem
            {
                VStack
                {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
            }.tag(Constants.categoryTab)

            
            RecipeListView().tabItem
            {
                VStack
                {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            }.tag(Constants.listTab)
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeTabView()
    }
}
