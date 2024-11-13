//
//  NewsViewModel.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import Foundation

protocol NewsViewModelDelegate {
    func onFailFetchNewsData()
    func onSuccessFetchNewsData()
}
class NewsViewModel {
    
    var news: [News] = []
    var delegate: NewsViewModelDelegate?
    
    init() {
        NetworkHelper.shared.delegate = self
    }
    
    func fetchNewsData() {
        NetworkHelper.shared.fetchNewsData()
    }
}

extension NewsViewModel: NetworkHelperDelegate {
    func onFailFetchNewsData(_ error: any Error) {
        self.delegate?.onFailFetchNewsData()
    }
    
    func onSuccessFetchNewsData(news: [News]) {
        self.news = news
        self.delegate?.onSuccessFetchNewsData()
    }
}
