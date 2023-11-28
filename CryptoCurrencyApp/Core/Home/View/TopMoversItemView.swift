//
//  TopMoversItemView.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            // image
            HStack {
                KFImage(URL(string: coin.image))
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.orange)
                
                Text(coin.symbol.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
            }
            // coin info
            Text(coin.currentPrice.toCurrency())
                .font(.title2)
                .foregroundStyle(.gray)
            
            
            // coin percent change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title3)
                .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1)
        }
    }
}

//#Preview {
//    TopMoversItemView()
//}
