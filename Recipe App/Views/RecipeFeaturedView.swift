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
    
    var body: some View
    {
        
        VStack(alignment: .leading, spacing: 0)
        {
            
            Text( "Featured Recipes").bold().font(.largeTitle).padding(.leading).padding(.top, 40)
                        
            GeometryReader {geo in
                
                TabView
                {
                    //Loop through each recipe
                    ForEach(0..<model.recipes.count)
                    {index in
                        //if true, feature it
                        if model.recipes[index].featured == true
                        {
                            ZStack
                            {
    //                            if(appe)
                                Rectangle()    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)

                                
                                VStack(spacing: 0)
                                {
                                    Image(model.recipes[index].image).resizable().scaledToFill().clipped()
                                    Text(model.recipes[index].name).padding(8)
                                }
        
                            }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center).cornerRadius(15).shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                        
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading)
            {
                Text( "Preparation Time:").font(.headline)
                Text("1 hour ")
                Text( "Highlights").font(.headline)
                Text( "Healthy, Hearty")
            }.padding([.leading, .bottom])

        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
