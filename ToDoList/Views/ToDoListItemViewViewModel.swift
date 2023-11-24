//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by KZW on 15/10/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class ToDoListItemViewViewModel: ObservableObject{
    init() { }
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
        
    }
}
