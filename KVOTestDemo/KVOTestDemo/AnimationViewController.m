//
//  AnimationViewController.m
//  KVOTestDemo
//
//  Created by 伯明利 on 16/7/30.
//  Copyright © 2016年 bomingli. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController
{
    UIView *_animationView;
    
    UIView *_animationViewSecond;
    
    UIView *_animationViewThree;
    
    CGSize _size;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _size = [UIScreen mainScreen].bounds.size;
    
    _animationView = [[UIView alloc] initWithFrame:CGRectMake(20, _size.height, 50, 50)];
    _animationView.backgroundColor = [UIColor redColor];
    _animationView.layer.cornerRadius = 25;
    
    [self.view addSubview:_animationView];
    
    
    _animationViewSecond = [[UIView alloc] initWithFrame:CGRectMake(20 + 65, _size.height, 50, 50)];
    _animationViewSecond.backgroundColor = [UIColor greenColor];
    _animationViewSecond.layer.cornerRadius = 25;
    
    [self.view addSubview:_animationViewSecond];
    
    
    _animationViewThree = [[UIView alloc] initWithFrame:CGRectMake(20 + 65 + 65, _size.height, 50, 50)];
    _animationViewThree.backgroundColor = [UIColor yellowColor];
    _animationViewThree.layer.cornerRadius = 25;
    
    [self.view addSubview:_animationViewThree];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(_size.width - 100, _size.height - 100, 80, 36)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)animation:(UIButton *)sender {
    if (sender.selected) {
        [self animationAppear];
    } else {
        [self animationDisappear];
    }
    sender.selected = !sender.selected;
}

- (void)animationAppear {
    [UIView animateWithDuration:0.6 delay:0.4 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _animationView.center = CGPointMake(45, _size.height / 2.f);;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.65 delay:0.4 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _animationViewSecond.center = CGPointMake(45 + 65, _size.height / 2.f);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.7 delay:0.4 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _animationViewThree.center = CGPointMake(45 + 65 + 65, _size.height / 2.f);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)animationDisappear {
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _animationView.frame = CGRectMake(20, _size.height, 50, 50);
        _animationViewSecond.frame = CGRectMake(20 + 65, _size.height, 50, 50);
        _animationViewThree.frame = CGRectMake(20 + 65 + 65, _size.height, 50, 50);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self animationAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self animationDisappear];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    [UIView animateWithDuration:0.6 delay:0.4 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        _animationView.center = [touch locationInView:self.view];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    [UIView animateWithDuration:0.3 animations:^{
        _animationView.center = [touch locationInView:self.view];
    }];
    [UIView animateWithDuration:0.2 animations:^{
        _animationViewSecond.center = [touch locationInView:self.view];
    }];
    [UIView animateWithDuration:0.1 animations:^{
        _animationViewThree.center = [touch locationInView:self.view];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
