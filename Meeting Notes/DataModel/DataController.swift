// datamodelcontroller

//
//  DataModelController.swift
//  TEST
//
//  Created by Farial Mahmod on 7/3/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        
        container.loadPersistentStores(completionHandler: ){ description, error in
            if let error = error{
                print("\(error.localizedDescription)")
            }
            
        }
        
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
        }
        
        catch{
            print("Could not save.")
        }
    }
    
    func addNote(context: NSManagedObjectContext, name: String, meeting: String){
        let note = Note(context: context)
        note.id = UUID()
        note.name = name
        note.meeting = meeting
        note.date = Date()
        
        save(context: context)
        
    }
    
    func editNote(note: Note, name: String, meeting: String, context: NSManagedObjectContext){
        note.date = Date()
        note.name = name
        note.meeting = meeting
        save(context: context)
    }
    
}
