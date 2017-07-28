//
//  ViewController.m
//  XMPageControl
//
//  Created by xuming on 2017/7/28.
//  Copyright © 2017年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import "XMEllipsePageControl.h"

@interface ViewController ()<UIScrollViewDelegate,XMEllipsePageControlDelegate>
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,strong) XMEllipsePageControl *myPageControl1;
@property(nonatomic,strong) XMEllipsePageControl *myPageControl2;
@property(nonatomic,strong) XMEllipsePageControl *myPageControl3;

@property(nonatomic,strong) UIScrollView *scrollView0;
@property(nonatomic,strong) UIScrollView *scrollView1;
@property(nonatomic,strong) UIScrollView *scrollView2;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setView1];
    [self setView2];
    [self setview3];
    
    
}

- (void)setView1{
    _scrollView0=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    _scrollView0.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*6, 150);
    _scrollView0.delegate=self;
    _scrollView0.pagingEnabled = YES;
    _scrollView0.tag=1000;
    _scrollView0.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_scrollView0];
    
    _myPageControl1 = [[XMEllipsePageControl alloc] init];
    _myPageControl1.frame=CGRectMake(0, 80,[UIScreen mainScreen].bounds.size.width, 30);
    _myPageControl1.numberOfPages = 6;
    _myPageControl1.delegate=self;
    _myPageControl1.tag=1000;
    [self.view addSubview:_myPageControl1];

}

- (void)setView2{
    _scrollView1=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 150)];
    _scrollView1.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*6, 150);
    _scrollView1.delegate=self;
    _scrollView1.pagingEnabled = YES;
    _scrollView1.tag=1001;
    _scrollView1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_scrollView1];
    _myPageControl2 = [[XMEllipsePageControl alloc] initWithFrame:CGRectMake(0, 280,[UIScreen mainScreen].bounds.size.width, 30)];
    _myPageControl2.numberOfPages = 6;
    _myPageControl2.otherColor=[UIColor grayColor];
    _myPageControl2.currentColor=[UIColor orangeColor];
    _myPageControl2.delegate=self;
    _myPageControl2.tag=1001;
    [self.view addSubview:_myPageControl2];
}


- (void) setview3{
    _scrollView2=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 150)];
    _scrollView2.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*6, 150);
    _scrollView2.delegate=self;
    _scrollView2.pagingEnabled = YES;
    _scrollView2.tag=1002;
    _scrollView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_scrollView2];

    _myPageControl3 = [[XMEllipsePageControl alloc] initWithFrame:CGRectMake(0, 480,[UIScreen mainScreen].bounds.size.width, 30)];
    _myPageControl3.numberOfPages = 6;
    _myPageControl3.otherColor=[UIColor grayColor];
    _myPageControl3.controlSize=12;
    _myPageControl3.currentColor=[UIColor brownColor];
    _myPageControl3.controlSpacing=15;
    _myPageControl3.currentBkImg=[UIImage imageNamed:@"bkimg"];
    _myPageControl3.delegate=self;
    _myPageControl3.tag=1002;
    [self.view addSubview:_myPageControl3];
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSInteger currentPage = targetContentOffset->x / [UIScreen mainScreen].bounds.size.width;
    
    if(scrollView.tag==1000){
        self.myPageControl1.currentPage = currentPage;
    }else if(scrollView.tag==1001){
        self.myPageControl2.currentPage = currentPage;
        
    }else{
        self.myPageControl3.currentPage = currentPage;
        
    }
}

#pragma  mark XMEllipsePageControlDelegate。监听用户点击
-(void)ellipsePageControlClick:(XMEllipsePageControl *)pageControl index:(NSInteger)clickIndex{
    
    NSLog(@"%ld",clickIndex);
    if(pageControl.tag==1000)
    {
        
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width * clickIndex, 150);
        [_scrollView0 setContentOffset:position animated:YES];
        
    }else if(pageControl.tag==1001){
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width * clickIndex, 150);
        [_scrollView1 setContentOffset:position animated:YES];
    }else{
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width * clickIndex, 150);
        [_scrollView2 setContentOffset:position animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
