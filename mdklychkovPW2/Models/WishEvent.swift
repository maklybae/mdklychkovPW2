//
//  WishEventModel.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.12.2024.
//

import Foundation
import CoreData

@objc(WishEventModel)
public class WishEventModel: NSManagedObject {

}

extension WishEventModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishEventModel> {
        return NSFetchRequest<WishEventModel>(entityName: "WishEventModel")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var note: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String?

}

extension WishEventModel: Identifiable {

}
