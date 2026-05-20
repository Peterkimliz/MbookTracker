//
//  Book.swift
//  MyBookTracker
//
//  Created by Apple on 20/05/2026.
//

import SwiftUI
import SwiftData

@Model
class Book{
    var title:String
    var author:String
    var summary:String
    var rating:Int?
    var dateAdded:Date
    var dateStarted:Date
    var dateCompleted:Date
    var status:Status
    
    
    init(
        title: String,
        author: String,
        summary: String="",
        rating: Int? = nil,
        dateAdded: Date=Date.now,
        dateStarted: Date=Date.distantPast,
        dateCompleted:Date=Date.distantPast,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.summary = summary
        self.rating = rating
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.status = status
    }
    
    var icon : Image{
        switch status {
        case .onShelf:
           Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
          Image(systemName: "book.fill")
        case .completed:
           Image(systemName: "cbooks.vertical.fill")
        }
    }
    
}


enum Status:Int ,Codable ,Identifiable,CaseIterable{
    
    case onShelf, inProgress,completed
    
    var id:Self{
        self
    }
    
    var description:String {
        switch self {
        case .onShelf:
            "On Shelf"
        case .inProgress:
            "In Progress"
        case .completed:
            "Completed"
        }
        
    }
    
}
