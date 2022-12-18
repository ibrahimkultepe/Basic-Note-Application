//
//  NoteModel.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.12.2022.
//

import Foundation

class NoteModel {
    let id: Int?
    let title: String?
    let note: String?
    
    init(note: NoteDetails) {
        self.id = note.id
        self.title = note.title
        self.note = note.note
    }
}
