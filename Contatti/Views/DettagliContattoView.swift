//
//  DettagliContattoView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 16/11/23.
//

import SwiftUI

struct DettagliContattoView: View {
    
    @State var contatto: Contatti?
    @State private var canUpdateContatto = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                
                List{
                    
                    Section{
                        Text(contatto?.nome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text(contatto?.cognome ?? "")
                            .font(.headline)
                            .fontWeight(.medium)
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
}

#Preview {
    DettagliContattoView()
}
