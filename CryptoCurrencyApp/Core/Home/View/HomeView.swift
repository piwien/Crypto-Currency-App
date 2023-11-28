//
//  HomeView.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                // Top movers
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                // All coins
                AllCoinsView(viewModel: viewModel)
                
            }
            .refreshable {
                viewModel.fetchCoinData()
            }
            .navigationTitle("Live Prices")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
