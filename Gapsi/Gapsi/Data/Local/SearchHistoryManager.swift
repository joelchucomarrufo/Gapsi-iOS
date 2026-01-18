//
//  SearchHistoryManager.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

class SearchHistoryManager {
	private let key = "search_history"
	static let shared = SearchHistoryManager()
	
	func saveQuery(_ query: String) {
		var current = getHistory()
		if !current.contains(query) {
			current.append(query)
			UserDefaults.standard.set(current, forKey: key)
		}
	}
	
	func getHistory() -> [String] {
		return UserDefaults.standard.stringArray(forKey: key) ?? []
	}
}
