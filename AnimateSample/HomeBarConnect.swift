//
//  HomeBarConnect.swift
//  smartmixer
//
//  Created by YaoJunguang on 16/5/27.
//  Copyright © 2016年 smarthito. All rights reserved.
//

import UIKit



enum HomeBarManageState:Int{
    case unsupport = 0;//不支持
    case disabled = 1;//蓝牙未开
    case scanning = 2;//正在搜索
    case connecting = 3;//正在连接
    case connected = 4;
}

class HomeBarConnect: UIView {
    
    // 定义的线条宽度
    let lineWidth:CGFloat = 2.0
    //定义的灰度背景
    let lightGrayBackground = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1.000)
    //灰色线条颜色
    let grayStrokeColor = UIColor(red: 0.521, green: 0.521, blue: 0.521, alpha: 1.000)
    
    var unsupportSateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            
            let linePath = UIBezierPath()
            linePath.moveToPoint(CGPointMake(26.16, 26.16))
            linePath.addLineToPoint(CGPointMake(133.84, 133.84))
            
            let lineLayer = CAShapeLayer()
            lineLayer.lineWidth = lineWidth
            lineLayer.path = linePath.CGPath
            lineLayer.strokeColor = UIColor(red: 0.521, green: 0.521, blue: 0.521, alpha: 1.000).CGColor
            lineLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(lineLayer)
            
            let viewPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 160, 160))
            let viewPathLayer = CAShapeLayer()
            viewPathLayer.lineWidth = lineWidth
            viewPathLayer.fillColor = lightGrayBackground.CGColor
            viewPathLayer.path = viewPath.CGPath
            viewPathLayer.strokeColor = UIColor(red: 0.521, green: 0.521, blue: 0.521, alpha: 1.000).CGColor
            viewPathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(viewPathLayer)
            
            return layers
        }
    }
    
    // 蓝牙未开的图标
    var disabledStateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.moveToPoint(CGPointMake(66, 64.29))
            shapePath.addLineToPoint(CGPointMake(96, 94.29))
            shapePath.addLineToPoint(CGPointMake(80.29, 110))
            shapePath.addLineToPoint(CGPointMake(80.29, 50))
            shapePath.addLineToPoint(CGPointMake(96, 65.71))
            shapePath.addLineToPoint(CGPointMake(66, 95.71))
            let shapePathLayer = CAShapeLayer()
            shapePathLayer.lineWidth = lineWidth
            shapePathLayer.lineCap = kCALineCapRound
            shapePathLayer.lineJoin = kCALineJoinRound
            shapePathLayer.strokeColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.000).CGColor
            shapePathLayer.fillColor = nil
            shapePathLayer.autoreverses = false;
            shapePathLayer.path = shapePath.CGPath
            shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(shapePathLayer)
            
            let viewPath = UIBezierPath(ovalInRect: CGRectMake(2, 2, 156, 156))
            let viewPathLayer = CAShapeLayer()
            viewPathLayer.fillColor = lightGrayBackground.CGColor
            viewPathLayer.path = viewPath.CGPath
            viewPathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(viewPathLayer)
            
            return layers
        }
    }
    
    // 蓝牙未开的动效
    var  disabledAnimateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            let slicePathLayer = CAShapeLayer()
            
            let slicePath1 = UIBezierPath()
            slicePath1.moveToPoint(CGPointMake(5, 16))
            slicePath1.addLineToPoint(CGPointMake(23.5, 0))
            slicePath1.addLineToPoint(CGPointMake(41, 16))
            let slicePathLayer1 = CAShapeLayer()
            
            slicePathLayer1.lineWidth = lineWidth
            slicePathLayer1.lineCap = kCALineCapRound
            slicePathLayer1.lineJoin = kCALineJoinRound
            slicePathLayer1.strokeColor = UIColor.joRedColor().CGColor
            slicePathLayer1.fillColor = nil
            slicePathLayer1.autoreverses = false;
            slicePathLayer1.path = slicePath1.CGPath
            slicePathLayer.addSublayer(slicePathLayer1)
            
            let slicePath2 = UIBezierPath()
            slicePath2.moveToPoint(CGPointMake(23.5, 0))
            slicePath2.addLineToPoint(CGPointMake(23.5, 60))
            let slicePathLayer2 = CAShapeLayer()
            
            slicePathLayer2.lineWidth = lineWidth
            slicePathLayer2.lineCap = kCALineCapRound
            slicePathLayer2.lineJoin = kCALineJoinRound
            slicePathLayer2.strokeColor = UIColor.joRedColor().CGColor
            slicePathLayer2.fillColor = nil
            slicePathLayer2.autoreverses = false;
            slicePathLayer2.path = slicePath2.CGPath
            slicePathLayer.addSublayer(slicePathLayer2)
            
            slicePathLayer.frame = CGRect(x: (self.frame.width - 46)/2, y: self.frame.height - 60, width: 46, height: 40)
            
            let currentStateAnimateKey = "transform.translation.y"
            
            let animate = CABasicAnimation(keyPath: currentStateAnimateKey)
            animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animate.fromValue = 40;
            animate.toValue = 0;
            animate.duration = 1.4;
            animate.repeatCount = HUGE;
            animate.removedOnCompletion = false;
            slicePathLayer.addAnimation(animate, forKey: currentStateAnimateKey)
            
            layers.append(slicePathLayer)
            
            return layers
        }
    }
    
    // 扫描的状态图层
    var scanStateLayer:[CAShapeLayer]{
        var layers = [CAShapeLayer]()
        
        //// Shape Drawing
        let shapePath = UIBezierPath()
        shapePath.moveToPoint(CGPointMake(66, 64.29))
        shapePath.addLineToPoint(CGPointMake(96, 94.29))
        shapePath.addLineToPoint(CGPointMake(80.29, 110))
        shapePath.addLineToPoint(CGPointMake(80.29, 50))
        shapePath.addLineToPoint(CGPointMake(96, 65.71))
        shapePath.addLineToPoint(CGPointMake(66, 95.71))
        let shapePathLayer = CAShapeLayer()
        shapePathLayer.lineWidth = lineWidth
        shapePathLayer.lineCap = kCALineCapRound
        shapePathLayer.lineJoin = kCALineJoinRound
        shapePathLayer.strokeColor = UIColor.joRedColor().CGColor
        shapePathLayer.fillColor = nil
        shapePathLayer.autoreverses = false;
        shapePathLayer.path = shapePath.CGPath
        shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
        layers.append(shapePathLayer)
        
        let viewPath = UIBezierPath(ovalInRect: CGRectMake(2, 2, 156, 156))
        let viewPathLayer = CAShapeLayer()
        viewPathLayer.fillColor = lightGrayBackground.CGColor
        viewPathLayer.path = viewPath.CGPath
        viewPathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
        layers.append(viewPathLayer)
        return layers
    }
    
    // 扫描的动效图层
    var scanAnimateLayer:[CAShapeLayer]{
        var layers = [CAShapeLayer]()
        
        let rotationLayer = CAShapeLayer()
        rotationLayer.lineWidth = lineWidth
        rotationLayer.lineCap = kCALineCapRound
        rotationLayer.lineJoin = kCALineJoinRound
        rotationLayer.strokeColor = UIColor.joRedColor().CGColor
        rotationLayer.fillColor = nil
        rotationLayer.autoreverses = false;
        rotationLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
        
        let pathRotate = UIBezierPath(arcCenter: CGPointMake(80,80), radius: 80, startAngle: CGFloat(M_PI_4), endAngle: CGFloat(2*M_PI+M_PI_4), clockwise: true)
        
        rotationLayer.path = pathRotate.CGPath
        rotationLayer.strokeStart = 1
        
        let strokeStart = CABasicAnimation(keyPath: "strokeStart")
        strokeStart.toValue = 0.375
        strokeStart.beginTime = CACurrentMediaTime() + 0.5
        strokeStart.duration = 0.1
        strokeStart.fillMode = kCAFillModeForwards//kCAFillModeForwards
        strokeStart.removedOnCompletion = false
        rotationLayer.addAnimation(strokeStart, forKey: "strokeStart")
        
        /**/
        let currentStateAnimateKey = "transform.rotation.z"
        let animate = CABasicAnimation(keyPath: currentStateAnimateKey)
        animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animate.fromValue = 2*M_PI;
        animate.toValue = 0;
        animate.duration = 2;
        animate.repeatCount = HUGE;
        animate.beginTime = CACurrentMediaTime() + 0.6
        animate.removedOnCompletion = false;
        animate.fillMode = kCAFillModeForwards
        rotationLayer.addAnimation(animate, forKey: currentStateAnimateKey)
        
        /**/
        layers.append(rotationLayer)
        return layers
    }
    
    //连接中的状态的图标
    var connectStateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            let viewPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 160, 160))
            let viewPathLayer = CAShapeLayer()
            viewPathLayer.lineWidth = lineWidth
            viewPathLayer.fillColor = lightGrayBackground.CGColor
            viewPathLayer.path = viewPath.CGPath
            viewPathLayer.strokeColor = UIColor.joRedColor().CGColor
            viewPathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(viewPathLayer)
            return layers
        }
    }
    
    
    // 正在连接的动画
    var connectAnimateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            let wavePath = UIBezierPath()
            wavePath.moveToPoint(CGPointMake(2, 81.64))
            wavePath.addLineToPoint(CGPointMake(41.29, 81.64))
            wavePath.addCurveToPoint(CGPointMake(50.93, 93.42), controlPoint1: CGPointMake(45.39, 81.64), controlPoint2: CGPointMake(49.17, 86.18))
            wavePath.addLineToPoint(CGPointMake(50.93, 93.42))
            wavePath.addCurveToPoint(CGPointMake(58.49, 93.3), controlPoint1: CGPointMake(52.5, 99.6), controlPoint2: CGPointMake(57.04, 99.53))
            wavePath.addLineToPoint(CGPointMake(59.5, 89.08))
            wavePath.addCurveToPoint(CGPointMake(69.83, 89.9), controlPoint1: CGPointMake(61.57, 80.32), controlPoint2: CGPointMake(68.06, 80.83))
            wavePath.addLineToPoint(CGPointMake(70.27, 92.29))
            wavePath.addCurveToPoint(CGPointMake(79.09, 91.22), controlPoint1: CGPointMake(71.84, 100.67), controlPoint2: CGPointMake(78.02, 99.91))
            wavePath.addLineToPoint(CGPointMake(81.98, 66.97))
            wavePath.addCurveToPoint(CGPointMake(89.61, 66.34), controlPoint1: CGPointMake(82.87, 59.35), controlPoint2: CGPointMake(88.41, 58.9))
            wavePath.addLineToPoint(CGPointMake(91.69, 79.13))
            wavePath.addCurveToPoint(CGPointMake(100.5, 80.64), controlPoint1: CGPointMake(93.01, 87), controlPoint2: CGPointMake(98.55, 87.94))
            wavePath.addLineToPoint(CGPointMake(100.5, 80.64))
            wavePath.addCurveToPoint(CGPointMake(106.3, 80.13), controlPoint1: CGPointMake(101.7, 76.23), controlPoint2: CGPointMake(104.91, 75.91))
            wavePath.addLineToPoint(CGPointMake(107.06, 82.46))
            wavePath.addCurveToPoint(CGPointMake(115.18, 91.03), controlPoint1: CGPointMake(108.88, 87.82), controlPoint2: CGPointMake(111.91, 91.03))
            wavePath.addLineToPoint(CGPointMake(156, 91.03))
            
            let stransformLayer = CAShapeLayer()
            
            stransformLayer.lineWidth = lineWidth
            stransformLayer.lineCap = kCALineCapRound
            stransformLayer.lineJoin = kCALineJoinRound
            stransformLayer.strokeColor = UIColor.joRedColor().CGColor
            stransformLayer.fillColor = nil
            stransformLayer.autoreverses = false;
            stransformLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            
            stransformLayer.path = wavePath.CGPath
            stransformLayer.strokeStart = 0.5
            stransformLayer.strokeEnd = 0.5
            
            let animateStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            animateStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            animateStrokeStart.fromValue = 0.5;
            animateStrokeStart.toValue = 0.15;
            animateStrokeStart.duration = 1;
            animateStrokeStart.repeatCount = HUGE;
            animateStrokeStart.beginTime = CACurrentMediaTime() + 0.2
            animateStrokeStart.removedOnCompletion = false;
            animateStrokeStart.fillMode = kCAFillModeForwards
            stransformLayer.addAnimation(animateStrokeStart, forKey: "strokeStart")
            
            let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
            strokeEndAnimate.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEndAnimate.fromValue = 0.5;
            strokeEndAnimate.toValue = 0.85;
            strokeEndAnimate.duration = 1;
            strokeEndAnimate.repeatCount = HUGE;
            strokeEndAnimate.beginTime = CACurrentMediaTime() + 0.2
            strokeEndAnimate.removedOnCompletion = false;
            strokeEndAnimate.fillMode = kCAFillModeForwards
            stransformLayer.addAnimation(strokeEndAnimate, forKey: "strokeEnd")
            
            
            layers.append(stransformLayer)
            return layers
        }
    }
    
    var okStateLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            let okPath = UIBezierPath()
            okPath.moveToPoint(CGPointMake(13, 38))
            okPath.addLineToPoint(CGPointMake(71.42, 107))
            okPath.addLineToPoint(CGPointMake(115, 53))
            let okLayer = CAShapeLayer()
            okLayer.lineWidth = lineWidth
            okLayer.lineCap = kCALineCapRound
            okLayer.lineJoin = kCALineJoinRound
            okLayer.strokeColor = UIColor.joRedColor().CGColor
            okLayer.fillColor = nil
            okLayer.autoreverses = false;
            okLayer.path = okPath.CGPath
            okLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            okLayer.strokeStart = 0.3
            okLayer.strokeEnd = 1
            layers.append(okLayer)
            
            let viewPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 160, 160))
            let viewPathLayer = CAShapeLayer()
            viewPathLayer.lineWidth = lineWidth
            viewPathLayer.fillColor = lightGrayBackground.CGColor
            viewPathLayer.path = viewPath.CGPath
            viewPathLayer.strokeColor = UIColor.joRedColor().CGColor
            viewPathLayer.frame = CGRect(x: (self.frame.width - 160)/2, y: (self.frame.height - 160)/2, width: 160, height: 160)
            layers.append(viewPathLayer)
            
            return layers
        }
    }
    
    
    // 蓝牙未开到正在扫描的过度
    var disable2ScanTransformLayer:[CAShapeLayer]{
        get{
            
            var layers = [CAShapeLayer]()
            
            //首先隐藏向上滑动的 0~0.2
            animateLayers[0].removeAllAnimations()
            animateLayers[0].removeFromSuperlayer()
            
            //从上滑到扫描的路劲变化
            let disable2scanPath = UIBezierPath()
            disable2scanPath.moveToPoint(CGPointMake(0, 80))
            disable2scanPath.addCurveToPoint(CGPointMake(80, 0),
                                             controlPoint1: CGPointMake(0, 35.82),
                                             controlPoint2: CGPointMake(35.82, 0))
            disable2scanPath.addCurveToPoint(CGPointMake(160, 80),
                                             controlPoint1: CGPointMake(124.18, 0),
                                             controlPoint2: CGPointMake(160, 35.82))
            disable2scanPath.addCurveToPoint(CGPointMake(80, 160),
                                             controlPoint1: CGPointMake(160, 124.18),
                                             controlPoint2: CGPointMake(124.18, 160))
            disable2scanPath.addLineToPoint(CGPointMake(80.22, (self.frame.height + 160)/2))
            
            let disable2scanPathLayer = CAShapeLayer()
            disable2scanPathLayer.lineWidth = lineWidth
            disable2scanPathLayer.lineCap = kCALineCapRound
            disable2scanPathLayer.lineJoin = kCALineJoinRound
            disable2scanPathLayer.strokeColor = UIColor.joRedColor().CGColor
            disable2scanPathLayer.fillColor = nil
            disable2scanPathLayer.autoreverses = false;
            disable2scanPathLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                                 y: (self.frame.height - 160)/2,
                                                 width: 160,
                                                 height: (self.frame.height + 160)/2)
            
            disable2scanPathLayer.path = disable2scanPath.CGPath
            layers.append(disable2scanPathLayer)
            disable2scanPathLayer.strokeStart = 0.8
            disable2scanPathLayer.strokeEnd = 1
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.toValue = 0
            strokeStart.duration = 0.5
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + 0.1
            strokeStart.removedOnCompletion = false
            strokeStart.fillMode = kCAFillModeForwards
            disable2scanPathLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.toValue = 0.5
            strokeEnd.duration = 0.6
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.3, 0.5, 0.9)
            strokeEnd.removedOnCompletion = false
            strokeEnd.fillMode = kCAFillModeForwards
            strokeEnd.setValue("disable2ScanTransformLayer", forKey: "transformAnimateName")
            strokeEnd.delegate = self
            disable2scanPathLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
            
            //// 红色的蓝牙图标从头显示
            let bluetoothPath = UIBezierPath()
            bluetoothPath.moveToPoint(CGPointMake(66, 64.29))
            bluetoothPath.addLineToPoint(CGPointMake(96, 94.29))
            bluetoothPath.addLineToPoint(CGPointMake(80.29, 110))
            bluetoothPath.addLineToPoint(CGPointMake(80.29, 50))
            bluetoothPath.addLineToPoint(CGPointMake(96, 65.71))
            bluetoothPath.addLineToPoint(CGPointMake(66, 95.71))
            let bluetoothRedLayer = CAShapeLayer()
            bluetoothRedLayer.lineWidth = lineWidth
            bluetoothRedLayer.lineCap = kCALineCapRound
            bluetoothRedLayer.lineJoin = kCALineJoinRound
            bluetoothRedLayer.strokeColor = UIColor.joRedColor().CGColor
            bluetoothRedLayer.fillColor = nil
            bluetoothRedLayer.autoreverses = false;
            bluetoothRedLayer.path = bluetoothPath.CGPath
            bluetoothRedLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                             y: (self.frame.height - 160)/2,
                                             width: 160, height: 160)
            bluetoothRedLayer.strokeEnd = 0
            
            let bluetoothRedLayerShow = CABasicAnimation(keyPath: "strokeEnd")
            bluetoothRedLayerShow.toValue = 1
            bluetoothRedLayerShow.duration = 0.4
            bluetoothRedLayerShow.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            bluetoothRedLayerShow.beginTime = CACurrentMediaTime() + 0.2
            bluetoothRedLayerShow.fillMode = kCAFillModeForwards
            bluetoothRedLayerShow.removedOnCompletion = false
            bluetoothRedLayer.addAnimation(bluetoothRedLayerShow, forKey: "strokeEnd")
            
            layers.append(bluetoothRedLayer)
            
            return layers
        }
    }
    
    var scan2connectTransformLayer:[CAShapeLayer]{
        get{
            let layers = [CAShapeLayer]()
            //animateLayers.forEach { (layer) in
            let strokeStartScan = CABasicAnimation(keyPath: "strokeStart")
            strokeStartScan.fromValue = 0.375
            strokeStartScan.toValue = 0
            strokeStartScan.beginTime = CACurrentMediaTime()
            strokeStartScan.duration = 0.3
            strokeStartScan.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStartScan.removedOnCompletion = false
            animateLayers[0].addAnimation(strokeStartScan, forKey: "strokeStart")
            //}
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.toValue = 0.5
            strokeStart.duration = 0.6
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + 0.2
            strokeStart.fillMode = kCAFillModeForwards
            strokeStart.removedOnCompletion = false
            stateLayers[0].addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.toValue = 0.5
            strokeEnd.duration = 0.6
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEnd.beginTime = CACurrentMediaTime() + 0.2
            strokeEnd.fillMode = kCAFillModeForwards
            strokeEnd.removedOnCompletion = false
            strokeEnd.setValue("scan2connectTransformLayer", forKey: "transformAnimateName")
            strokeEnd.delegate = self
            
            stateLayers[0].addAnimation(strokeEnd, forKey: "strokeEnd")
            
            return layers
        }
    }
    
    var connect2OkTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            let start = animateLayers[0].presentationLayer()!.strokeStart
            let end = animateLayers[0].presentationLayer()!.strokeEnd
            animateLayers[0].removeAllAnimations()
            animateLayers[0].strokeStart = start
            animateLayers[0].strokeEnd = end
            
            let strokeStart2 = CABasicAnimation(keyPath: "strokeStart")
            strokeStart2.fromValue = start
            strokeStart2.toValue = 0
            strokeStart2.duration = 0.3
            strokeStart2.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart2.beginTime = CACurrentMediaTime() + 0.2
            strokeStart2.fillMode = kCAFillModeForwards
            strokeStart2.removedOnCompletion = false
            animateLayers[0].addAnimation(strokeStart2, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.fromValue = end
            strokeEnd.toValue = 0
            strokeEnd.duration = 0.8
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEnd.beginTime = CACurrentMediaTime() + 0.2
            strokeEnd.fillMode = kCAFillModeForwards
            strokeEnd.removedOnCompletion = false
            animateLayers[0].addAnimation(strokeEnd, forKey: "strokeEnd")
            
            
            let okPath = UIBezierPath()
            okPath.moveToPoint(CGPointMake(13, 38))
            okPath.addLineToPoint(CGPointMake(71.42, 107))
            okPath.addLineToPoint(CGPointMake(115, 53))
            let okLayer = CAShapeLayer()
            okLayer.lineWidth = lineWidth
            okLayer.lineCap = kCALineCapRound
            okLayer.lineJoin = kCALineJoinRound
            okLayer.strokeColor = UIColor.joRedColor().CGColor
            okLayer.fillColor = nil
            okLayer.autoreverses = false;
            okLayer.path = okPath.CGPath
            okLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                   y: (self.frame.height - 160)/2,
                                   width: 160, height: 160)
            
            okLayer.strokeEnd = 0
            
            let okStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            okStrokeStart.toValue = 0.3
            okStrokeStart.duration = 0.8
            okStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            okStrokeStart.beginTime = CACurrentMediaTime() + 1.2
            okStrokeStart.fillMode = kCAFillModeForwards
            okStrokeStart.removedOnCompletion = false
            okLayer.addAnimation(okStrokeStart, forKey: "strokeStart")
            
            let okStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            okStrokeEnd.toValue = 1
            okStrokeEnd.duration = 1.2
            okStrokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            okStrokeEnd.beginTime = CACurrentMediaTime() + 0.6
            okStrokeEnd.fillMode = kCAFillModeForwards
            okStrokeEnd.removedOnCompletion = false
            okStrokeEnd.setValue("connect2OkTransformLayer", forKey: "transformAnimateName")
            okStrokeEnd.delegate = self
            okLayer.addAnimation(okStrokeEnd, forKey: "strokeEnd")
            
            layers.append(okLayer)
            return layers
        }
    }
    
    //连接完成到搜索的转化
    var ok2scanTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            stateLayers[1].removeFromSuperlayer()
            
            let okStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            okStrokeStart.fromValue = 0.3
            okStrokeStart.toValue = 0
            okStrokeStart.duration = 0.2
            okStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            //okStrokeStart.beginTime = CACurrentMediaTime() + 1.5
            okStrokeStart.fillMode = kCAFillModeForwards
            okStrokeStart.removedOnCompletion = false
            stateLayers[0].addAnimation(okStrokeStart, forKey: "strokeStart")
            
            let okStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            okStrokeEnd.fromValue = 1
            okStrokeEnd.toValue = 0
            okStrokeEnd.duration = 1
            okStrokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            okStrokeEnd.beginTime = CACurrentMediaTime() + 0.1
            okStrokeEnd.fillMode = kCAFillModeForwards
            okStrokeEnd.removedOnCompletion = false
            stateLayers[0].addAnimation(okStrokeEnd, forKey: "strokeEnd")
            
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.moveToPoint(CGPointMake(66, 64.29))
            shapePath.addLineToPoint(CGPointMake(96, 94.29))
            shapePath.addLineToPoint(CGPointMake(80.29, 110))
            shapePath.addLineToPoint(CGPointMake(80.29, 50))
            shapePath.addLineToPoint(CGPointMake(96, 65.71))
            shapePath.addLineToPoint(CGPointMake(66, 95.71))
            let shapePathLayer = CAShapeLayer()
            shapePathLayer.lineWidth = lineWidth
            shapePathLayer.lineCap = kCALineCapRound
            shapePathLayer.lineJoin = kCALineJoinRound
            shapePathLayer.strokeColor = UIColor.joRedColor().CGColor
            shapePathLayer.fillColor = nil
            shapePathLayer.autoreverses = false;
            shapePathLayer.path = shapePath.CGPath
            shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                          y: (self.frame.height - 160)/2,
                                          width: 160, height: 160)
            shapePathLayer.strokeEnd = 0
            
            let strokeStart2 = CABasicAnimation(keyPath: "strokeEnd")
            strokeStart2.toValue = 1
            strokeStart2.duration = 1
            strokeStart2.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart2.beginTime = CACurrentMediaTime() + 0.2
            strokeStart2.fillMode = kCAFillModeForwards
            strokeStart2.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStart2, forKey: "strokeEnd")
            
            
            layers.append(shapePathLayer)
            
            let rotationLayer = CAShapeLayer()
            rotationLayer.lineWidth = lineWidth
            rotationLayer.lineCap = kCALineCapRound
            rotationLayer.lineJoin = kCALineJoinRound
            rotationLayer.strokeColor = UIColor.joRedColor().CGColor
            rotationLayer.fillColor = nil
            rotationLayer.autoreverses = false;
            rotationLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                         y: (self.frame.height - 160)/2,
                                         width: 160, height: 160)
            
            let pathRotate = UIBezierPath(arcCenter: CGPointMake(80,80), radius: 80,
                                          startAngle: CGFloat(M_PI_4),
                                          endAngle: CGFloat(2*M_PI+M_PI_4), clockwise: true)
            
            rotationLayer.path = pathRotate.CGPath
            rotationLayer.strokeStart = 0
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.toValue = 0.375
            strokeStart.beginTime = CACurrentMediaTime() + 0.5
            strokeStart.duration = 0.5
            strokeStart.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStart.removedOnCompletion = false
            strokeStart.setValue("ok2scanTransformLayer", forKey: "transformAnimateName")
            strokeStart.delegate = self
            rotationLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            layers.append(rotationLayer)
            
            return layers
        }
    }
    
    
    var connect2scanTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            stateLayers[0].removeFromSuperlayer()
            
            let okStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            okStrokeStart.fromValue = 0
            okStrokeStart.toValue = 0.5
            okStrokeStart.duration = 1
            okStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            //okStrokeStart.beginTime = CACurrentMediaTime() + 1.5
            okStrokeStart.fillMode = kCAFillModeForwards
            okStrokeStart.removedOnCompletion = false
            animateLayers[0].addAnimation(okStrokeStart, forKey: "strokeStart")
            
            let okStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            okStrokeEnd.fromValue = 1
            okStrokeEnd.toValue = 0.5
            okStrokeEnd.duration = 1
            okStrokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            //okStrokeEnd.beginTime = CACurrentMediaTime() + 0.1
            okStrokeEnd.fillMode = kCAFillModeForwards
            okStrokeEnd.removedOnCompletion = false
            animateLayers[0].addAnimation(okStrokeEnd, forKey: "strokeEnd")
            
            //// Shape Drawing
            let shapePath = UIBezierPath()
            shapePath.moveToPoint(CGPointMake(66, 64.29))
            shapePath.addLineToPoint(CGPointMake(96, 94.29))
            shapePath.addLineToPoint(CGPointMake(80.29, 110))
            shapePath.addLineToPoint(CGPointMake(80.29, 50))
            shapePath.addLineToPoint(CGPointMake(96, 65.71))
            shapePath.addLineToPoint(CGPointMake(66, 95.71))
            let shapePathLayer = CAShapeLayer()
            shapePathLayer.lineWidth = lineWidth
            shapePathLayer.lineCap = kCALineCapRound
            shapePathLayer.lineJoin = kCALineJoinRound
            shapePathLayer.strokeColor = UIColor.joRedColor().CGColor
            shapePathLayer.fillColor = nil
            shapePathLayer.autoreverses = false;
            shapePathLayer.path = shapePath.CGPath
            shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                          y: (self.frame.height - 160)/2,
                                          width: 160, height: 160)
            shapePathLayer.strokeStart = 0.5
            shapePathLayer.strokeEnd = 0.5
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.fromValue = 0.5
            strokeStart.toValue = 0
            strokeStart.duration = 1
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + 0.2
            strokeStart.fillMode = kCAFillModeForwards
            strokeStart.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.fromValue = 0.5
            strokeEnd.toValue = 1
            strokeEnd.duration = 1
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEnd.beginTime = CACurrentMediaTime() + 0.2
            strokeEnd.fillMode = kCAFillModeForwards
            strokeEnd.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
            layers.append(shapePathLayer)
            
            let rotationLayer = CAShapeLayer()
            rotationLayer.lineWidth = lineWidth
            rotationLayer.lineCap = kCALineCapRound
            rotationLayer.lineJoin = kCALineJoinRound
            rotationLayer.strokeColor = UIColor.joRedColor().CGColor
            rotationLayer.fillColor = nil
            rotationLayer.autoreverses = false;
            rotationLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                         y: (self.frame.height - 160)/2,
                                         width: 160, height: 160)
            
            let pathRotate = UIBezierPath(arcCenter: CGPointMake(80,80), radius: 80,
                                          startAngle: CGFloat(M_PI_4),
                                          endAngle: CGFloat(2*M_PI+M_PI_4), clockwise: true)
            
            rotationLayer.path = pathRotate.CGPath
            rotationLayer.strokeStart = 0
            
            let strokeStart2 = CABasicAnimation(keyPath: "strokeStart")
            strokeStart2.toValue = 0.375
            strokeStart2.beginTime = CACurrentMediaTime() + 0.5
            strokeStart2.duration = 0.5
            strokeStart2.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStart2.removedOnCompletion = false
            strokeStart2.setValue("connect2scanTransformLayer", forKey: "transformAnimateName")
            strokeStart2.delegate = self
            rotationLayer.addAnimation(strokeStart2, forKey: "strokeStart")
            
            layers.append(rotationLayer)
            
            return layers
        }
    }
    
    
    var scan2disableTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            let percent = animateLayers[0].presentationLayer()?.valueForKeyPath("transform.rotation.z") as? CGFloat
            animateLayers[0].removeAllAnimations()
            animateLayers[0].strokeStart = 0.375
            animateLayers[0].setValue(percent, forKeyPath: "transform.rotation.z")
            
            let step1=Double(percent!)/M_PI*2
            
            let currentStateAnimateKey = "transform.rotation.z"
            let animate = CABasicAnimation(keyPath: currentStateAnimateKey)
            animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animate.fromValue = percent;
            animate.toValue = 0;
            animate.duration = step1;
            animate.removedOnCompletion = false;
            animate.fillMode = kCAFillModeForwards
            animateLayers[0].addAnimation(animate, forKey: currentStateAnimateKey)
            
            
            let strokeStartClose = CABasicAnimation(keyPath: "strokeStart")
            strokeStartClose.toValue = 1
            strokeStartClose.duration = 0
            strokeStartClose.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            strokeStartClose.beginTime = CACurrentMediaTime() + step1
            strokeStartClose.fillMode = kCAFillModeForwards
            strokeStartClose.removedOnCompletion = false
            animateLayers[0].addAnimation(strokeStartClose, forKey: "strokeStart")
            
            
            let bluetoothPath = UIBezierPath()
            bluetoothPath.moveToPoint(CGPointMake(66, 64.29))
            bluetoothPath.addLineToPoint(CGPointMake(96, 94.29))
            bluetoothPath.addLineToPoint(CGPointMake(80.29, 110))
            bluetoothPath.addLineToPoint(CGPointMake(80.29, 50))
            bluetoothPath.addLineToPoint(CGPointMake(96, 65.71))
            bluetoothPath.addLineToPoint(CGPointMake(66, 95.71))
            let bluetoothLayer = CAShapeLayer()
            bluetoothLayer.lineWidth = lineWidth
            bluetoothLayer.lineCap = kCALineCapRound
            bluetoothLayer.lineJoin = kCALineJoinRound
            bluetoothLayer.strokeColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.000).CGColor
            bluetoothLayer.fillColor = nil
            bluetoothLayer.autoreverses = false;
            bluetoothLayer.path = bluetoothPath.CGPath
            bluetoothLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                          y: (self.frame.height - 160)/2,
                                          width: 160, height: 160)
            layers.append(bluetoothLayer)
            bluetoothLayer.strokeStart = 1
            
            let bluetoothStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            bluetoothStrokeStart.fromValue = 1
            bluetoothStrokeStart.toValue = 0
            bluetoothStrokeStart.duration = 1
            bluetoothStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            bluetoothStrokeStart.beginTime = CACurrentMediaTime() + step1
            bluetoothStrokeStart.fillMode = kCAFillModeForwards
            bluetoothStrokeStart.removedOnCompletion = false
            bluetoothLayer.addAnimation(bluetoothStrokeStart, forKey: "strokeStart")
            
            let stransformLayer = CAShapeLayer()
            
            stransformLayer.lineWidth = lineWidth
            stransformLayer.lineCap = kCALineCapRound
            stransformLayer.lineJoin = kCALineJoinRound
            stransformLayer.strokeColor = UIColor.joRedColor().CGColor
            stransformLayer.fillColor = nil
            stransformLayer.autoreverses = false;
            stransformLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                           y: (self.frame.height - 160)/2,
                                           width: 160, height: (self.frame.height + 160)/2)
            let stransformPath = UIBezierPath()
            stransformPath.moveToPoint(CGPointMake(0, 80))
            stransformPath.addCurveToPoint(CGPointMake(80, 0),
                                           controlPoint1: CGPointMake(0, 35.82),
                                           controlPoint2: CGPointMake(35.82, 0))
            stransformPath.addCurveToPoint(CGPointMake(160, 80),
                                           controlPoint1: CGPointMake(124.18, 0),
                                           controlPoint2: CGPointMake(160, 35.82))
            stransformPath.addCurveToPoint(CGPointMake(80, 160),
                                           controlPoint1: CGPointMake(160, 124.18),
                                           controlPoint2: CGPointMake(124.18, 160))
            stransformPath.addLineToPoint(CGPointMake(80.22, (self.frame.height + 160)/2))
            stransformLayer.path = stransformPath.CGPath
            layers.append(stransformLayer)
            stransformLayer.strokeStart = 0
            stransformLayer.strokeEnd = 0
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.fromValue = 0
            strokeStart.toValue = 0.8
            strokeStart.duration = 1
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + step1
            strokeStart.fillMode = kCAFillModeForwards
            strokeStart.removedOnCompletion = false
            stransformLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.fromValue = 0.5
            strokeEnd.toValue = 1
            strokeEnd.duration = 0.8
            strokeEnd.beginTime = CACurrentMediaTime() + step1
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.3, 0.5, 0.8)
            strokeEnd.fillMode = kCAFillModeForwards
            strokeEnd.removedOnCompletion = false
            strokeEnd.setValue("scan2disableTransformLayer", forKey: "transformAnimateName")
            strokeEnd.delegate = self
            
            stransformLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
            
            return layers
        }
    }
    
    var connect2disableTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            let percent = animateLayers[0].presentationLayer()!.strokeStart
            animateLayers[0].removeAllAnimations()
            animateLayers[0].strokeStart = percent
            animateLayers[0].strokeEnd = 1-percent
            
            let step1 = (0.5-Double(percent))*4
            
            let animateStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            animateStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            animateStrokeStart.toValue = 0.5;
            animateStrokeStart.duration = step1;
            animateStrokeStart.removedOnCompletion = false;
            animateStrokeStart.fillMode = kCAFillModeForwards
            animateLayers[0].addAnimation(animateStrokeStart, forKey: "strokeStart")
            
            let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
            strokeEndAnimate.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEndAnimate.toValue = 0;
            strokeEndAnimate.duration = step1;
            strokeEndAnimate.removedOnCompletion = false;
            strokeEndAnimate.fillMode = kCAFillModeForwards
            animateLayers[0].addAnimation(strokeEndAnimate, forKey: "strokeEnd")
            
            let shapePath = UIBezierPath()
            shapePath.moveToPoint(CGPointMake(66, 64.29))
            shapePath.addLineToPoint(CGPointMake(96, 94.29))
            shapePath.addLineToPoint(CGPointMake(80.29, 110))
            shapePath.addLineToPoint(CGPointMake(80.29, 50))
            shapePath.addLineToPoint(CGPointMake(96, 65.71))
            shapePath.addLineToPoint(CGPointMake(66, 95.71))
            let shapePathLayer = CAShapeLayer()
            shapePathLayer.lineWidth = lineWidth
            shapePathLayer.lineCap = kCALineCapRound
            shapePathLayer.lineJoin = kCALineJoinRound
            shapePathLayer.strokeColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.000).CGColor
            shapePathLayer.fillColor = nil
            shapePathLayer.autoreverses = false;
            shapePathLayer.path = shapePath.CGPath
            shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                          y: (self.frame.height - 160)/2,
                                          width: 160, height: 160)
            shapePathLayer.strokeStart = 0.5
            shapePathLayer.strokeEnd = 0.5
            
            let strokeStartClose = CABasicAnimation(keyPath: "strokeStart")
            strokeStartClose.toValue = 0
            strokeStartClose.duration = step1
            strokeStartClose.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            strokeStartClose.fillMode = kCAFillModeForwards
            strokeStartClose.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStartClose, forKey: "strokeStart")
            
            
            let strokeStart2 = CABasicAnimation(keyPath: "strokeEnd")
            strokeStart2.toValue = 1
            strokeStart2.duration = step1
            strokeStart2.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart2.fillMode = kCAFillModeForwards
            strokeStart2.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStart2, forKey: "strokeEnd")
            layers.append(shapePathLayer)
            
            stateLayers[0].removeFromSuperlayer()
            
            let rotationLayer = CAShapeLayer()
            rotationLayer.lineWidth = lineWidth
            rotationLayer.lineCap = kCALineCapRound
            rotationLayer.lineJoin = kCALineJoinRound
            rotationLayer.strokeColor = UIColor.joRedColor().CGColor
            rotationLayer.fillColor = nil
            rotationLayer.autoreverses = false;
            rotationLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                         y: (self.frame.height - 160)/2,
                                         width: 160, height: 160)
            
            let pathRotate = UIBezierPath(arcCenter: CGPointMake(80,80), radius: 80,
                                          startAngle: CGFloat(M_PI_4),
                                          endAngle: CGFloat(2*M_PI+M_PI_4), clockwise: true)
            
            rotationLayer.path = pathRotate.CGPath
            rotationLayer.strokeStart = 0
            
            let strokeStartRotation = CABasicAnimation(keyPath: "strokeStart")
            strokeStartRotation.fromValue = 0
            strokeStartRotation.toValue = 0.375
            strokeStartRotation.duration = 0.3
            strokeStartRotation.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStartRotation.removedOnCompletion = false
            rotationLayer.addAnimation(strokeStartRotation, forKey: "strokeStart")
            
            let strokeStartRotation2 = CABasicAnimation(keyPath: "strokeEnd")
            strokeStartRotation2.fromValue = 1
            strokeStartRotation2.toValue = 0
            strokeStartRotation2.duration = 0
            strokeStartRotation2.beginTime = CACurrentMediaTime() + 0.3
            strokeStartRotation2.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStartRotation2.removedOnCompletion = false
            rotationLayer.addAnimation(strokeStartRotation2, forKey: "strokeEnd")
            
            layers.append(rotationLayer)
            
            let stransformLayer = CAShapeLayer()
            
            stransformLayer.lineWidth = lineWidth
            stransformLayer.lineCap = kCALineCapRound
            stransformLayer.lineJoin = kCALineJoinRound
            stransformLayer.strokeColor = UIColor.joRedColor().CGColor
            stransformLayer.fillColor = nil
            stransformLayer.autoreverses = false;
            stransformLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                           y: (self.frame.height - 160)/2,
                                           width: 160, height: (self.frame.height + 160)/2)
            let stransformPath = UIBezierPath()
            stransformPath.moveToPoint(CGPointMake(0, 80))
            stransformPath.addCurveToPoint(CGPointMake(80, 0),
                                           controlPoint1: CGPointMake(0, 35.82),
                                           controlPoint2: CGPointMake(35.82, 0))
            stransformPath.addCurveToPoint(CGPointMake(160, 80),
                                           controlPoint1: CGPointMake(124.18, 0),
                                           controlPoint2: CGPointMake(160, 35.82))
            stransformPath.addCurveToPoint(CGPointMake(80, 160),
                                           controlPoint1: CGPointMake(160, 124.18),
                                           controlPoint2: CGPointMake(124.18, 160))
            stransformPath.addLineToPoint(CGPointMake(80.22, (self.frame.height + 160)/2))
            stransformLayer.path = stransformPath.CGPath
            layers.append(stransformLayer)
            
            stransformLayer.strokeStart = 0
            stransformLayer.strokeEnd = 0
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.fromValue = 0
            strokeStart.toValue = 1
            strokeStart.duration = 1
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + 0.3
            strokeStart.fillMode = kCAFillModeBackwards
            
            stransformLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.fromValue = 0.5
            strokeEnd.toValue = 1
            strokeEnd.duration = 0.8
            strokeEnd.beginTime = CACurrentMediaTime() + 0.3
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.3, 0.5, 0.8)
            strokeEnd.setValue("scan2disableTransformLayer", forKey: "transformAnimateName")
            strokeEnd.delegate = self
            stransformLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
            
            return layers
        }
    }
    
    var ok2disableTransformLayer:[CAShapeLayer]{
        get{
            var layers = [CAShapeLayer]()
            
            let animateStrokeStart = CABasicAnimation(keyPath: "strokeStart")
            animateStrokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            animateStrokeStart.fromValue = 0.3
            animateStrokeStart.toValue = 0;
            animateStrokeStart.duration = 0.2;
            animateStrokeStart.removedOnCompletion = false;
            animateStrokeStart.fillMode = kCAFillModeForwards
            stateLayers[0].addAnimation(animateStrokeStart, forKey: "strokeStart")
            
            let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
            strokeEndAnimate.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeEndAnimate.fromValue = 1
            strokeEndAnimate.toValue = 0;
            strokeEndAnimate.duration = 0.6;
            strokeEndAnimate.removedOnCompletion = false;
            strokeEndAnimate.fillMode = kCAFillModeForwards
            stateLayers[0].addAnimation(strokeEndAnimate, forKey: "strokeEnd")
            
            stateLayers[1].removeFromSuperlayer()
            
            let shapePath = UIBezierPath()
            shapePath.moveToPoint(CGPointMake(66, 64.29))
            shapePath.addLineToPoint(CGPointMake(96, 94.29))
            shapePath.addLineToPoint(CGPointMake(80.29, 110))
            shapePath.addLineToPoint(CGPointMake(80.29, 50))
            shapePath.addLineToPoint(CGPointMake(96, 65.71))
            shapePath.addLineToPoint(CGPointMake(66, 95.71))
            let shapePathLayer = CAShapeLayer()
            shapePathLayer.lineWidth = lineWidth
            shapePathLayer.lineCap = kCALineCapRound
            shapePathLayer.lineJoin = kCALineJoinRound
            shapePathLayer.strokeColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.000).CGColor
            shapePathLayer.fillColor = nil
            shapePathLayer.autoreverses = false;
            shapePathLayer.path = shapePath.CGPath
            shapePathLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                          y: (self.frame.height - 160)/2,
                                          width: 160, height: 160)
            shapePathLayer.strokeStart = 0.5
            shapePathLayer.strokeEnd = 0.5
            
            let strokeStartClose = CABasicAnimation(keyPath: "strokeStart")
            strokeStartClose.toValue = 0
            strokeStartClose.duration = 2
            strokeStartClose.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            strokeStartClose.fillMode = kCAFillModeForwards
            strokeStartClose.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStartClose, forKey: "strokeStart")
            
            
            let strokeStart2 = CABasicAnimation(keyPath: "strokeEnd")
            strokeStart2.toValue = 1
            strokeStart2.duration = 2
            strokeStart2.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart2.fillMode = kCAFillModeForwards
            strokeStart2.removedOnCompletion = false
            shapePathLayer.addAnimation(strokeStart2, forKey: "strokeEnd")
            layers.append(shapePathLayer)
            
            let rotationLayer = CAShapeLayer()
            rotationLayer.lineWidth = lineWidth
            rotationLayer.lineCap = kCALineCapRound
            rotationLayer.lineJoin = kCALineJoinRound
            rotationLayer.strokeColor = UIColor.joRedColor().CGColor
            rotationLayer.fillColor = nil
            rotationLayer.autoreverses = false;
            rotationLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                         y: (self.frame.height - 160)/2,
                                         width: 160, height: 160)
            
            let pathRotate = UIBezierPath(arcCenter: CGPointMake(80,80), radius: 80,
                                          startAngle: CGFloat(M_PI_4),
                                          endAngle: CGFloat(2*M_PI+M_PI_4), clockwise: true)
            
            rotationLayer.path = pathRotate.CGPath
            rotationLayer.strokeStart = 0
            
            let strokeStartRotation = CABasicAnimation(keyPath: "strokeStart")
            strokeStartRotation.fromValue = 0
            strokeStartRotation.toValue = 0.375
            strokeStartRotation.beginTime = CACurrentMediaTime() + 0.3
            strokeStartRotation.duration = 0.3
            strokeStartRotation.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStartRotation.removedOnCompletion = false
            rotationLayer.addAnimation(strokeStartRotation, forKey: "strokeStart")
            
            let strokeStartRotation2 = CABasicAnimation(keyPath: "strokeEnd")
            strokeStartRotation2.fromValue = 1
            strokeStartRotation2.toValue = 0
            strokeStartRotation2.duration = 0
            strokeStartRotation2.beginTime = CACurrentMediaTime() + 0.6
            strokeStartRotation2.fillMode = kCAFillModeForwards//kCAFillModeForwards
            strokeStartRotation2.removedOnCompletion = false
            rotationLayer.addAnimation(strokeStartRotation2, forKey: "strokeEnd")
            
            layers.append(rotationLayer)
            
            let stransformLayer = CAShapeLayer()
            
            stransformLayer.lineWidth = lineWidth
            stransformLayer.lineCap = kCALineCapRound
            stransformLayer.lineJoin = kCALineJoinRound
            stransformLayer.strokeColor = UIColor.joRedColor().CGColor
            stransformLayer.fillColor = nil
            stransformLayer.autoreverses = false;
            stransformLayer.frame = CGRect(x: (self.frame.width - 160)/2,
                                           y: (self.frame.height - 160)/2,
                                           width: 160, height: (self.frame.height + 160)/2)
            let stransformPath = UIBezierPath()
            stransformPath.moveToPoint(CGPointMake(0, 80))
            stransformPath.addCurveToPoint(CGPointMake(80, 0),
                                           controlPoint1: CGPointMake(0, 35.82),
                                           controlPoint2: CGPointMake(35.82, 0))
            stransformPath.addCurveToPoint(CGPointMake(160, 80),
                                           controlPoint1: CGPointMake(124.18, 0),
                                           controlPoint2: CGPointMake(160, 35.82))
            stransformPath.addCurveToPoint(CGPointMake(80, 160),
                                           controlPoint1: CGPointMake(160, 124.18),
                                           controlPoint2: CGPointMake(124.18, 160))
            stransformPath.addLineToPoint(CGPointMake(80.22, (self.frame.height + 160)/2))
            stransformLayer.path = stransformPath.CGPath
            layers.append(stransformLayer)
            
            stransformLayer.strokeStart = 0
            stransformLayer.strokeEnd = 0
            
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            strokeStart.fromValue = 0
            strokeStart.toValue = 1
            strokeStart.duration = 1
            strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
            strokeStart.beginTime = CACurrentMediaTime() + 0.6
            strokeStart.fillMode = kCAFillModeBackwards
            
            stransformLayer.addAnimation(strokeStart, forKey: "strokeStart")
            
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            strokeEnd.fromValue = 0.5
            strokeEnd.toValue = 1
            strokeEnd.duration = 0.8
            strokeEnd.beginTime = CACurrentMediaTime() + 0.6
            strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.3, 0.5, 0.8)
            strokeEnd.setValue("ok2disableTransformLayer", forKey: "transformAnimateName")
            strokeEnd.delegate = self
            stransformLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
            
            return layers
        }
    }
    
    // 过度的Layer
    var transformLayers:[CAShapeLayer] = [CAShapeLayer]()
    
    // 当前显示的状态
    var stateLayers:[CAShapeLayer] = [CAShapeLayer]()
    
    // 当前的动态效果的layers
    var animateLayers:[CAShapeLayer] = [CAShapeLayer]()
    
    //
    var nextAnimateLayers:[CAShapeLayer] = [CAShapeLayer]()
    
    //当前状态
    var currentState:HomeBarManageState = .unsupport{
        didSet{
            if currentState == .unsupport {
                //02-移出以前的状态图层
                stateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                
                //03-创建新的过度动效
                
                //04-创建新的状态图
                stateLayers = unsupportSateLayer
                
                stateLayers.forEach({ (layer) in
                    self.layer.insertSublayer(layer, atIndex: 0)
                })
                
                //移出老的动效
                NSLog("animateLayers:\(animateLayers.count)")
                animateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                animateLayers.removeAll()
                
            } else if currentState == .disabled {
                //02-移出以前的状态图层
                stateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                
                //03-创建新的过度动效
                
                //04-创建新的状态图
                stateLayers = disabledStateLayer
                
                stateLayers.forEach({ (layer) in
                    self.layer.insertSublayer(layer, atIndex: 0)
                })
                
                //移出老的动效
                NSLog("animateLayers:\(animateLayers.count)")
                animateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                animateLayers.removeAll()
                
                if(nextAnimateLayers.count == 0){
                    animateLayers = disabledAnimateLayer
                    animateLayers.forEach({ (layer) in
                        self.layer.addSublayer(layer)
                    })
                }else{
                    animateLayers = nextAnimateLayers
                    nextAnimateLayers.removeAll()
                }
                
            } else if(currentState == .scanning) {
                //02-移出以前的状态图层
                stateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                
                //03-创建新的过度动效
                
                //04-创建新的状态图
                stateLayers = scanStateLayer
                
                stateLayers.forEach({ (layer) in
                    self.layer.insertSublayer(layer, atIndex: 0)
                })
                
                //移出老的动效
                NSLog("animateLayers:\(animateLayers.count)")
                animateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                animateLayers.removeAll()
                
                if(nextAnimateLayers.count == 0){
                    animateLayers = scanAnimateLayer
                    animateLayers.forEach({ (layer) in
                        self.layer.addSublayer(layer)
                    })
                }else{
                    animateLayers = nextAnimateLayers
                    nextAnimateLayers.removeAll()
                }
            }else if(currentState == .connecting){
                //01-移出以前的状态图层
                stateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                
                //02-创建新的状态图
                stateLayers = connectStateLayer
                
                stateLayers.forEach({ (layer) in
                    self.layer.insertSublayer(layer, atIndex: 0)
                })
                
                //移出老的动效
                NSLog("animateLayers:\(animateLayers.count)")
                animateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                animateLayers.removeAll()
                
                if(nextAnimateLayers.count == 0){
                    animateLayers = connectAnimateLayer
                    animateLayers.forEach({ (layer) in
                        self.layer.addSublayer(layer)
                    })
                }else{
                    animateLayers = nextAnimateLayers
                    nextAnimateLayers.removeAll()
                }
            }else if(currentState == .connected){
                //02-移出以前的状态图层
                stateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                
                //03-创建新的过度动效
                
                //04-创建新的状态图
                stateLayers = okStateLayer
                
                stateLayers.forEach({ (layer) in
                    self.layer.insertSublayer(layer, atIndex: 0)
                })
                
                //移出老的动效
                NSLog("animateLayers:\(animateLayers.count)")
                animateLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                animateLayers.removeAll()
                
                if(nextAnimateLayers.count == 0){
                    
                }else{
                    animateLayers = nextAnimateLayers
                    nextAnimateLayers.removeAll()
                }
            }
            
        }
    }
    
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        let transformAnimateName = anim.valueForKey("transformAnimateName") as? String
        if(transformAnimateName != nil){
            currentDoing = nil
            if(transformAnimateName == "disable2ScanTransformLayer"){
                currentState = .scanning
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
            }else if(transformAnimateName == "scan2connectTransformLayer"){
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
                currentState = .connecting
            }else if(transformAnimateName == "connect2OkTransformLayer"){
                currentState = .connected
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
            }else if(transformAnimateName == "ok2scanTransformLayer"){
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
                currentState = .scanning
            }else if(transformAnimateName == "connect2scanTransformLayer"){
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
                currentState = .scanning
            }else if(transformAnimateName == "scan2disableTransformLayer"){
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
                currentState = .disabled
            }else if(transformAnimateName == "ok2disableTransformLayer"){
                transformLayers.forEach({ (layer) in
                    layer.removeFromSuperlayer()
                })
                transformLayers.removeAll()
                currentState = .disabled
            }
            
            if(currentWait != nil){
                change2state(currentWait)
                currentWait = nil
            }
        }
        
    }
    
    @IBAction func clicktest(sender:UIButton){
        //currentState =
        change2state(HomeBarManageState(rawValue:sender.tag)!)
    }
    
    //当前的等待
    var currentWait:HomeBarManageState!
    
    //当前的等待
    var currentDoing:HomeBarManageState! = nil
    
    /**
     修改为新的状态
     
     - parameter newState: 新的状态
     */
    func change2state(newState:HomeBarManageState)->Bool{
        
        let oldState = currentState
        //如果不是新状态，不处理
        if(oldState == newState ){
            return false
        }
        
        //需要执行的等待相同
        if(currentDoing != nil){
            currentWait = newState
            return false
        }
        
        currentDoing = newState
        
        nextAnimateLayers.forEach { (layer) in
            layer.removeFromSuperlayer()
        }
        nextAnimateLayers.removeAll()
        
        transformLayers.forEach { (layer) in
            layer.removeFromSuperlayer()
        }
        transformLayers.removeAll()
        //无效状态到扫描
        if(oldState == .disabled && newState == .scanning){
            
            transformLayers = disable2ScanTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            nextAnimateLayers = scanAnimateLayer
            nextAnimateLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //扫描到蓝牙未开
        if(oldState == .scanning && newState == .disabled){
            transformLayers = scan2disableTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //扫描到正在连接
        if(oldState == .scanning && newState == .connecting){
            transformLayers = scan2connectTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            
            nextAnimateLayers = connectAnimateLayer
            nextAnimateLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //连接到扫描
        if(oldState == .connecting && newState == .scanning){
            transformLayers = connect2scanTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            
            nextAnimateLayers = scanAnimateLayer
            nextAnimateLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //连接到完毕
        if(oldState == .connecting && newState == .connected){
            transformLayers = connect2OkTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //完毕到继续扫描
        if(oldState == .connected && newState == .scanning){
            transformLayers = ok2scanTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            
            nextAnimateLayers = scanAnimateLayer
            nextAnimateLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //完毕到蓝牙未开
        if(oldState == .connected && newState == .disabled){
            transformLayers = ok2disableTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //连接到蓝牙未开
        if(oldState == .connecting && newState == .disabled){
            transformLayers = connect2disableTransformLayer
            transformLayers.forEach { (layer) in
                self.layer.addSublayer(layer)
            }
            return true
        }
        
        //没有定义动画的，直接处理
        currentState = newState
        currentDoing = nil
        
        return true
    }
}
