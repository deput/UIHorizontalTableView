//
//  ViewController.m
//  UIHorizontalTableViewDemo
//
//  Created by deput on 5/30/15.
//  Copyright (c) 2015 deput. All rights reserved.
//

#import "ViewController.h"
#import "UIHorizontalTableView.h"
@interface ViewController ()<UIHorizontalTableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIHorizontalTableView* h1 = [[UIHorizontalTableView alloc] initWithFrame:(CGRect){0,50,self.view.bounds.size.width, 50}];
    [self.view addSubview:h1];
    h1.hDataSource = self;
    h1.hDelegate = self;
    [h1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView:(UITableView *)tableView widthForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",[@(indexPath.section) stringValue],[@(indexPath.row) stringValue]];
    
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* l = [UILabel new];
    l.text = [@(section) stringValue];
    l.backgroundColor = [UIColor redColor];
    l.textAlignment = NSTextAlignmentCenter;
    return l;
}

- (CGFloat) tableView:(UITableView *)tableView widthForHeaderInSection:(NSInteger)section
{
    return 50;
}

@end
