//
//  Recipes.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI

// TODO 4. Add Mealz Recipe Details
// 4a. import Nav
// 4b. Add Recipe Details in 2nd page

struct Recipes: View {
    var body: some View {
        VStack {
            DummyRecipeCard(
                imageUrl: "https://hips.hearstapps.com/hmg-prod/images/delish-202102-airfryerchickenparm-184-ls-1612561654.jpg?crop=1xw:0.84375xh;center,top&resize=1200:*",
                title: "Chicken Parm",
                recipeId: "22509",
                fetchPrice: {})
            DummyRecipeCard(
                imageUrl: "https://assets.afcdn.com/recipe/20170112/28965_w1024h768c1cx1500cy1000.webp",
                title: "Croque Monsieur",
                recipeId: "14472",
                fetchPrice: {})
        }
        .padding()
    }
    
    struct DummyRecipeCard: View {
        let imageUrl: String
        let title: String
        let recipeId: String
        let fetchPrice: () -> Void
        
        @State private var showRecipeDetails: Bool = false
        var body: some View {
            VStack {
                Text(title)
                    .bold()
                if let imageUrl = URL(string: imageUrl) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        default:
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .frame(width: 200, height: 100)
                }
                HStack {
                    Button(action: fetchPrice, label: {
                        Text("See Price")
                    })
                    Spacer()
                    Button(action: { showRecipeDetails.toggle() }, label: {
                        Text("Open Card")
                    })
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .sheet(isPresented: $showRecipeDetails, content: {
                Text("RecipeId")
            })
        }
    }
}

#Preview {
    Recipes()
}
