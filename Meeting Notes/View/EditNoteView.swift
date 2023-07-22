
//  Created by Farial Mahmod on 7/3/23.
//

import SwiftUI


struct EditNoteView: View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var meeting = ""
    
    var note: FetchedResults<Note>.Element
    
    
    var body: some View{
    
        Form{
            
            Section(){
                
                TextField("\(note.name!)", text: $name).onAppear{
                name = note.name!
                }
                
                TextField("\(note.meeting!)", text: $meeting, axis: .vertical).onAppear(){
                    meeting = note.meeting!
                }
                
                HStack{
                    Spacer()
                    
                    Button("Save"){
                        DataController().editNote(note: note, name: name, meeting: meeting, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
