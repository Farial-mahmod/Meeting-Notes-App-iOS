//  Created by Farial Mahmod on 5/20/23.

import SwiftUI

// this indicates the starting point (main) of the app
@main

struct TestApp: App{
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene{
        WindowGroup{
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
    
    
}
