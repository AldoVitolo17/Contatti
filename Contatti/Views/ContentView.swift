//
//  ContentView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 15/11/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Query private var contatto: [Contatti]
    @State private var aggiungiNuovoContatto = false
    @State private var cercaContatto = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(contatto, id: \.self){ contatto in
                    HStack{
                        Text(contatto.nome)
                        Text(contatto.cognome)
                    }
                }
            }
            .navigationTitle("Contatti")
            .toolbar{
                ToolbarItem{
                    Button(action: {aggiungiNuovoContatto=true}, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $aggiungiNuovoContatto){
                        AggiungiNuovoContattoView()
                        
                    }
                }
            }
        }
        .searchable(text: $cercaContatto, prompt: "Cerca")
    }
    
    func ricercaContatto(_ cercaContatto: String, contatto: [Contatti]) -> [Contatti] {
        
        if cercaContatto.isEmpty {
            return contatto
        } else {
            return contatto.filter { $0.nome.lowercased().contains(cercaContatto.lowercased())
            }
        }
    }
}

#Preview {
    ContentView()
    
}
