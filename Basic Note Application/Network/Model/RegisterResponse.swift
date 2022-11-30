//
//  BaseResponse.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 30.11.2022.
//

import Foundation

struct RegisterResponse: Decodable {
    let code: String?
    let data: TokenModel?
    let message: String?
}
