//
//  ViewController.m
//  dicGame
//
//  Created by 刘海峰 on 2020/10/15.
//


#import "ViewController.h"
#import "needShowVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewH = [UIScreen mainScreen].bounds.size.height;
    
    
    
    UIView *esayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH / 2)];
    esayView.backgroundColor = [UIColor orangeColor];
    esayView.userInteractionEnabled = YES;
    UITapGestureRecognizer *esayTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnSenderClick)];
    [esayView addGestureRecognizer:esayTap];
    [self.view addSubview:esayView];
    
    UILabel *esayL = [[UILabel alloc] init];
    esayL.text = @"试炼初阶：来吧，展示！";
    esayL.textColor = [UIColor whiteColor];
    esayL.font = [UIFont systemFontOfSize:20 weight:10];
    esayL.center = CGPointMake(viewW / 2, CGRectGetHeight(esayView.bounds) / 2);
    esayL.bounds = CGRectMake(0, 0, viewW, 70);
    esayL.textAlignment = NSTextAlignmentCenter;
    [esayView addSubview:esayL];
    
    UIView *difficultView = [[UIView alloc] initWithFrame:CGRectMake(0, viewH / 2, viewW, viewH / 2)];
    difficultView.backgroundColor = [UIColor redColor];
    difficultView.userInteractionEnabled = YES;
    UITapGestureRecognizer *diffTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diffBtnSenderClick)];
    [difficultView addGestureRecognizer:diffTap];
    [self.view addSubview:difficultView];
    
    UILabel *diffL = [[UILabel alloc] init];
    diffL.text = @"试炼高阶：来吧，展示！";
    diffL.textColor = [UIColor whiteColor];
    diffL.font = [UIFont systemFontOfSize:20 weight:10];
    diffL.center = CGPointMake(viewW / 2, CGRectGetHeight(difficultView.bounds) / 2);
    diffL.bounds = CGRectMake(0, 0, viewW, 70);
    diffL.textAlignment = NSTextAlignmentCenter;
    [difficultView addSubview:diffL];
    
}

- (void)btnSenderClick{
    
    needShowVC *showVC = [[needShowVC alloc] init];
    showVC.isEsay = YES;
    [self presentViewController:showVC animated:YES completion:nil];
}

- (void)diffBtnSenderClick{
    
    needShowVC *showVC = [[needShowVC alloc] init];
    showVC.isEsay = NO;
    [self presentViewController:showVC animated:YES completion:nil];
}

@end
