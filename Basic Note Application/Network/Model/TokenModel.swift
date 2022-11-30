//
//  TokenModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 30.11.2022.
//

import Foundation

struct TokenModel: Decodable {
    let accessToken: String?
    let tokenType: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
