//
//  NoteDataModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 21.12.2022.
//

import Foundation

struct NoteData: Decodable {
    let total: Int?
    let data: [NoteDetails]?
}
