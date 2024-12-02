//
//  CoreDataManager.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

 import Foundation
 import CoreData

 struct CoreDataManager {

    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()

    // MARK: - CRUD Operations
    
    @discardableResult
    func createWishEvent(title: String, note: String?, startDate: Date?, endDate: Date?) -> WishEvent? {
        let context = persistentContainer.viewContext
        let wishEvent = WishEvent(context: context)

        wishEvent.title = title
        wishEvent.note = note
        wishEvent.startDate = startDate
        wishEvent.endDate = endDate

        do {
            try context.save()
            return wishEvent
        } catch let error {
            print("Failed to create: \(error)")
        }

        return nil
    }

    func fetchWishEvents() -> [WishEvent]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WishEvent>(entityName: "WishEvent")

        do {
            return try context.fetch(fetchRequest)
        } catch let error {
            print("Failed to fetch: \(error)")
        }

        return nil
    }

    func fetchWishEvent(withTitle title: String) -> WishEvent? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WishEvent>(entityName: "WishEvent")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)

        do {
            return try context.fetch(fetchRequest).first
        } catch let error {
            print("Failed to fetch: \(error)")
        }

        return nil
    }

    func updateWishEvent(wishEvent: WishEvent, newTitle: String?, newNote: String?, newStartDate: Date?, newEndDate: Date?) {
        let context = persistentContainer.viewContext

        if let newTitle = newTitle {
            wishEvent.title = newTitle
        }
        if let newNote = newNote {
            wishEvent.note = newNote
        }
        if let newStartDate = newStartDate {
            wishEvent.startDate = newStartDate
        }
        if let newEndDate = newEndDate {
            wishEvent.endDate = newEndDate
        }

        do {
            try context.save()
        } catch let error {
            print("Failed to update: \(error)")
        }
    }

    func deleteWishEvent(wishEvent: WishEvent) {
        let context = persistentContainer.viewContext
        context.delete(wishEvent)

        do {
            try context.save()
        } catch let error {
            print("Failed to delete: \(error)")
        }
    }
 }
