//
//  NoteListResponse.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.12.2022.
//

import Foundation

struct NoteListResponse: Decodable {
    let message: String?
    let data: NoteData?
    let code: String?
}

struct NoteData: Decodable {
    let total: Int?
    let data: [NoteDetails]?
}

struct NoteDetails: Decodable {
    let id: Int?
    let title: String?
    let note: String?
}
