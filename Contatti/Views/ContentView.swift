import SwiftUI
import SwiftData
import UIKit

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var contatto: [Contatti] = []
    @State private var aggiungiNuovoContatto = false
    @State private var cercaContatto = ""

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: LaMiaSchedaView()) {
                        HStack(){
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                            VStack {
                                Text(" Aldo Vitolo").font(.title2).bold()
                                Text("My informations").font(.subheadline)
                            }
                        }
                        
                    }
                }.accessibilityAddTraits([.isButton])
                    //.background(Color(.systemBackground).ignoresSafeArea())
                    .accessibilityLabel("My information")
                    
                // Raggruppa i contatti per lettera iniziale
                let contattiByLetter = Dictionary(grouping: contatto) { String($0.name.prefix(1)).uppercased() }

                // Itera sul dizionario per creare le sezioni
                ForEach(contattiByLetter.sorted(by: { $0.key < $1.key }), id: \.key) { key, contattiInLetter in
                    Section(header: Text(key)) {
                        ForEach(contattiInLetter.filter { contatto in
                            cercaContatto.isEmpty ||
                                contatto.name.lowercased().contains(cercaContatto.lowercased()) ||
                                contatto.surname.lowercased().contains(cercaContatto.lowercased())
                        }, id: \.self) { contatto in
                            NavigationLink(destination: DettagliContattoView(contatto: contatto)) {
                                Text(contatto.name)
                                Text(contatto.surname)
                            }
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    deleteContatto(contatto: contatto)
                                }
                            }
                            
                        }
                    }
                }
            }
            
            .listStyle(.grouped)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button(action: {aggiungiNuovoContatto=true}, label: {
                        Image(systemName: "plus")
                    })
                    .accessibilityAddTraits([.isButton])
                    .sheet(isPresented: $aggiungiNuovoContatto){
                        AggiungiNuovoContattoView()
                    }
                    .accessibilityLabel("add a new contact")
                    
                }
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {}, label: {
                        Text("")
                    })
                }
            }
        }
        .searchable(text: $cercaContatto, prompt: "Search")
    }

    func deleteContatto(contatto: Contatti){
        modelContext.delete(contatto)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
