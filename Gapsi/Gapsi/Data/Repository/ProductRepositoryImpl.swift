//
//  ProductRepositoryImpl.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import Combine
import Alamofire

class ProductRepositoryImpl: ProductRepository {
	
	private let networkManager = NetworkManager.shared
	private let baseURL = APIConfig.baseURL
	private let apiKey = APIConfig.apiKey
	
	func searchProductByKeyword(query: String, page: Int) -> AnyPublisher<ApiResult<ProductResponseDto>, Never> {
		
		var components = URLComponents(string: baseURL + "/wlm/walmart-search-by-keyword")
		components?.queryItems = [
			URLQueryItem(name: "keyword", value: query),
			URLQueryItem(name: "page", value: String(page)),
			URLQueryItem(name: "sortBy", value: DataConstants.sortBestMatch)
		]
		
		guard let url = components?.url else {
			return Just(.error(message: "URL Inválida", code: 0)).eraseToAnyPublisher()
		}
		
		let headers: HTTPHeaders = [
			"x-rapidapi-key": apiKey,
		]
		
		return networkManager.callService(url: url, headers: headers)
	}
}
