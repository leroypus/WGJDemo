//
//  ViewController.m
//  WGJTableViewDemo
//
//  Created by wangguojuan on 15/8/5.
//  Copyright (c) 2015年 sj. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController() <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,strong)UITableView *tableView;


@end
@implementation ViewController

#pragma mark-ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    //add subview
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    // layout subviews
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(10);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
    }];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma make-UITableViewDateSource

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell #%@", self.items[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - Properties

- (NSMutableArray *)items
{
    if (!_items) {
        _items = @[].mutableCopy;
        
        for (NSInteger index = 0; index < 100; index++) {
            [_items addObject:[NSString stringWithFormat:@"%lu", index]];
        }
    }
    return _items;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
