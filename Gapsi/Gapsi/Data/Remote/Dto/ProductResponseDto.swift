//
//  ProductResponseDto.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

struct ProductResponseDto: Decodable {
	let responseStatus: String
	let item: ItemDto?
}

struct ItemDto: Decodable {
	let props: PropsDto
}

struct PropsDto: Decodable {
	let pageProps: PagePropsDto
}

struct PagePropsDto: Decodable {
	let initialData: InitialDataDto
}

struct InitialDataDto: Decodable {
	let searchResult: SearchResultDto
}

struct SearchResultDto: Decodable {
	let itemStacks: [ItemStackDto]
}

struct ItemStackDto: Decodable {
	let items: [ProductDto]
}

extension ProductResponseDto {
	func toDomainList() -> [Product] {
		let stacks = self.item?.props.pageProps.initialData.searchResult.itemStacks ?? []
		
		return stacks
			.flatMap { $0.items }
			.map { $0.toDomain() }
	}
}
