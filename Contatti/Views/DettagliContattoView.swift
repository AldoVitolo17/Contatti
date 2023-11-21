//
//  DettagliContattoView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 16/11/23.
//

import SwiftUI

struct DettagliContattoView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State var contatto: Contatti?
    @State private var canUpdateContatto = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                
                List{
                    HStack{
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 190)
                        Spacer()
                    }.foregroundColor(.gray)
                        .accessibilityLabel("Contate Image")
                    Section("Name"){
                        Text(contatto?.nome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                            .accessibilityLabel(contatto?.nome ?? "")
                        Text(contatto?.cognome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                            .accessibilityLabel(contatto?.cognome ?? "")
                    }
                    .accessibilityLabel("Contact Name")
                    
                    Section("Cellular"){
                        Text(contatto?.cellulare ?? "")
                    }
                    .accessibilityLabel(contatto?.cellulare ?? "")
                    
                    Section{
                        Button("Delete Contact"){
                            deleteContatto(contatto: Contatti(nome: "", cognome: "", cellulare: ""))
                            
                        }
                        .accessibilityAddTraits([.isButton])
                        .foregroundColor(.red)
                            .accessibilityLabel("Delete contact")
                    }
                    
                }
                .listStyle(.grouped)
                .navigationTitle(contatto?.nome ?? "")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Modify"){
                            canUpdateContatto = true
                        }
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Modify contact")
                        .sheet(isPresented: $canUpdateContatto){
                            AggiungiNuovoContattoView(contatto: contatto)
                        }
                    }
                    
                }
               
               
                    
               
            }
        }
    }
    
    private func deleteContatto(contatto: Contatti){
        modelContext.delete(contatto)
    }
}

#Preview {
    DettagliContattoView()
}
