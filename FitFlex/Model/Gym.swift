//
//  Gym.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import Foundation

struct Gym: Codable {
    let name, description, muscleGroup,img: String?

    enum CodingKeys: String, CodingKey {
        case name, description, img
        case muscleGroup = "muscle_group"
    }
}
