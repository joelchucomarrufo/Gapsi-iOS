//
//  Result.swift
//  Gapsi
//
//  Created by Joel Martin Chuco Marrufo on 18/01/26.
//

import Foundation

enum ApiResult<T> {
	case loading
	case success(data: T)
	case error(message: String, code: Int)
}
