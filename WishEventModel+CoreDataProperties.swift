//
//  WishEventModel+CoreDataProperties.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//
//

import Foundation
import CoreData


extension WishEventModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishEventModel> {
        return NSFetchRequest<WishEventModel>(entityName: "WishEventModel")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var note: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String?

}

extension WishEventModel : Identifiable {

}
