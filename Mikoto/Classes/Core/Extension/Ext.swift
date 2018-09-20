//
//  Ext.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/25.
//

import Foundation

extension CGSize {
	public static func itemSize(area: CGRect, column: Int, row: Int, sectionInsets: UIEdgeInsets, itemSpace: CGFloat, lineSpace: CGFloat) -> CGSize {
		let width = (area.width - sectionInsets.left - sectionInsets.right - (CGFloat(column) - 1) * itemSpace) / CGFloat(column)
		let height = (area.height - sectionInsets.top - sectionInsets.bottom - (CGFloat(row) - 1) * lineSpace) / CGFloat(row) - 1
		return CGSize.init(width: width, height: height)
	}
}
