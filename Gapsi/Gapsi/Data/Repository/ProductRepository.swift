//
//  ProductRepository.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import Combine

protocol ProductRepository {
	func searchProductByKeyword(query: String, page: Int) -> AnyPublisher<ApiResult<ProductResponseDto>, Never>
}
