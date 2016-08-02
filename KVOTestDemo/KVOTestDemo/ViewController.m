//
//  ViewController.m
//  KVOTestDemo
//
//  Created by 伯明利 on 16/7/23.
//  Copyright © 2016年 bomingli. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController
{
    UIView *layerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"ViewController" owner:self options:nil] lastObject];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.view.mas_top).offset(20);
        make.height.mas_equalTo(50);
    }];
    
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger row = 0; row != 20; row++ ) {
        NSMutableArray *itemSubs = [NSMutableArray array];
        for (NSInteger col = 0; col <= row; col++) {
            UIView *item = [[UIView alloc] init];
            item.backgroundColor = [UIColor colorWithRed:row * 10 / 255.f green:col * 20 / 255.f blue:(col + row) / 255.f alpha:1];
            item.translatesAutoresizingMaskIntoConstraints = NO;
            [self.view addSubview:item];
            [itemSubs addObject:item];
        }
        [items addObject:itemSubs];
    }
    
    CGFloat width = 10;
    CGFloat height = 10;
    for (NSInteger row = 0; row != items.count; row++) {
        for (NSInteger col = 0; col != [items[row] count]; col++) {
            UIView *item = items[row][col];
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
                make.left.mas_equalTo((self.view.bounds.size.width - width) / 2.f - row * width + col * 2 * width);
                make.top.mas_equalTo(row * height + 100);
            }];
        }
    }
    
    layerView = [[UIView alloc] init];
    layerView.frame = CGRectMake(200, 500, 50, 50);
//    layerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:layerView];
    layerView.backgroundColor = [UIColor greenColor];
//    [layerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view.mas_bottom).offset(-300);
//        make.left.mas_equalTo(self.view).offset(200);
//        make.size.mas_equalTo(self.view).multipliedBy(0.10);
//    }];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, layerView.bounds.size.width, layerView.bounds.size.height) ;
    layer.position = CGPointMake(25, 25);
    layer.cornerRadius = 25;
    
    [layerView.layer addSublayer:layer];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [layerView addGestureRecognizer:longPress];
    
}

- (void)longPress:(UIGestureRecognizer *)sender {
    [self animationX:YES];
    [self animationY:YES];
}
 
- (void)animationX:(BOOL)isX{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        if (isX) {
            CGRect frame = layerView.frame;
            frame.origin.x -= 5;
            frame.origin.y -= 5;
            layerView.frame = frame;
        } else {
            CGRect frame = layerView.frame;
            frame.origin.x += 5;
            frame.origin.y += 5;
            layerView.frame = frame;
        }
    } completion:^(BOOL finished) {
        [self animationX:!isX];
    }];
}

- (void)animationY:(BOOL)isX{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        if (isX) {
            CGRect frame = layerView.frame;
            frame.origin.x -= 5;
            frame.origin.y += 5;
            layerView.frame = frame;
        } else {
            CGRect frame = layerView.frame;
            frame.origin.x += 5;
            frame.origin.y -= 5;
            layerView.frame = frame;
        }
    } completion:^(BOOL finished) {
        [self animationX:!isX];
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch.view isEqual:layerView]) {
        layerView.center = [touch locationInView:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
