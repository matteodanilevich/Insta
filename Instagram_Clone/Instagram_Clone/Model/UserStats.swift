//
//  Stats.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/31/22.
//

import Foundation

//MARK: UserStats Struct
struct UserStats: Decodable {
    
    var following: Int
    var followers: Int
    var posts: Int
}
