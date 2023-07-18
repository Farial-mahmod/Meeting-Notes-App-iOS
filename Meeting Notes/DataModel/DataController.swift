import Foundation
import CoreData

class DataController: ObservableObject {

// the container variable below connects to the Data Model
let container = NSPersistentContainer(name: "NotesModel")

 init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }

  // to store or save data with NSManagedObjectContext
  func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved successfully.")
        } catch {
            // to display if errors rise up
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    

  

}
