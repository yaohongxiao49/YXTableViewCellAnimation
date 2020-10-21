//
//  ViewController.m
//  YXTableViewCellAnimationTest
//
//  Created by ios on 2020/10/21.
//

#import "ViewController.h"
#import "NSObject+YXCategory.h"
#import "YXAnimationCell.h"
#import "YXTableViewCellAnimation.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, assign) YXTableViewCellAnimationType animationType;
@property (nonatomic, strong) UIButton *changeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"主页";
    
    UIButton *refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [refreshBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [refreshBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [refreshBtn addTarget:self action:@selector(progressRefreshBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithCustomView:refreshBtn];
    
    UIButton *alertBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [alertBtn setTitle:@"alert" forState:UIControlStateNormal];
    [alertBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [alertBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [alertBtn addTarget:self action:@selector(progressAlertBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *alertItem = [[UIBarButtonItem alloc] initWithCustomView:alertBtn];
    
    self.navigationItem.leftBarButtonItems = @[refreshItem, alertItem];
    
    _changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    [_changeBtn setTitle:@"move->切换" forState:UIControlStateNormal];
    _changeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_changeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_changeBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [_changeBtn addTarget:self action:@selector(progressChangeBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *changerefreshItem = [[UIBarButtonItem alloc] initWithCustomView:_changeBtn];
    
    self.navigationItem.rightBarButtonItem = changerefreshItem;
    
    _animationType = YXTableViewCellAnimationTypeMove;
    
    [self initView];
}

#pragma mark - progress
#pragma mark - 刷新
- (void)progressRefreshBtn {
    
    [_tableView reloadData];
}
#pragma mark - 更改动画
- (void)progressChangeBtn {
    
    [_tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO]; 
    switch (_animationType) {
        case YXTableViewCellAnimationTypeMove: {
            _animationType = YXTableViewCellAnimationTypeSpring;
            [_changeBtn setTitle:@"spring->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeSpring: {
            _animationType = YXTableViewCellAnimationTypeAlpha;
            [_changeBtn setTitle:@"alpha->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeAlpha: {
            _animationType = YXTableViewCellAnimationTypeFall;
            [_changeBtn setTitle:@"fall->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeFall: {
            _animationType = YXTableViewCellAnimationTypeShake;
            [_changeBtn setTitle:@"shake->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeShake: {
            _animationType = YXTableViewCellAnimationTypeOverTurn;
            [_changeBtn setTitle:@"turn->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeOverTurn: {
            _animationType = YXTableViewCellAnimationTypeToTop;
            [_changeBtn setTitle:@"toTop->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeToTop: {
            _animationType = YXTableViewCellAnimationTypeSpringList;
            [_changeBtn setTitle:@"springList->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeSpringList: {
            _animationType = YXTableViewCellAnimationTypeShrinkToTop;
            [_changeBtn setTitle:@"shrinkToTop->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeShrinkToTop: {
            _animationType = YXTableViewCellAnimationTypeLayDown;
            [_changeBtn setTitle:@"layDown->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeLayDown: {
            _animationType = YXTableViewCellAnimationTypeRote;
            [_changeBtn setTitle:@"rote->切换" forState:UIControlStateNormal];
            break;
        }
        case YXTableViewCellAnimationTypeRote: {
            _animationType = YXTableViewCellAnimationTypeMove;
            [_changeBtn setTitle:@"move->切换" forState:UIControlStateNormal];
            break;
        }
        default:
            break;
    }
    
    [[YXTableViewCellAnimation sharedManager] initShowAnimationWithTableViewByType:_tableView animationType:_animationType duration:1 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0];
}
#pragma mark - Lookin
- (void)progressAlertBtn {
    
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Looking" message:@"" preferredStyle:UIAlertControllerStyleAlert];
     
    UIAlertAction *exportAction = [UIAlertAction actionWithTitle:@"导出当前UI结构" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_Export" object:nil];
    }];
    UIAlertAction *twoDAction = [UIAlertAction actionWithTitle:@"2D元素" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        weakSelf.maskView.hidden = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_2D" object:nil];
    }];
    UIAlertAction *thirdDAction = [UIAlertAction actionWithTitle:@"3D元素" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        weakSelf.maskView.hidden = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_3D" object:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:exportAction];
    [alertController addAction:twoDAction];
    [alertController addAction:thirdDAction];
    [alertController addAction:cancelAction];
     
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSourceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXAnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YXAnimationCell class])];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[YXTableViewCellAnimation sharedManager] scrollShowAnimationWithTableViewCellByType:tableView cell:cell animationType:_animationType index:indexPath.row amount:self.dataSourceArr.count duration:0 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

#pragma mark - 初始化视图
- (void)initView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.yxNaviHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - self.yxNaviHeight) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.estimatedRowHeight = 100;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:[YXAnimationCell.class description] bundle:nil] forCellReuseIdentifier:NSStringFromClass([YXAnimationCell class])];
}

#pragma mark - 懒加载
- (NSMutableArray *)dataSourceArr {
    
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc] initWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18"]];
    }
    return _dataSourceArr;
}

@end
