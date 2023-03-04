//
//  Coins.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 4.03.2023.
//

import SwiftUI
import Kingfisher

struct CoinItem: View {
    
    let  coin: CoinsDTO
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32,height: 32)
                .foregroundColor(.gray)
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.name.uppercased())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased() )
                    .font(.caption)
                    .padding(.leading, 6)
            } .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(coin.currentPrice?.toCur() ?? "0" )  ")                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("\(coin.priceChangePercentage24H?.toPerc() ?? "0" )  ")
                    .font(.caption)
                    .padding(.leading, 6)
            } .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        
    
    }
}


struct Coins: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
                Text("Coins")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(4)
            
            HStack {
                Text("Name")
                
                Spacer()
                
                Text("Price")
            }.foregroundColor(.gray)
                .font(.caption)
                .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinItem(coin: coin)
                    }
                }
            }
        }
    }
}
