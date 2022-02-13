//
//  NewsItemRow.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NewsItemRow: View {
    @State var item: NewsItem
    
    var body: some View {
        HStack(alignment: .top) {
            ThumbImage(url: item.urlToImage ?? "").frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 7) {
                Text(item.title ?? "").lineLimit(4).textTitle()
                Text(item.description ).lineLimit(4).subtextTitle()
                Text(item.publishedAt).smallTitle()
            }
        }.background(Color.white)
    }
}
