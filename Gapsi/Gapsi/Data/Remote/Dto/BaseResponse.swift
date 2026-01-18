//
//  BaseResponse.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
	let responseStatus: String
	let item: T?
}
