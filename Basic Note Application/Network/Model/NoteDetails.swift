//
//  NoteDetails.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 21.12.2022.
//

import Foundation

struct NoteDetails: Decodable {
    let id: Int?
    let title: String?
    let note: String?
}
