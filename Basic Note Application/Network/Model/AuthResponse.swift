//
//  BaseResponse.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 30.11.2022.
//

import Foundation

struct AuthResponse: Decodable {
    let code: String?
    let data: TokenModel?
    let message: String?
}
