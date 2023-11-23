//
//  LaMiaSchedaView.swift
//  Contatti
//
//  Created by Aldo Vitolo on 19/11/23.
//
import SwiftData
import SwiftUI

struct LaMiaSchedaView: View {
    @Environment(\.modelContext) private var modalContext
    @State private var canUpdateContatto = false
    @State var contatto: Contatti? = nil
    @State private var nome = ""
    @State private var cognome = ""
    @State private var cellulare = ""
    @State private var società = ""
    
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
                        
                        
                        //.background(Color(.systemBackground))
                    Section("Name"){
                        Text(contatto?.nome ?? "Aldo")
                            .font(.headline)
                            .fontWeight(.medium)
                        Text(contatto?.cognome ?? "Vitolo")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
    
                    Section("Cellular"){
                        Text(contatto?.cellulare ?? "0123456789")
                    }

                }
                .listStyle(.grouped)
                .navigationTitle("")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Modify"){
                           //canUpdateContatto = true
                        
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
