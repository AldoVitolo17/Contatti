//
//  InfoContatto.swift
//  Contatti
//
//  Created by Aldo Vitolo on 15/11/23.
//
import SwiftUI
import Foundation
import SwiftData

@Model
final class Contatti {
    var id = UUID().uuidString
    var nome : String
    var cognome : String
    var cellulare : String
    //var società : String
    //var email : String?
    //var immagine : Image?
    
//    init(id: String = UUID().uuidString, nome: String, cognome: String, cellulare: String, società: String, email: String) {
//        self.id = id
//        self.nome = nome
//        self.cognome = cognome
//        self.cellulare = cellulare
//        self.società = società
//        self.email = email
//    }
    init(id: String = UUID().uuidString, nome: String, cognome: String, cellulare: String) {
        self.id = id
        self.nome = nome
        self.cognome = cognome
        self.cellulare = cellulare
    }
    
}

