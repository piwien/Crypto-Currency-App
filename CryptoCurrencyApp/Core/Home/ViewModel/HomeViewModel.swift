//
//  HomeViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Berkay Yaşar on 28.11.2023.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var coinsdata = [Coin]()
    @Published var topCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coinsdata = coins
                    self.configureTopMovingCoins()
                }
                print("DEBUG COINS: \(coins)")
            } catch let error {
                print("Error: \(error)")
            }
            
        }.resume()
        
    }
    
    func configureTopMovingCoins() {
        let topMovers = coinsdata.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topCoins = Array(topMovers.prefix(5))
    }

}
