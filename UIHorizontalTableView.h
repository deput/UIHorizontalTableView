//
//  UIHorizontalTableView.h
//  Horizontal Table View
//
//  Created by deput on 1/1/14.
//  Copyright (c) 2015 deput. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIHorizontalTableViewDelegate<UITableViewDelegate>

@required
- (CGFloat)tableView:(UITableView *)tableView widthForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (CGFloat)tableView:(UITableView *)tableView widthForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView widthForFooterInSection:(NSInteger)section;

- (CGFloat)tableView:(UITableView *)tableView estimatedWidthForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0);
- (CGFloat)tableView:(UITableView *)tableView estimatedWidthForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0);
- (CGFloat)tableView:(UITableView *)tableView estimatedWidthForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0);
@end

@interface UIHorizontalTableView : UITableView

@property (nonatomic, weak) id <UITableViewDataSource> hDataSource;
@property (nonatomic, weak) id <UIHorizontalTableViewDelegate> hDelegate;

@end
