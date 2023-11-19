//
//  LaMiaSchedaView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 19/11/23.
//

import SwiftUI

struct LaMiaSchedaView: View {
    
    //@State private var canUpdateContatto: Bool
    
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
                        Text("Aldo")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text("Vitolo")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
    
                    Section("Cellulare"){
                        Text("0123456789")
                    }

                }
                .listStyle(.grouped)
                .navigationTitle("")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Modifica"){
                           // canUpdateContatto = true
                        }
                        //.sheet(isPresented: $canUpdateContatto){
                            //AggiungiNuovoContattoView(contatto: contatto)
                        //}
                    }
                }
            }
        }
    }
}

#Preview {
    LaMiaSchedaView()
}
