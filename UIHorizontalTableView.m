//
//  UIHorizontalTableView.m
//  Horizontal Table View
//
//  Created by deput on 1/1/14.
//  Copyright (c) 2015 deput. All rights reserved.
//

#import "UIHorizontalTableView.h"

@interface UIHorizontalTableView()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@end

@implementation UIHorizontalTableView
#pragma mark - Interfaces
- (instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.frame = (CGRect){frame.origin,(CGSize){self.frame.size.height,self.frame.size.width}};
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    self.dataSource = self;
    self.delegate = self;
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    return [super initWithCoder:aDecoder];
}

- (instancetype) initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame style:UITableViewStylePlain];
}

- (instancetype) init
{
    return [self initWithFrame:CGRectZero];
}

- (void) dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
    self.hDelegate = nil;
    self.hDataSource = nil;
}

- (void) setFrame:(CGRect)frame
{
    return [super setFrame:frame];
}

- (void) setFrame_H:(CGRect)frame
{
    return [super setFrame:(CGRect){frame.origin,(CGSize){self.frame.size.width,self.frame.size.height}}];
}

#pragma mark - 
- (void) layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.hDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [self.hDataSource tableView:tableView numberOfRowsInSection:section];
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    if ([self.hDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        cell = [self.hDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.hDataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.hDataSource numberOfSectionsInTableView:self];
    }else{
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:titleForHeaderInSection:)]){
        return [self.hDataSource tableView:tableView titleForHeaderInSection:section];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if ([self.hDataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)]) {
        return [self.hDataSource tableView:tableView titleForFooterInSection:section];
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)]) {
        return [self.hDataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
        return [self.hDataSource tableView:tableView canMoveRowAtIndexPath:indexPath];
    }
    return NO;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if ([self.hDataSource respondsToSelector:@selector(sectionIndexTitlesForTableView:)]) {
        return [self.hDataSource sectionIndexTitlesForTableView:tableView];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([self.hDataSource respondsToSelector:@selector(tableView:sectionForSectionIndexTitle:atIndex:)]) {
        return [self.hDataSource tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)]) {
        [self.hDataSource tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if ([self.dataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)]) {
        [self.hDataSource tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath];
    }
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        //[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        [self.hDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.hDelegate tableView:tableView didDeselectRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.hDelegate tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.transform = CGAffineTransformMakeRotation(M_PI_2);
    if ([self.hDelegate respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)]) {
        [self.hDelegate tableView:tableView willDisplayHeaderView:view forSection:(NSInteger)section];
    }
}

//- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
//{
//    [self.hDelegate tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section];
//}
//
//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
//{
//    [self.hDelegate tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath];
//}
//- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    [self.hDelegate tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section];
//}
//- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
//{
//    [self.hDelegate tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section];
//}
// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:widthForRowAtIndexPath:)]) {
        return [self.hDelegate tableView:tableView widthForRowAtIndexPath:(NSIndexPath *)indexPath];
    }
    return 0.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:widthForHeaderInSection:)]){
        return [self.hDelegate tableView:tableView widthForHeaderInSection:(NSInteger)section];
    }
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([self.hDelegate respondsToSelector:@selector(tableView:widthForFooterInSection:)]) {
        return [self.hDelegate tableView:tableView widthForFooterInSection:section];
    }
    return 0.0;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [self.hDelegate tableView:tableView estimatedWidthForRowAtIndexPath:indexPath];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//{
//    return [self.hDelegate tableView:tableView estimatedWidthForHeaderInSection:section];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
//{
//    return [self.hDelegate tableView:tableView estimatedWidthForFooterInSection:section];
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = nil;
    if ([self.hDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        headerView = [self.hDelegate tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section];
        headerView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footerView = nil;
    if ([self.hDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        footerView = [self.hDelegate tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section];
        footerView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    return footerView;
}

//// Accessories (disclosures).
//
//- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0);
//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
//
//// Selection
//
//// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
//// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
//- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
//- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
//
//// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
//// Called after the user changes the selection.
//
//
//// Editing
//
//// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0);
//
//
//- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;
//
//
//- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
//- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;
//
//- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;
//
//
//
//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return
//
//- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0);
//- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);
//- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);

#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.hDelegate scrollViewDidScroll:self];
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidZoom:)]) {
        [self.hDelegate scrollViewDidZoom:self];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [self.hDelegate scrollViewWillBeginDragging:self];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity: targetContentOffset:)]) {
        [self.hDelegate scrollViewWillEndDragging:self withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [self.hDelegate scrollViewDidEndDragging:self willDecelerate:decelerate];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)]) {
        [self.hDelegate scrollViewWillBeginDecelerating:self];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        [self.hDelegate scrollViewDidEndDecelerating:self];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
        [self.hDelegate scrollViewDidEndScrollingAnimation:self];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        return [self.hDelegate viewForZoomingInScrollView:self];
    }
    return nil;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)]) {
        [self.hDelegate scrollViewWillBeginZooming:scrollView withView:view];
    }
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)]) {
        [self.hDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
    }
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)]) {
        return [self.hDelegate scrollViewShouldScrollToTop:self];
    }
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    if ([self.hDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]) {
        [self.hDelegate scrollViewDidScrollToTop:self];
    }
}

@end
