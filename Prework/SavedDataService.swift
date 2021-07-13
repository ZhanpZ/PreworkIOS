//
//  SavedService.swift
//  Prework
//
//  Created by Zhanping Zeng on 7/12/21.
//

import Foundation

class SavedDataService: NSObject{
    static func getIsDark() -> Bool{
        let defaults = UserDefaults.standard
        
        return defaults.bool(forKey: "myDark")
    }

    static func getDefaultBill() -> Double{
        let defaults = UserDefaults.standard
        
        return defaults.double(forKey: "myBill")
    }
}
