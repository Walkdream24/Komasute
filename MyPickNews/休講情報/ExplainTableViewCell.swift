//
//  ExplainTableViewCell.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class ExplainTableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width*3, height: scrollView.frame.size.height)
        pageControl.numberOfPages = 3
        let imageView1 = createImageView(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "image1")
        scrollView.addSubview(imageView1)
        
        let imageView2 = createImageView(x: scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "image2")
        scrollView.addSubview(imageView2)
        
        let imageView3 = createImageView(x: scrollView.frame.size.width*2, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "image3")
        scrollView.addSubview(imageView3)
    }
    
    
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        return imageView
    }
}
extension ExplainTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
