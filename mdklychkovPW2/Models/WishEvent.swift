//
//  WishEventModel.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.12.2024.
//

import Foundation
import CoreData

@objc(WishEvent)
public class WishEvent: NSManagedObject {

}

extension WishEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishEvent> {
        return NSFetchRequest<WishEvent>(entityName: "WishEvent")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var note: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String?

}

extension WishEvent: Identifiable {

}
