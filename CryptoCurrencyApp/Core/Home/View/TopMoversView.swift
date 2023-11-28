//
//  TopMoversView.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topCoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}
