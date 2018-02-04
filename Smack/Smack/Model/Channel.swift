//
//  Channel.swift
//  Smack
//
//  Created by Bari Abdul on 2/3/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
