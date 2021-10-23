//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Lim Si Eian on 23/10/21.
//

import SwiftUI

struct RecipeTabView: View
{
    @State var tabIndex = 2
    var body: some View
    {
        TabView(selection: $tabIndex)
        {
            Text("Featured View").tabItem
            {
                VStack
                {
                    Image(systemName: "star")
                    Text("Featured")
                }
            }.tag(1)
            
            RecipeListView().tabItem
            {
                VStack
                {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            }.tag(2)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeTabView()
    }
}
