//
//  SearchBarHistory.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import SwiftUI

struct SearchBarHistory: View {
	@Binding var query: String
	let history: [String]
	let onSearch: () -> Void
	@State private var isShowingHistory = false
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				TextField("Buscar producto...", text: $query, onEditingChanged: { focused in
					isShowingHistory = focused && !history.isEmpty
				})
				.textFieldStyle(.roundedBorder)
				.submitLabel(.search)
				.onSubmit {
					isShowingHistory = false
					onSearch()
				}
				
				Button(action: {
					hideKeyboard()
					isShowingHistory = false
					onSearch()
				}) {
					Image(systemName: "magnifyingglass")
						.foregroundColor(.white)
						.padding(8)
						.background(Color.blue)
						.cornerRadius(8)
				}
			}			
		}
		.overlay(alignment: .top) {
			if isShowingHistory && !history.isEmpty {
				VStack {
					Spacer(minLength: 45)
					VStack(alignment: .leading, spacing: 0) {
						ForEach(history.prefix(10), id: \.self) { item in
							Button(action: {
								query = item
								isShowingHistory = false
								UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
								onSearch()
							}) {
								Text(item)
									.padding(12)
									.frame(maxWidth: .infinity, alignment: .leading)
									.background(Color(.systemBackground))
							}
							Divider()
						}
					}
					.background(Color(.systemBackground))
					.cornerRadius(8)
					.shadow(radius: 4)
				}
			}
		}
	}
}

func hideKeyboard() {
	UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
