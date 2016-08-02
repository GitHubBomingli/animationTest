//
//  HeaderSecondViewController.m
//  KVOTestDemo
//
//  Created by 伯明利 on 16/8/1.
//  Copyright © 2016年 bomingli. All rights reserved.
//

#import "HeaderSecondViewController.h"

@interface HeaderSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIImageView *headerSubImageView;
@property (strong, nonatomic) UIView *headerView;

@end

@implementation HeaderSecondViewController

{
    CGSize _size;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _size = [UIScreen mainScreen].bounds.size;
    
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _size.width, 200)];
    _headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((_size.width - 100) / 2.f, 150, 100, 21)];
    nameLabel.text = @"伯明利";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [_headerView addSubview:nameLabel];
    
    UILabel *workLabel = [[UILabel alloc] initWithFrame:CGRectMake((_size.width - 100) / 2.f, 175, 100, 21)];
    workLabel.text = @"吉林省郎创集团";
    workLabel.textColor = [UIColor whiteColor];
    workLabel.font = [UIFont systemFontOfSize:13];
    workLabel.textAlignment = NSTextAlignmentCenter;
    [_headerView addSubview:workLabel];
    
    _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的_02"]];
    _headerImageView.frame = CGRectMake(0, 0, _size.width, 200);
    [self.view addSubview:_headerImageView];
    
    _headerSubImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的_02"]];
    _headerSubImageView.frame = CGRectMake(0, 0, 100, 100);
    _headerSubImageView.layer.cornerRadius = 50;
    _headerSubImageView.layer.masksToBounds = YES;
    _headerSubImageView.center = _headerImageView.center;
    [_headerImageView addSubview:_headerSubImageView];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _headerView;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetY = scrollView.contentInset.top + scrollView.contentOffset.y;
    CGRect frame = self.headerImageView.frame;
    frame.size.height = 200 - contentOffsetY;
    if (frame.size.height < 64) {
        frame.size.height = 64;
    }
    self.headerImageView.frame = frame;
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    CGRect subFrame = self.headerSubImageView.frame;
    subFrame.size.height = 100 - contentOffsetY;
    subFrame.size.width = 100 - contentOffsetY;
    if (subFrame.size.height < 100 || subFrame.size.width < 100) {
        subFrame.size.height = 100;
        subFrame.size.width = 100;
    }
    _headerSubImageView.layer.cornerRadius = subFrame.size.height / 2.f;
    _headerSubImageView.frame = subFrame;
    _headerSubImageView.center = _headerImageView.center;
    
    _headerSubImageView.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCellReusableIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCellReusableIdentifier"];
    }
    cell.textLabel.text = @"我的";
    return cell;
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
