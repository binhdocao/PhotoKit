//
//  Item.swift
//  PhotoKit
//
//  Created by Binh Do-Cao on 1/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
