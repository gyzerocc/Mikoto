//
//  UIImage+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/8.
//

import UIKit

public extension UIImage {
	
	public func thumbnailImage(imageURL: URL, pointSize: CGSize) -> UIImage {
		let sourceOpt = [kCGImageSourceShouldCache : false] as CFDictionary
		// 其他场景可以用createwithdata (data并未decode,所占内存没那么大),
		let source = CGImageSourceCreateWithURL(imageURL as CFURL, sourceOpt)!
		
		let maxDimension = max(pointSize.width, pointSize.height)
		let downsampleOpt = [kCGImageSourceCreateThumbnailFromImageAlways : true,
							 kCGImageSourceShouldCacheImmediately : true ,
							 kCGImageSourceCreateThumbnailWithTransform : true,
							 kCGImageSourceThumbnailMaxPixelSize : maxDimension] as CFDictionary
		let downsampleImage = CGImageSourceCreateThumbnailAtIndex(source, 0, downsampleOpt)!
		return UIImage(cgImage: downsampleImage)
	}
    
    public class func create(_ color: UIColor) -> UIImage? {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public class func create(_ view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func scale(_ size: CGSize) -> UIImage? {
        let imageSize = self.size
        let width = imageSize.width
        let height = imageSize.height
        
        let widthFactor = size.width/width
        let heightFactor = size.height/height
        let scaleFactor = (widthFactor < heightFactor) ? widthFactor : heightFactor
        
        let scaledWidth = width * scaleFactor
        let scaledHeight = height * scaleFactor
        let targetSize = CGSize(width: scaledWidth, height: scaledHeight)
        
        UIGraphicsBeginImageContext(targetSize)
        draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
}
