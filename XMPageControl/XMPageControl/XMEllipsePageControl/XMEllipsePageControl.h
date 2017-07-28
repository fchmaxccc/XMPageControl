//
//  XMEllipsePageControl.h
//  XMEllipsePageControl
//
//  Created by xuming on 2017/7/26.
//  Copyright © 2017年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMEllipsePageControl;
@protocol XMEllipsePageControlDelegate <NSObject>

-(void)ellipsePageControlClick:(XMEllipsePageControl*)pageControl index:(NSInteger)clickIndex;

@end
@interface XMEllipsePageControl : UIControl

@property(nonatomic) NSInteger numberOfPages;          //  多少分页点
@property(nonatomic) NSInteger currentPage;            //  当前点位置
@property(nonatomic) NSInteger controlSize;            //  点大小
@property(nonatomic) NSInteger controlSpacing;         //  点的间距 
@property(nonatomic,strong) UIColor *otherColor;       //  其他点颜色
@property(nonatomic,strong) UIColor *currentColor;     //  当前点颜色
@property(nonatomic,strong) UIImage *currentBkImg;     //  当前点背景颜色
@property(nonatomic,weak)id<XMEllipsePageControlDelegate> delegate;
@end
