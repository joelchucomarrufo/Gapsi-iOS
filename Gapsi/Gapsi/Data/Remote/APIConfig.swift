//
//  APIConfig.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

enum APIConfig {
	static var apiKey: String {
		return Bundle.main.object(forInfoDictionaryKey: "API_Key") as? String ?? ""
	}
	
	static var baseURL: String {
		let url = Bundle.main.object(forInfoDictionaryKey: "Base_URL") as? String ?? ""
		return "https://\(url)"
	}
}
