//
//  HomeScreen.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
	@StateObject var viewModel: HomeViewModel
	@State private var isShowingHistory = false
	
	var body: some View {
		VStack {
			SearchBarHistory(
				query: $viewModel.query,
				history: viewModel.history,
				onSearch: { viewModel.searchProducts() }
			)
			.padding(.horizontal)
			.zIndex(10)
			
			Group {
				switch viewModel.products {
					case .loading:
						Spacer()
						ProgressView()
							.scaleEffect(1.5)
							.tint(.blue)
						Spacer()
						
					case .error(let message, _):
						Text("Error: \(message)")
							.foregroundColor(.red)
							.padding()
						
					case .success(let products):
						List(products) { product in
							ProductItem(product: product)
								.listRowSeparator(.hidden)
						}
						.listStyle(.plain)
						
					case .none:
						VStack(spacing: 16) {
							Image(systemName: "magnifyingglass")
								.font(.system(size: 60))
								.foregroundColor(.gray)
							
							Text("Busca un producto")
								.font(.title2)
								.fontWeight(.bold)
							
							Text("Escribe algo para comenzar a comprar")
								.font(.body)
								.foregroundColor(.secondary)
								.multilineTextAlignment(.center)
								.padding(.horizontal, 40)
						}
						.frame(maxWidth: .infinity, maxHeight: .infinity)
				}
			}
		}
		.navigationTitle("Gapsi Shop")
	}
}
