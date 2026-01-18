//
//  ProductRepository.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

protocol ProductRepository {
	func searchProductByKeyword(query: String, page: Int) async -> ApiResult<ProductResponseDto>
}
