//
//  ContattiApp.swift
//  Contatti
//
//  Created by Aldo Vitolo on 15/11/23.
//
import SwiftData
import SwiftUI

@main
struct ContattiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Contatti.self)
    }
}
