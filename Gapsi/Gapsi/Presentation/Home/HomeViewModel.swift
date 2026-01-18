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
	
	private var cancellables = Set<AnyCancellable>()
	private let searchUseCase: SearchProductUseCase
	
	init(searchUseCase: SearchProductUseCase) {
		self.searchUseCase = searchUseCase
		loadHistory()
	}
	
	func updateQuery(_ value: String) {
		self.query = value
	}
	
	func searchProducts() {
		searchUseCase.execute(query: query)
			.receive(on: DispatchQueue.main)
			.sink { [weak self] result in
				self?.products = result
			}
			.store(in: &cancellables)
	}
	
	func loadHistory() {
		self.history = SearchHistoryManager.shared.getHistory()
	}
}
