//
//  NotificationCellViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/1/22.
//

import SwiftUI
import Firebase

class NotificationCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        userFetch()
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    func userFetch() {
        Firestore.firestore().collection("users").document(notification.uid).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
}
