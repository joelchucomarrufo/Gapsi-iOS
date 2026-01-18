//
//  ProductItem.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation
import SwiftUI

struct ProductItem: View {
	let product: Product
	
	var body: some View {
		HStack(alignment: .top, spacing: 12) {
			if !product.thumbnail.isEmpty, let url = URL(string: product.thumbnail) {
				AsyncImage(url: url) { image in
					image.resizable()
						.aspectRatio(contentMode: .fill)
				} placeholder: {
					ProgressView()
				}
				.frame(width: 80, height: 80)
				.clipShape(RoundedRectangle(cornerRadius: 8))
			} else {
				Rectangle()
					.fill(Color.gray)
					.frame(width: 80, height: 80)
					.overlay(Text("Sin imagen").font(.caption).foregroundColor(.white))
					.cornerRadius(8)
			}
			
			VStack(alignment: .leading, spacing: 4) {
				Text(product.title)
					.font(.headline)
					.lineLimit(2)
				
				Text("$\(product.price, specifier: "%.2f")")
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
		}
		.padding(.vertical, 4)
	}
}
