//
//  Basket.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI
import MealzNaviOSSDK

// TODO: 6. Show MyBasket
// TODO 6a. Import Nav
// TODO 6b. Add MyBasket component

struct Basket: View {
    var body: some View {
        MealzMyBasketFeatureSwiftUI(myBasketContructor: MyBasketFeatureConstructor(navigateToCatalog: {}, navigateToCheckout: { _ in }))
    }
}
