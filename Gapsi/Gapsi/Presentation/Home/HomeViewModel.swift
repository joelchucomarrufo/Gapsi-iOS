//
//  HomeViewModel.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
	
	@Published var products: ApiResult<[Product]>? = nil
	@Published var history: [String] = []
	@Published var query: String = ""
	
	private let searchUseCase: SearchProductUseCase
	
	init(searchUseCase: SearchProductUseCase) {
		self.searchUseCase = searchUseCase
		loadHistory()
	}
	
	func updateQuery(_ value: String) {
		self.query = value
	}
	
	func searchProducts() {
		Task {
			SearchHistoryManager.shared.saveQuery(query)
			loadHistory()
			
			self.products = .loading
			
			let result = await searchUseCase.execute(query: query)
			self.products = result
		}
	}
	
	func loadHistory() {
		self.history = SearchHistoryManager.shared.getHistory()
	}
}
