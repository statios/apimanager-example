//
//  BoxOffice.swift
//  apimanager-example
//
//  Created by sogihyeon on 2020/05/03.
//  Copyright © 2020 statios. All rights reserved.
//

import Foundation
struct BoxOffice: Codable {
    let boxOfficeResult: BoxOfficeResult
    struct BoxOfficeResult: Codable {
        let boxofficeType: String
        let showRange: String
        let dailyBoxOfficeList: [DailyBoxOfficeList]
        struct DailyBoxOfficeList: Codable {
            let rnum: String
            let rank: String
            let rankInten: String
            let rankOldAndNew: String
            let movieCd: String
            let movieNm: String
            let openDt: String
            let salesAmt: String
            let salesShare: String
            let salesInten: String
            let salesChange: String
            let salesAcc: String
            let audiCnt: String
            let audiInten: String
            let audiChange: String
            let audiAcc: String
            let scrnCnt: String
            let showCnt: String
        }
    }
}
