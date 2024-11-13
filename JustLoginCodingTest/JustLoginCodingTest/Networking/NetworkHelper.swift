//
//  NetworkHelper.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import Foundation
import Alamofire

protocol NetworkHelperDelegate {
    func onSuccessFetchNewsData(news: [News])
    func onFailFetchNewsData(_ error: Error)
}

class NetworkHelper {
    static let shared = NetworkHelper()
    static let baseURL = "https://jsonplaceholder.org/posts"
    var delegate: NetworkHelperDelegate?
    
    func fetchNewsData() {
        let url = "\(NetworkHelper.baseURL)"
        
        AF.request(url,
                   method: .get,
                   headers: ["Content-Type": "application/json"])
        .validate()
        .responseDecodable(of: [News].self) { [weak self] response in
            switch response.result {
            case .success(let news):
                self?.delegate?.onSuccessFetchNewsData(news: news)
            case .failure(let error):
                print(error)
                self?.delegate?.onFailFetchNewsData(error)
            }
        }
    }
}
