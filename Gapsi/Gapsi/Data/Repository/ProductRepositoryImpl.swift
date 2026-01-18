//
//  ProductRepositoryImpl.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

class ProductRepositoryImpl: ProductRepository {
	
	private let networkManager = NetworkManager.shared
	private let baseURL = APIConfig.baseURL
	private let apiKey = APIConfig.apiKey
	
	func searchProductByKeyword(query: String, page: Int) async -> ApiResult<ProductResponseDto> {
		
		var components = URLComponents(string: baseURL + "/wlm/walmart-search-by-keyword")
		components?.queryItems = [
			URLQueryItem(name: "keyword", value: query),
			URLQueryItem(name: "page", value: String(page)),
			URLQueryItem(name: "sortBy", value: DataConstants.sortBestMatch)
		]
		
		guard let url = components?.url else {
			return .error(message: "URL Inválida", code: 0)
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")
		
		return await networkManager.callService(request: request)
	}
}
