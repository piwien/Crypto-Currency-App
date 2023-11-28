//
//  CoinCellView.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import SwiftUI
import Kingfisher

struct CoinCellView: View {
    let coin: Coin
    var body: some View {
        HStack {
            // market rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundStyle(.gray)
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            
            // coin name
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 3)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 5)
            }
            Spacer()
            
            // coin price
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                   
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
                    
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    CoinCellView()
//}
