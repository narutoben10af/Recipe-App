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
    @State var selectedPortionSize:Int = 1

    var body: some View
    {
        GeometryReader
        { geo in
            ScrollView
            {
                VStack
                {
                    //Title
                    //                Text(recipe.name)
                    //                    .font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center)
                    //Image
//                    if(RecipeModel.nState)
//                    {
//                        Image(recipe.image).resizable().cornerRadius(15).frame(width: geo.size.width, height: geo.size.height/2-10).padding(.horizontal).clipped().scaledToFit().shadow(radius: 3)
//                    }
//                    else
//                    {
                    
//                        Image(recipe.image).resizable().cornerRadius(15).frame(width: geo.size.width-30, height: geo.size.height/2-10).padding(.horizontal).clipped().scaledToFit().shadow(radius: 3)
                    Image(recipe.image).resizable().cornerRadius(15).frame(width: geo.size.width, height: geo.size.height/2-10, alignment: .leading).clipped().scaledToFit().shadow(radius: 3)

                    
                    
                    VStack(alignment: .leading)
                    {
                    Text(recipe.name)
                        .bold()
                        .padding(.top, 20)
                        .font(Font.custom("Avenir Heavy", size: 24))
                    }
                    
                    //                        .frame(minWidth: nil, idealWidth: 500, maxWidth: 600, minHeight: nil, idealHeight: nil, maxHeight: 400, alignment: .center)
                    
                    
                    //Description
                    VStack(alignment: .center)
                    {
                        Text(recipe.description).font(Font.custom("Avenir Heavy", size: 18)).multilineTextAlignment(.center).padding(.horizontal)
                    }
                    
                    Spacer()
                    //Divider
                    Divider()
                    //Ingredients
                    VStack(alignment: .leading)
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Choose your serving size").bold().font(Font.custom("Avenir Heavy", size: 16))
                            Picker("", selection: $selectedPortionSize)
                            {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("4").tag(4)
                                Text("6").tag(6)
                                Text("8").tag(8)
                            }.pickerStyle(SegmentedPickerStyle()).frame(width: geo.size.width/2)
                        }.padding()
                        
                        VStack(alignment: .leading)
                        {
                            Text("Ingredients").font(Font.custom("Avenir Heavy", size: 16)).fontWeight(.semibold).padding(.vertical, 5)
                            ForEach(recipe.ingredients)
                            {item in
                                if(RecipeModel.isPlain(item))
                                {
                                    Text("• " + item.name + " " +  RecipeModel.getPortion(item, recipe.servings, selectedPortionSize).lowercased()).padding(.bottom, 1)                    .font(Font.custom("Avenir", size: 15))
                                }
                                else
                                {
                                Text("• " + RecipeModel.getPortion(item, recipe.servings, selectedPortionSize) + " " + item.name.lowercased()).padding(.bottom, 1).font(Font.custom("Avenir", size: 15))

                                }
                                
                            }
                        }.padding(.horizontal)
                        
                        //Divider
                        Divider()
                        //Directions
                        VStack(alignment: .leading)
                        {
                            Text("Directions").font(Font.custom("Avenir Heavy", size: 16)).fontWeight(.semibold).padding(.vertical, 5)
                            ForEach(0..<recipe.directions.count, id: \.self)
                            {index
                                in
                                Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom, 5).font(Font.custom("Avenir", size: 15))

                            }
                        }.padding(.horizontal)
                        
                        
                    }
                }
            }
            
//            .navigationTitle(recipe.name)
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View
    {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
