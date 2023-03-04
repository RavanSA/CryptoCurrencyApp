//
//  MainViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 4.03.2023.
//

import SwiftUI

class MainViewModel : ObservableObject {
    
    
    @Published var coins = [CoinsDTO]()
    @Published var topCoins = [CoinsDTO]()
    
    
    let request = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    
    
    init() {
        fetchData()
    }
    
    
    func fetchData() {
        
        guard let api = URL(string: request) else {return}

        URLSession.shared.dataTask(with: api) { data, response , error in
            
            
            if let error = error {
                showMessage(error.localizedDescription, title: "Error Occured")
            }
            
            guard let data = data else {return}
            
            do {
                let coins = try JSONDecoder().decode([CoinsDTO].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.getTopCoins()
                }
            } catch let error {
                showMessage(error.localizedDescription, title: "Error Occured")
            }
            
        }.resume()
    }
 
    
    func getTopCoins() {
        let topCoins = coins.sorted(by: {
            $0.priceChangePercentage24H ?? 0 > $1.priceChangePercentage24H ?? 0
        })
        
        self.topCoins = Array(topCoins.prefix(5))
    }
    
}
