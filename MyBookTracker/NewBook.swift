//
//  NewBook.swift
//  MyBookTracker
//
//  Created by Apple on 20/05/2026.
//

import SwiftUI
import SwiftData
struct NewBook: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title:String=""
    @State private var author:String=""
    
    var body: some View {
        Form {
            
            TextField(text: $title) {
                Text("Title")
            }
            TextField(text: $author) {
                Text("Author")
            }
            
            Button {
                let book=Book(title: title, author: author)
                context.insert(book)
                do{
                    try context.save()
                    dismiss()
                    
                }catch{
                    print("Error That happened is \(error)")
                }
 
            } label: {
                Text("Add Book ")
            }
            .disabled(title.isEmpty||author.isEmpty)
            .frame(maxWidth: .infinity,alignment: .trailing)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(ButtonBorderShape.roundedRectangle(radius: 10))

            
        }
        .navigationTitle("New Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem (placement: .cancellationAction){
                Image(systemName: "xmark")
                    .imageScale(.small)
            }
        }
    }
}

#Preview {
    NavigationStack{
    
        NewBook()
    }
}
