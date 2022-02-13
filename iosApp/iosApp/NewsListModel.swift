//
//  NewsListModel.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

final class NewsListModel : ObservableObject {
    @Published var items: [NewsItem] = [NewsItem]()
    
    lazy var store: NewsListStore = {
        let store = NewsListStore()
        store.observeState().collect(collector: collector) { _, _ in}
        return store
    }()
    
    lazy var collector: Collector = {
        return Observer {value in
            if let value = value as? NewsStoreState {
                self.processNews(data: value.news )
            }
            
        }
    }()

    func loadNews() {
        store.refresh(forceLoad: true)
    }
    
    func processNews(data: [NewsItem]) {
        self.items = [NewsItem]()
        self.items.append(contentsOf: data)
    }
}

typealias Collector = Kotlinx_coroutines_coreFlowCollector

final class Observer: Collector {
    func emit(value: Any?, completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
        callback(value)
        completionHandler(KotlinUnit(),nil)
    }
    
    let callback: (Any?)->Void
    
    init(callback: @escaping(Any?)->Void) {
        self.callback = callback
    }
}
