//
//  ProductDto.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

struct ProductDto: Decodable {
	let id: String?
	let name: String?
	let price: Double?
	let imageInfo: ProductImageInfoDto?
	
	enum CodingKeys: String, CodingKey {
		case id, name, price, imageInfo
	}
}

struct ProductImageInfoDto: Decodable {
	let thumbnailUrl: String
}

extension ProductDto {
	func toDomain() -> Product {
		return Product(
			id: self.id ?? "",
			title: self.name ?? "",
			price: self.price ?? 0.0,
			thumbnail: self.imageInfo?.thumbnailUrl ?? ""
		)
	}
}
