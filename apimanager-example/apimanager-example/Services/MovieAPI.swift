//
//  MovieAPI.swift
//  apimanager-example
//
//  Created by sogihyeon on 2020/05/03.
//  Copyright © 2020 statios. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: String { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
}

enum MovieAPI {
    case boxOffice
}

extension MovieAPI: EndPointType {
    var baseURL: String {
        return "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
    }
    
    var path: String {
        switch self {
        case .boxOffice: return "/boxoffice/searchDailyBoxOfficeList.json?key=403267fb36774011a7e1e4d4c5defcfe&targetDt=20200502"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .boxOffice: return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default: return nil
        }
    }
    
    var url: String {
        return self.baseURL + self.path
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        default: return nil
        }
    }
    
    
}
