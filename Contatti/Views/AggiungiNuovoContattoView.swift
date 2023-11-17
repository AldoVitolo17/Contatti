//
//  AggiungiNuovoContattoView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 16/11/23.
//

import SwiftUI
import SwiftData

struct AggiungiNuovoContattoView: View {
    
    @Environment (\.modelContext) private var modelContext
    @Environment (\.dismiss) private var dismiss
    @Query private var contact:[Contatti]
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
                            
                            withAnimation{
                                salvaContatto()
                                dismiss()
                                
                            }
                            
                            
                        }
                    }
                    .disabled(nome.isEmpty)
                    .disabled(cellulare.isEmpty)
                }
            }
        }
        
        .onAppear(){
            if let contatto{
                nome = contatto.nome
                cognome = contatto.cognome
                cellulare = contatto.cellulare
            }
        }
        
    }
    
    // MARK: - Private methods
    private func salvaContatto(){
        if !nome.isEmpty{
            if let contatto{
                contatto.nome = nome
                contatto.cognome = cognome
                contatto.cellulare = cellulare
                try? modelContext.save()
                // contatto.cognome = cognome
                //  contatto.cellulare = cellulare
            }else {
                let contatto = Contatti(nome: nome, cognome: cognome, cellulare: cellulare)
                modelContext.insert(contatto)
            }
        }
    }
}

#Preview {
    AggiungiNuovoContattoView()
}
