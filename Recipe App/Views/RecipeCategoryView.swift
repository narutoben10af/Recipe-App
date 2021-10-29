//
//  RecipeCategoryView.swift
//  Recipe App
//
//  Created by Lim Si Eian on 29/10/21.
//

import SwiftUI

struct RecipeCategoryView: View
{
    @EnvironmentObject var model: RecipeModel
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedTab:Int
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            Text("Categories").bold().padding(.top, 40).multilineTextAlignment(.center).font(Font.custom("Avenir Heavy", size: 24))
            
            Spacer()
            
            GeometryReader
            {geo in
                
                ScrollView (showsIndicators: false)
                {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], alignment: .center, spacing: 20){
                    
                    ForEach(Array(model.categories), id: \.self)
                    {category in
                        
                        Button
                        {
                            //Switch tabs to list view
                            selectedTab = Constants.listTab
                            
                            //Set the selected Category
                            model.selectedCategory = category
                        }
                    label:
                        {
                            VStack
                            {
                                Image(category.lowercased()).resizable().scaledToFill().frame(width: (geo.size.width-20)/2, height: (geo.size.width-20)/2, alignment: .center).clipped().cornerRadius(20)
                                Text(category).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        
                    }
                }
                }
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}
