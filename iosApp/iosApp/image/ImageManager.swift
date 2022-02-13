//
//  ImageStorage.swift
//  iosApp
//
//  Created by Kirill Presnyakov on 13.02.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SDWebImage

final class ImageManager {
    static let sharedInstance = ImageManager()
    
    private init() {}
    
    deinit {
        SDImageCache.shared.clearMemory()
    }
    
    func setImage(toImageView: UIImageView?, forKey: String) {
        if let image = getImageByKey(forKey) {
            toImageView?.image = image
        } else {
            weak var distanceImageView = toImageView
            SDWebImageDownloader.shared.downloadImage(with: URL(string: forKey), options: SDWebImageDownloaderOptions.lowPriority, progress: nil) { [weak self]
                (image, error, cacheType, imageURL) in
                guard let image = image else {
                    return
                }
                distanceImageView?.image = image
                self?.saveImageWithKey(image.pngData(), forKey)
            }
        }
    }
    
    func receiveImage(forKey: String, action:@escaping(UIImage)->Void) {
        if let image = getImageByKey(forKey) {
            action(image)
        } else {
            SDWebImageDownloader.shared.downloadImage(with: URL(string: forKey), options: SDWebImageDownloaderOptions.lowPriority, progress: nil) { [weak self]
                (image, error, cacheType, imageURL) in
                guard let image = image else {
                    return
                }
                action(image)
                self?.saveImageWithKey(image.pngData(), forKey)
            }
        }
    }
    
    private func saveImageWithKey(_ imageData: Data?, _ imageKey: String) {
        SDImageCache.shared.storeImageData(toDisk: imageData, forKey: imageKey)
    }
    
    private func getImageByKey(_ imageKey: String) -> UIImage? {
        return SDImageCache.shared.imageFromDiskCache(forKey: imageKey)
    }
    
    func cleanDisk() {
        SDImageCache.shared.clearDisk {
            
        }
    }
}

