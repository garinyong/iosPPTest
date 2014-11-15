//
//  FitViewController.m
//  iosPPTest
//
//  Created by gaoyong on 14-9-25.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "FitViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation FitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //老代码加入(lauchimage)适配
    UIImageView *imgUiew = [[UIImageView alloc] init];
    imgUiew.frame = CGRectMake(convertWidthFromIp5(10) , convertWidthFromIp5(10) , 214, 134);
    imgUiew.image = [UIImage imageNamed:@"haha.png"];
    imgUiew.contentMode = UIViewContentModeCenter;
    imgUiew.layer.borderWidth = 1;
    imgUiew.clipsToBounds = NO;
    [self.view addSubview:imgUiew];
    
    CGRect frame = imgUiew.frame;
    NSLog(@"imgUiew:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    
    
    //新代码，已6plus为效果图
    UIView *greenView = [UIView new];
    greenView.frame = convertFrameFromIp6Plus(CGRectMake(0,200,414,200));
    greenView.backgroundColor = [UIColor greenColor];
    greenView.layer.borderWidth = 1;
    [self.view addSubview:greenView];
    
    frame = greenView.frame;
    NSLog(@"greenView:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
}

@end