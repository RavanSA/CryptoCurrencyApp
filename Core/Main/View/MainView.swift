//
//  MainView.swift
//  CryptoCurrencyApp
//
//  Created by Revan Sadigli on 4.03.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TopCoins(viewModel: viewModel)
                
                Divider()
                
                Coins(viewModel: viewModel)
            }
            .navigationTitle("Cryto App")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
