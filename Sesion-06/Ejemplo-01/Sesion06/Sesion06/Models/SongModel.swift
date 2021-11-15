//
//  SongModel.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 15/11/21.
//

import Foundation

struct SongModel: Codable {
    var artist:String?
    //var duration:Int?
    var genre:String?
    var name:String?
    var songId:String?
    
    enum CodingKeys: String, CodingKey {
        case artist
        //case duration
        case genre
        case name
        case songId = "song_id"
    }
}
