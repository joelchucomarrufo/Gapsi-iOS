//
//  SearchProductUseCase.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

class SearchProductUseCase {
	private let repository: ProductRepository
	
	init(repository: ProductRepository) {
		self.repository = repository
	}
	
	func execute(query: String) async -> ApiResult<[Product]> {
		let result = await repository.searchProductByKeyword(
			query: query,
			page: DomainConstants.pageInitial
		)
		
		switch result {
			case .success(let dto):
				return .success(data: dto.toDomainList())
				
			case .error(let message, let code):
				return .error(message: message, code: code)
				
			case .loading:
				return .loading
		}
	}
}
