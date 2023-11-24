//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by KZW on 15/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(user_id: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button{
                                viewModel.delete(id: item.id)
                            }label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "h7hkoDZZ4ucO2xsbmFTc53cXm292")
}
