//
//  Extensions.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation
import CoreData

extension Records {
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Records> {
        return NSFetchRequest<Records>(entityName: "Records")
    }
    
    public override func willSave() {
        super.willSave()

        if self.year != Int64(datetime!.year()) {
            self.year = Int64(datetime!.year())
        }

        if self.month != Int64(datetime!.month()) {
            self.month = Int16(datetime!.month())
        }
    }
}

extension Categories {
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }
    
    

    func getAutoIncremenet() -> Int64 {
        let url = self.objectID.uriRepresentation()
        let urlString = url.absoluteString
        if let partialNumber = urlString.components(separatedBy: "/").last {
            let numberPart = partialNumber.replacingOccurrences(of: "p", with: "")
            if let number = Int64(numberPart) {
                return number
            }
        }
        return 0
    }
    
}

extension Accounts {
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Accounts> {
        return NSFetchRequest<Accounts>(entityName: "Accounts")
    }

}
