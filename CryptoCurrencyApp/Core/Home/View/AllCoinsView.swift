//
//  AllCoinsView.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coinsdata) { coin in
                        CoinCellView(coin: coin)
                    }
                }
            }
        }
    }
}

//#Preview {
//    AllCoinsView()
//}
