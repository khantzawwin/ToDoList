//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by KZW on 15/10/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let user_id : String
    
    init(user_id: String) {
        self.user_id = user_id
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(self.user_id)
            .collection("todos")
            .document(id)
            .delete()
    }
}
