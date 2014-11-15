//
//  ViewController.m
//  iosPPTest
//
//  Created by gaoyong on 14-9-19.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
     [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:greenView];
    
    UIView *yelloView = [UIView new];
    yelloView.backgroundColor = [UIColor yellowColor];
     [yelloView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:yelloView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:self action:@selector(convertString) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSDictionary *dictBinding = NSDictionaryOfVariableBindings(greenView,yelloView,btn);
    
    NSString *vfString = @"H:|-20-[greenView(100)]";
    
    NSArray *constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
    [self.view addConstraints:constraint];
    
    vfString = @"V:|-50-[greenView(72)]-50-[yelloView(72)]-50-[btn(72)]";
    constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
    [self.view addConstraints:constraint];
    
    vfString = @"H:|-20-[yelloView(100)]";
    constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
    [self.view addConstraints:constraint];
    
//    vfString = @"V:|-[greenView]-50-[yelloView(72)]";
//    constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
//    [self.view addConstraints:constraint];
    
    vfString = @"H:|-20-[btn(100)]";
    constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
    [self.view addConstraints:constraint];
    
//    vfString = @"V:|-[yelloView]-50-[btn(72)]";
//    constraint = [NSLayoutConstraint constraintsWithVisualFormat:vfString options:0 metrics:nil views:dictBinding];
//    [self.view addConstraints:constraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) convertString
{
    NSString * fName = [[NSBundle mainBundle] pathForResource:@"cityRes" ofType:@"txt"];
    if (fName) {
        NSString *json = [NSString stringWithContentsOfFile:fName encoding:NSUTF8StringEncoding error:nil];
        
        NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *result = [data objectFromJSONData];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *cPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"citycode.plist"];
        
        BOOL res = [result writeToFile:cPath atomically:YES];
        
        NSLog(@"%@", res?@"yes":@"no");
    }
}

@end
