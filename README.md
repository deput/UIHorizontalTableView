# UIHorizontalTableView
A horizontal tableview used as simple as UITableView

# Getting Started
Using UIHorizontalTable is just like using UItableView

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
