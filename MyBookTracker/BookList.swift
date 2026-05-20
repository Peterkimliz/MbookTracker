//
//  ContentView.swift
//  MyBookTracker
//
//  Created by Apple on 20/05/2026.
//

import SwiftUI
import SwiftData
struct BookList: View {
    @Query(sort:\Book.title) private var books:[Book]
    @State private var showSheet:Bool=false
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        NavigationStack{
            
            Group{
                
                if(books.isEmpty){
                    ContentUnavailableView("No books found", systemImage: "book.fill")
                    
                }
                else{
                    List{
                        ForEach(books) { book in
                            NavigationLink {
                                Text(book.title)
                            } label: {
                                HStack{
                                    book.icon
                                    
                                    VStack(alignment: .leading){
                                        Text(book.title)
                                            .font(.title2)
                                        Text(book.author)
                                            .foregroundStyle(.secondary)
                                        
                                        if let rating=book.rating{
                                            HStack{
                                                ForEach(1..<rating,id:\.self){inde in
                                                    Image(systemName: "star.fill")
                                                        .imageScale(.small)
                                                        .foregroundStyle(.yellow)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                            }
                            
                        }.onDelete { IndexSet in
                            IndexSet.forEach { index in
                                let book=books[index]
                                context.delete(book)
                                do{
                                    try context.save()
                                }catch{
                                    print("Error occurred is\(error)")
                                }
                            }
                        }
                        
                    }
                }
                
                
                
                
            }
            .listStyle(.plain)
            .navigationTitle("My Books")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showSheet=true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                    
                }
            }.sheet(isPresented: $showSheet) {
                NewBook()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                
            }
            
            
            
        }
        
        
    }}


#Preview {
    BookList()
}
