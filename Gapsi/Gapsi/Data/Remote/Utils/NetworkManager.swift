//
//  NetworkManager.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Alamofire
import Combine
import Foundation

class NetworkManager {
	static let shared = NetworkManager()
	
	func callService<T: Decodable>(url: URL, headers: HTTPHeaders) -> AnyPublisher<ApiResult<T>, Never> {
		return AF.request(url, headers: headers)
			.validate()
			.publishDecodable(type: T.self)
			.map { response in
				switch response.result {
					case .success(let value):
						return .success(data: value)
					case .failure(let error):
						return .error(message: error.localizedDescription, code: response.response?.statusCode ?? 0)
				}
			}
			.replaceError(with: .error(message: "Unknown Error", code: -1))
			.prepend(.loading)
			.eraseToAnyPublisher()
	}
}
