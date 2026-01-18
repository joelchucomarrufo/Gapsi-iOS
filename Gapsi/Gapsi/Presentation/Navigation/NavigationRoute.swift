//
//  NavigationRoute.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import SwiftUI

struct NavigationRoute: View {
	let viewModel = HomeViewModel(
		searchUseCase: SearchProductUseCase(
			repository: ProductRepositoryImpl()
		)
	)
	
	var body: some View {
		NavigationStack {
			HomeScreen(viewModel: viewModel)
		}
	}
}
