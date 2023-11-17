//
//  CellulareViewModel.swift
//  Contatti
//
//  Created by Aldo Vitolo on 17/11/23.
//
import SwiftData
import SwiftUI

struct EmailViewModel: View {
    
 
    @State private var nome = ""
    @State private var cognome = ""
    @State private var cellulare = ""
     @State private var società = ""
    @State private var email = ""
    //@State private var immagine = Image("")
    @State private var isDisabled = true
    
    
    var body: some View {
        HStack {
            Button(action: {
                if(isDisabled == false){
                    isDisabled = true
                }
                else if(isDisabled == true){
                    isDisabled = false
                }
            }) {
                if(isDisabled == false){
                    Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                }
                else if(isDisabled == true){
                    Image(systemName: "plus.circle.fill").foregroundColor(.green)
                }
                
            }
            
            TextField("aggiungi email", text: $email)
                .disabled(isDisabled)
        }
    }
}

#Preview {
    CellulareViewModel()
}
