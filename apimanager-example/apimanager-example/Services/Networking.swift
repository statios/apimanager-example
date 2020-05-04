//
//  Networking.swift
//  apimanager-example
//
//  Created by sogihyeon on 2020/05/03.
//  Copyright © 2020 statios. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

enum APIResult<Value, Error> {
    case success(Value)
    case failure(Error)
    init(value: Value) {
        self = .success(value)
    }
    init(error: Error) {
        self = .failure(error)
    }
}

class Networking {

    static func request<T: Codable>(
        ofType type: T.Type,
        _ endpoint: EndPointType
    ) -> Observable<APIResult<T, FaultInfo>> {
        return requestData(
            endpoint.httpMethod,
            endpoint.url,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: endpoint.headers
        )
            .map { (response, result) -> APIResult<T, FaultInfo> in
                switch response.statusCode {
                case 200...299:
                    let object = try JSONDecoder().decode(type, from: result)
                    return .success(object)
                default:
                    var apiError: FaultInfo
                    do {
                        apiError = try JSONDecoder().decode(FaultInfo.self, from: result)
                    } catch _ {
                        apiError = FaultInfo(message: "Fail", errorCode: "000000")
                    }
                    apiError.statusCode = response.statusCode
                    return .failure(apiError)
                }
            }
    }
}
