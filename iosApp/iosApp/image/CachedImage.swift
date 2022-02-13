//
//  CachedImage.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct CachedImage: View {
    @ObservedObject var model: ImageLoader
    
    init(url: String) {
        model = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: model.image).resizable().scaledToFill().onAppear {
            model.load()
        }
    }
}

struct ThumbImage: View {
    @ObservedObject var model: ImageLoader
    @State var size: CGFloat = 100
    
    init(url: String) {
        model = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: model.image).resizable().resizable().aspectRatio(contentMode: .fill).frame(width: size, height: size, alignment: .center).clipped().onAppear {
            model.load()
        }
    }
}

final class ImageLoader : ObservableObject {
    @Published var image: UIImage = UIImage()
    
    var url: String = ""
    
    init(urlString: String) {
        self.url = urlString
    }
    
    func load() {
        ImageManager.sharedInstance.receiveImage(forKey: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
