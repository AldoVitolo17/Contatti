//
//  AggiungiNuovoContattoView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 16/11/23.
//

import SwiftUI

struct AggiungiNuovoContattoView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Environment (\.dismiss) private var dismiss
    
    @State private var nome = ""
    @State private var cognome = ""
    @State private var cellulare = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField(text: $nome){
                    Text("Nome")
                }
                TextField(text: $cognome){
                    Text("cognome")
                }
                TextField(text: $cellulare){
                    Text("cellulare")
                }
                .navigationTitle("Nuovo Contatto").navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button("Annulla"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Fine"){
                            if !nome.isEmpty{
                                let contatto = Contatti(nome: nome, cognome: cognome, cellulare: cellulare)
                                modelContext.insert(contatto)
                                
                                dismiss()
                            }
                        }
                        .disabled(nome.isEmpty)
                        .disabled(cellulare.isEmpty)
                    }
                }
            }
        }
    }
}

#Preview {
    AggiungiNuovoContattoView()
}
