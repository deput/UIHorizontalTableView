# UIHorizontalTableView
A horizontal tableview used as simple as UITableView

# Installation

The simplest way is
```
pod 'UIHorizontalTableView', '0.0.1'
```

You can also add the two files UIHorizontalTableView.h/m in your project.

# Getting Started
UIHorizontalTableView is a subclass of UItableView.Using UIHorizontalTableView is just like using UItableView.

```objectivec
@interface ViewController ()<UIHorizontalTableViewDelegate, UITableViewDataSource>
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIHorizontalTableView* h1 = [[UIHorizontalTableView alloc] initWithFrame:(CGRect){0,50,self.view.bounds.size.width, 50}];
    [self.view addSubview:h1];
    h1.hDataSource = self;
    h1.hDelegate = self;
    [h1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
@end
```
All rest is to implement delegate & datasource methods as UITableView. Here UIHozizontalTableView has its own UIHorizontalTableViewDelegate protocol which extends protocol UITableViewDelegate. The delegate methods are much alike ones in UITableview.
```objectivec
- (CGFloat) tableView:(UITableView *)tableView widthForRowAtIndexPath:(NSIndexPath *)indexPath{
    return desiredWidth;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //Customize your cell
    return cell;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return sectionNumber;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return rowsNumberInSection;
}
```
