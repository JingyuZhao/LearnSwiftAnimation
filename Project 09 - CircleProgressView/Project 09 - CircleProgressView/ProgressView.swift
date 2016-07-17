//
//  CircleProgressView.swift
//  Project 09 - CircleProgressView
//
//  Created by 陈炯 on 16/7/17.
//  Copyright © 2016年 Jiong. All rights reserved.
//

import UIKit

@IBDesignable class ProgressView: UIView {
    
    struct Constant {
        
        //MARK: 进度条宽度
        static let lineWidth: CGFloat = 20
        //MARK: 轨道颜色
        static let trackColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        //MARK: 进度条颜色
        static let progressColor = UIColor(red: 0.42, green: 0.80, blue: 0.98, alpha: 1.00)
    }
    
    //MARK: 进度槽
    let trackLayer = CAShapeLayer()
    //MARK: 进度条
    let progressLayer = CAShapeLayer()
    //MARK: 路径
    let path = UIBezierPath()
    
    @IBInspectable var progress: Int = 0 {
        didSet {
            if progress > 100 {
                
                progress = 100
                
            } else if progress < 0 {
                
                progress = 0
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        
        path.addArcWithCenter(CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds)),
            radius: bounds.size.width / 2 - Constant.lineWidth,
            startAngle: CGFloat(-90 / Double(180.0) * M_PI), endAngle: CGFloat(270 / Double(180.0) * M_PI), clockwise: true)
        
        //MARK: 绘制进度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clearColor().CGColor
        trackLayer.strokeColor = Constant.trackColor.CGColor
        trackLayer.lineWidth = Constant.lineWidth
        trackLayer.path = path.CGPath
        layer.addSublayer(trackLayer)
        
        //MARK: 绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.strokeColor = Constant.progressColor.CGColor
        progressLayer.lineWidth = Constant.lineWidth
        progressLayer.path = path.CGPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress) / 100.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(pro: Int, aimated animate: Bool, withDuration duration: Double) -> Void {
        
        progress = pro
        
        CATransaction.begin()
        CATransaction.setDisableActions(!animate)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(duration)
        progressLayer.strokeEnd = CGFloat(progress) / 100.0
        CATransaction.commit()
        
    }
    
    
}
