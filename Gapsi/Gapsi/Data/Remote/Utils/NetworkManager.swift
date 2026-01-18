//
//  NetworkManager.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()
	
	func callService<T: Decodable>(request: URLRequest) async -> ApiResult<T> {
		do {
			print("DEBUG NETWORK REQUEST: \(request)")
			let (data, response) = try await URLSession.shared.data(for: request)
			
			guard let httpResponse = response as? HTTPURLResponse else {
				return .error(message: "Error de servidor", code: 0)
			}
			
			if (200...299).contains(httpResponse.statusCode) {
				let decodedData = try JSONDecoder().decode(T.self, from: data)
				return .success(data: decodedData)
			} else {
				return .error(message: "Error del servidor", code: httpResponse.statusCode)
			}
		} catch {
			print("DEBUG NETWORK ERROR: \(error)")
			return .error(message: error.localizedDescription, code: -1)
		}
	}
}
