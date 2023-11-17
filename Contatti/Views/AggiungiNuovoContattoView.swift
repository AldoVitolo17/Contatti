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
    @State var contatto: Contatti? = nil
    @State private var nome = ""
    @State private var cognome = ""
    @State private var cellulare = ""
     @State private var società = ""
    @State private var email = ""
    //@State private var immagine = Image("")
    @State private var isDisabled = true
    
    var body: some View {
        
        
        NavigationStack{
            
            
            
            List{
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 190)
                        Spacer()
                    }.foregroundColor(.gray)
                    
                    Button(action: {}, label: {
                        Text("Aggiungi Foto")
                    })
                }
                Section{
                    TextField(text: $nome){
                        Text("Nome")
                    }
                    TextField(text: $cognome){
                        Text("Sognome")
                    }
                    TextField(text: $società){
                     Text("Società")
                    // .color(Color(hue: 1.0, saturation: 0.54, brightness: 0.557))
                    }
                }
                
                Section {
                    TextField("aggiungi cellulare", text: $cellulare)
                        
                }
                
                
            }
            .navigationTitle("Nuovo Contatto").navigationBarTitleDisplayMode(.inline)
            .listStyle(.grouped)
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

#Preview {
    AggiungiNuovoContattoView()
}
