//
//  ContentView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 15/11/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Query private var contatto: [Contatti] = []
    @State private var aggiungiNuovoContatto = false
    @State private var cercaContatto = ""
    
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                    VStack {
                        Text("Aldo Vitolo").font(.title2).bold()
                        Text("La mia scheda").font(.subheadline)
                    }
                   
                }
                ForEach(contatto, id: \.self){ contatto in
                    NavigationLink{
                        DettagliContattoView(contatto: contatto)
                    } label: {
                        Text(contatto.nome)
                        Text(contatto.cognome)
                        //Text(contatto.cellulare)
                    }
                }
            }
            .listStyle(.grouped)
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
