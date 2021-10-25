//
//  RecipeFeaturedView.swift
//  Recipe App
//
//  Created by Lim Si Eian on 24/10/21.
//

import SwiftUI

struct RecipeFeaturedView: View
{
    @EnvironmentObject var model:RecipeModel
    @Environment(\.colorScheme) var colorScheme
    @State var isDetailViewShown = false
    @State var tabSelectionIndex = 0
    
    var body: some View
    {
        
        VStack(alignment: .leading, spacing: 0)
        {
            
            Text( "Featured Recipes").bold().font(Font.custom("Avenir Heavy", size: 24)).padding(.leading).padding(.top, 40)
            
            GeometryReader {geo in
                
                TabView (selection: $tabSelectionIndex)
                {
                    //Loop through each recipe
                    ForEach(0..<model.recipes.count)
                    {index in
                        //if true, feature it
                        if model.recipes[index].featured == true
                        {
                            Button(action:
                                    {
                                //show recipe detail sheet
                                self.isDetailViewShown = true
//                                RecipeModel.nState = true
                            },
                                   label:
                                    {
                                ZStack
                                {
                                    //                            if(appe)
                                    Rectangle().foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                    
                                    
                                    ZStack
                                    {
                                        Image(model.recipes[index].image).resizable().scaledToFill().clipped()
                                        VStack(spacing: 0)
                                        {
                                            Spacer()
                                            Text(model.recipes[index].name).font(Font.custom("Avenir Heavy", size: 16)).bold().foregroundColor(colorScheme == .dark ? Color.white : Color.black).padding().border(Color.clear).background(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.6)).cornerRadius(10).padding(.bottom, 3)
                                        }
                                    }
                                    
                                }
                            }).tag(index).sheet(isPresented: $isDetailViewShown)
                            {
                                RecipeDetailView(recipe: model.recipes[index])
                            }.buttonStyle(PlainButtonStyle()).frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center).cornerRadius(15).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            
            VStack (alignment: .leading, spacing : 10)
            {
                Text( "Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
               Text(model.recipes[tabSelectionIndex].prepTime).font(Font.custom("Avenir", size: 14))

                Text( "Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(model.recipes[tabSelectionIndex].highlights)
            }.padding([.leading, .bottom])
            

        }.onAppear(perform: {
            setFeaturedIndex()
            
        })
        
    }
//
    func setFeaturedIndex()
    {
        //Find the first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
