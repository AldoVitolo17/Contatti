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
                        Text(contatto?.name ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                            .accessibilityLabel(contatto?.name ?? "")
                        Text(contatto?.surname ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                            .accessibilityLabel(contatto?.surname ?? "")
                    }
                    .accessibilityLabel("Contact Name")
                    
                    Section("Cellular"){
                        Text(contatto?.cellular ?? "")
                    }
                    .accessibilityLabel(contatto?.cellular ?? "")
                    
                    Section{
                        Button("Delete Contact"){
                            deleteContatto(contatto: Contatti(name: "", cognome: "", cellulare: ""))
                            
                        }
                        .accessibilityAddTraits([.isButton])
                        .foregroundColor(.red)
                            .accessibilityLabel("Delete contact")
                    }
                    
                }
                .listStyle(.grouped)
                .navigationTitle(contatto?.name ?? "")
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
