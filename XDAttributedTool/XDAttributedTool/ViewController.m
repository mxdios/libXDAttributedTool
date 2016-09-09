//
//  ViewController.m
//  XDAttributedTool
//
//  Created by miaoxiaodong on 16/8/4.
//  Copyright © 2016年 miaoxiaodong. All rights reserved.
//

#import "ViewController.h"
#import "XDAttributedText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.attributedText = [XDAttributedText setupOneAttributedText:@"一段文字设置为一段样式" array:@[[UIColor redColor], [UIFont systemFontOfSize:20]]];
    [self.view addSubview:label];
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.attributedText = [XDAttributedText setupTrendsAttributedText:@"一段文字设置为两段样式" startArray:@[@"6", [UIColor redColor], [UIFont systemFontOfSize:20]] centreArray:nil endArray:@[@"0", [UIColor blueColor], [UIFont systemFontOfSize:15]]];
    [self.view addSubview:label1];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 30)];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.attributedText = [XDAttributedText setupTrendsAttributedText:@"一段文字设置为三段样式" startArray:@[@"4", [UIColor redColor], [UIFont systemFontOfSize:20]] centreArray:@[@"0", [UIColor blackColor], [UIFont systemFontOfSize:25]] endArray:@[@"4", [UIColor blueColor], [UIFont systemFontOfSize:15]]];
    [self.view addSubview:label3];
    
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.attributedText = [XDAttributedText setupMoreAttributedText:@"一段文字设置为多段样式" arrays:@[@"2", [UIColor redColor], [UIFont systemFontOfSize:10]],@[@"2", [UIColor blackColor], [UIFont systemFontOfSize:12]], @[@"2", [UIColor grayColor], [UIFont systemFontOfSize:14]],@[@"2", [UIColor orangeColor], [UIFont systemFontOfSize:18]],@[@"2", [UIColor purpleColor], [UIFont systemFontOfSize:22]], @[@"1", [UIColor yellowColor], [UIFont systemFontOfSize:25]],nil];
    [self.view addSubview:label4];
    
    
    
}

@end
