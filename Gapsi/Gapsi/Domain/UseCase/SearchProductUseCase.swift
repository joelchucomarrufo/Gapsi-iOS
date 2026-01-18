//
//  SearchProductUseCase.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import Combine

class SearchProductUseCase {
	private let repository: ProductRepository
	
	init(repository: ProductRepository) {
		self.repository = repository
	}
	
	func execute(query: String) -> AnyPublisher<ApiResult<[Product]>, Never> {
		return repository.searchProductByKeyword(query: query, page: 1)
			.map { result in
				switch result {
					case .success(let dto): return .success(data: dto.toDomainList())
					case .error(let msg, let code): return .error(message: msg, code: code)
					case .loading: return .loading
				}
			}
			.eraseToAnyPublisher()
	}
}
