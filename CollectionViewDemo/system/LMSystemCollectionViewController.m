//
//  LMSystemCollectionViewController.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/28.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMSystemCollectionViewController.h"
#import "LMCollectionViewCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LMSystemCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong)UICollectionView * collectionView;
@property (nonatomic , strong)UICollectionViewFlowLayout * layout;

@end

@implementation LMSystemCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        /**
         1.这里需要注册自定义的cell，以及headerView和footerView
         2. 标识符一定要和下面方法中一致
         */
        [_collectionView registerClass:[LMCollectionViewCell class] forCellWithReuseIdentifier:KLMCollectionViewCell];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeaderView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionViewFooterView"];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
//布局对象懒加载
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];//继承于UICollectionViewLayout
        _layout.itemSize = CGSizeMake(110, 150);
        /**
         1. 下面这些属性很重要可以替代下面被编译掉的方法
         2. 因为UICollectionViewFlowLayout继承于UICollectionViewLayout，封装了一些简单的布局属性，所以需要简单的布局可以直接使用相应属性
         */
        _layout.minimumInteritemSpacing = 10;//每个item的最小列间距
        _layout.minimumLineSpacing = 5;//每个item的最小行间距
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);//每个分区距（上，左，下，右）间距
        _layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 30);
        _layout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
        
        
    }
    return _layout;
}
#pragma 代理方法
//分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3.0;
}
//返回每个分区item数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9.0;
}
//返回item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:KLMCollectionViewCell forIndexPath:indexPath];
    if (!cell) {
        
        cell = [[LMCollectionViewCell alloc]init];
        
    }
    cell.bottomLab.text = [NSString stringWithFormat:@"{%ld,%ld}",indexPath.section,indexPath.row];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionViewHeaderView" forIndexPath:indexPath ];
        headerView.backgroundColor = [UIColor redColor];
        UILabel * titleLab = [[UILabel alloc]initWithFrame:headerView.bounds];
        titleLab.text = [NSString stringWithFormat:@"这是第%ld个分区的区头",indexPath.section];
        titleLab.textColor = [UIColor blackColor];
        [headerView addSubview:titleLab];
        return headerView;
    }
    else if (kind == UICollectionElementKindSectionFooter)
    {
        UICollectionReusableView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionViewFooterView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor purpleColor];
        UILabel * footerLab = [[UILabel alloc]initWithFrame:footerView.bounds];
        footerLab.text = [NSString stringWithFormat:@"这是第%ld分区的区尾",indexPath.section];
        footerLab.textColor = [UIColor blackColor];
        [footerView addSubview:footerLab];
        return footerView;
    }
    return nil;
}
//设置每个item的尺寸
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(90, 130);
//}
//设置每个item的UIEdgeInsets（上，左，下，右）
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
//设置每个item的最小列间距
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
//设置每个item的最小行间距
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 15;
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(SCREEN_WIDTH-20, 65);
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(SCREEN_WIDTH-40,44);
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
