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
                    Section("Nome"){
                        Text(contatto?.nome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text(contatto?.cognome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    
                    Section("Cellulare"){
                        Text(contatto?.cellulare ?? "")
                    }
                    
                    Section{
                        Button("Elimina Contatto"){
                            deleteContatto(contatto: Contatti(nome: "", cognome: "", cellulare: ""))
                            
                        }.foregroundColor(.red)
                    }
                    
                }
                .listStyle(.grouped)
                .navigationTitle(contatto?.nome ?? "")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Modifica"){
                            canUpdateContatto = true
                        }
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
