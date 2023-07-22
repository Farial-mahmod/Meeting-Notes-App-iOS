//  ContentView.swift

//  Created by Farial Mahmod on 7/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var note: FetchedResults<Note>
    
    // @Environment(\.dismiss) var dismiss
    
    @State private var showingAddView = false
    
    var body: some View{
        
        NavigationView{
            VStack(alignment: .leading){

                List{
                    ForEach(note){ note in
                        NavigationLink(destination: EditNoteView(note: note)){
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 15){
                                Text(note.name!).bold().font(.system(size: 23))
                                Text(note.meeting!)
                            }
                            
                            Spacer()
                            
                            Text(calcTimeSince(date: note.date!)).foregroundColor(.green).italic()
                    }
                }
            }
            .onDelete(perform: deleteNote)
        }
        .listStyle(.plain)
    }
            .navigationTitle("Meeting Notes")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    showingAddView.toggle()
                } label: {
                    Label("Add Notes", systemImage: "plus.circle")
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
        }.sheet(isPresented: $showingAddView){
            AddNewNote()
        }
}.navigationViewStyle(.stack)
}

// deleting notes
private func deleteNote(offsets: IndexSet){
    withAnimation{
        
        offsets.map{ note[$0]}.forEach(managedObjContext.delete)
        
        DataController().save(context: managedObjContext)
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
