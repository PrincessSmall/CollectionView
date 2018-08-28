//
//  LMMyCollectionViewController.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/28.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMMyCollectionViewController.h"
#import "LMMyCollectionViewCell.h"
#import "LMMyLayout1.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LMMyCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong)UICollectionView * collectionView;
/**布局*/
@property (nonatomic , strong)LMMyLayout1 * layout;


//@property (nonatomic , strong)NSMutableArray * dataArray;

@end

@implementation LMMyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
-(LMMyLayout1 *)layout{
    if (!_layout) {
        _layout = [[LMMyLayout1 alloc]init];
    }
    return _layout;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LMMyCollectionViewCell class] forCellWithReuseIdentifier:KLMMyCollectionViewCell];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
}
#pragma mark ===============代理方法==================
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMMyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:KLMMyCollectionViewCell forIndexPath:indexPath];
    if (!cell) {
        cell = [[LMMyCollectionViewCell alloc]init];
    }
    cell.lab.text = [NSString stringWithFormat:@"{%ld,%ld}",indexPath.section,indexPath.item];

    return cell;
    
}
//-(NSMutableArray *)dataArray{
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray array];
//    }
//    return _dataArray;
//}



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
