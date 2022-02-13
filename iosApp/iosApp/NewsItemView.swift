//
//  NewsItemView.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NewsItemView: View {
    @State var item: NewsItem
    
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        CachedImage(url: item.urlToImage ?? "")
                        Text(item.title ?? "").largeTitle()
                        Text(item.publishedAt).smallTitle()
                        Text(item.content ?? "").subtextTitle()
                        Button {
                            UIApplication.shared.open(URL(string: item.url ?? "")!, options: [:], completionHandler: nil)
                        } label: {
                            Text("Show more").smallTitle()
                        }
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }.navigationBarItems(leading:  Color.blue.frame(width: 40, height: 40, alignment: .topLeading))
            }
        }
    }
}
