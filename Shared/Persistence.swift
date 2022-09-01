//
//  Persistence.swift
//  CoreDataSwiftUI4Fun
//
//  Created by Nayrouz, Samuel on 9/1/22.
//

import Foundation
import CoreData
import CloudKit

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "CoreDataSwiftUI4Fun")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { NSPersistentStoreDescription, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        })
    }
}
