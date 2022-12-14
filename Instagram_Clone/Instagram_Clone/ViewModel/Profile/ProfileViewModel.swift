//
//  ProfileViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class ProfileViewModel: ObservableObject {

    @Published var user: User

    init(user: User) {
        self.user = user
        checkFollowing()
        checkStats()
    }

    //MARK: New image load
    func loadNewProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let uid = user.id else { return }
        
        ImageUploader.imageUpload(image: image, type: .profile) { imageURL in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.user.profileImageURL = imageURL
            }
        }
    }
    
    //MARK: Follow user
    func followUser() {
        
        guard let userID = user.id else { return }
        
        UserAction.followUser(uid: userID) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            NotificationViewModel.sendNotification(withUID: userID, type: .follow)
            
            self.user.didFollowUser = true
        }
    }
    
    //MARK: Unfollow User
    func unfollowUser() {
        
        guard let userID = user.id else { return }
        
        UserAction.unfollowUser(uid: userID) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        
        self.user.didFollowUser = false
    }
    
    //MARK: Follow check
    func checkFollowing() {
        
        guard let userID = user.id, !user.isCurrentUser else { return }
        
        UserAction.checkFollowing(userID: userID) { didFollow in
            self.user.didFollowUser = didFollow
        }
    }
    
    //MARK: User stats check 
    func checkStats() {
        
        guard let userID = user.id else { return }
        
        Firestore.firestore().collection("followers").document(userID).collection("user_followers").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let followers = snapshot?.documents.count else { return }
            
            Firestore.firestore().collection("following").document(userID).collection("user_following").getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let following = snapshot?.documents.count else { return }
                
                Firestore.firestore().collection("posts").whereField("ownerUID", isEqualTo: userID).getDocuments { snapshot, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user.stats = UserStats(following: following, followers: followers, posts: posts)
                }
            }
        }
    }
}
