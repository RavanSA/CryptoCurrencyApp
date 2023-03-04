//
//  TopCoins.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 4.03.2023.
//

import SwiftUI
import Kingfisher

struct TopCoinsItem: View {
    
    let coin: CoinsDTO
    
    var body: some View {
        VStack(alignment: .leading) {
            
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            HStack(spacing: 2) {
                Text("\(coin.symbol.uppercased())")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("\(coin.currentPrice ?? 0)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            Text("\(coin.priceChangePercentage24H  ?? 0)")
                .font(.caption)
                .foregroundColor(.gray)
        }.frame(width: 140, height: 140)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray), lineWidth: 2)
            )
    }
}

struct TopCoins: View {
    
    @StateObject var viewModel: MainViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Coins")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topCoins) {coin in
                        TopCoinsItem(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

