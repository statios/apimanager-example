//
//  FaultInfo.swift
//  apimanager-example
//
//  Created by sogihyeon on 2020/05/03.
//  Copyright © 2020 statios. All rights reserved.
//

import Foundation

struct FaultInfo: Codable {
    let message: String
    let errorCode: String
    var statusCode: Int?
}
