//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/27.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "ViewController.h"
#import "LMSystemCollectionViewController.h"
#import "LMMyCollectionViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic , strong)UITableView * tableView;
/**值*/
@property (nonatomic , strong)NSArray * dataArry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    // Do any additional setup after loading the view, typically from a nib.
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSArray *)dataArry{
    if (!_dataArry) {
        _dataArry = [NSMutableArray array];
        NSArray * arr = @[@"系统CollectionView的实现",@"自定义CollectionView的实现"];
        _dataArry = arr;
    }
    return _dataArry;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArry.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"CellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =  self.dataArry[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LMSystemCollectionViewController * systemVC = [[LMSystemCollectionViewController alloc]init];
        [self.navigationController pushViewController:systemVC animated:YES];
    }
    else if (indexPath.row == 1){
        LMMyCollectionViewController * myVC = [[LMMyCollectionViewController alloc]init];
        [self.navigationController pushViewController:myVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
