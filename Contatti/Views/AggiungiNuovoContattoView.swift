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
                        Text("Add photo")
                    })
                }
                Section{
                    TextField(text: $nome){
                        Text("name")
                    }
                    .accessibilityLabel("Contact name")
                    TextField(text: $cognome){
                        Text("surname")
                    }.accessibilityLabel("Contact surname")
                    TextField(text: $società){
                        Text("society")
                        // .color(Color(hue: 1.0, saturation: 0.54, brightness: 0.557))
                    }.accessibilityLabel("conctact society")
                }
                
                Section {
                    TextField("add phone number", text: $cellulare)
                    
                }.accessibilityLabel("add Contact phone number")
                
                
            }
            .navigationTitle("Nuovo Contatto").navigationBarTitleDisplayMode(.inline).accessibilityLabel("New contact")
            .listStyle(.grouped)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Dismiss"){
                        dismiss()
                    }
                    .accessibilityLabel("delete changes")
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Done"){
                        if !nome.isEmpty{
                            
                            withAnimation{
                                salvaContatto()
                                dismiss()
                                
                            }
                            
                            
                        }
                    }
                    .accessibilityLabel("Done")
                    .disabled(nome.isEmpty)
                    .disabled(cellulare.isEmpty)
                }
            }
        }
        
        .onAppear(){
            if let contatto{
                nome = contatto.name
                cognome = contatto.surname
                cellulare = contatto.cellular
            }
        }
        
    }
    
    // MARK: - Private methods
    private func salvaContatto(){
        if !nome.isEmpty{
            if let contatto{
                contatto.name = nome
                contatto.surname = cognome
                contatto.cellular = cellulare
                try? modelContext.save()
                // contatto.cognome = cognome
                //  contatto.cellulare = cellulare
            }else {
                let contatto = Contatti(name: nome, cognome: cognome, cellulare: cellulare)
                modelContext.insert(contatto)
            }
        }
    }
}

#Preview {
    AggiungiNuovoContattoView()
}
