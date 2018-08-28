//
//  LMMyCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/28.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const KLMMyCollectionViewCell = @"KLMMyCollectionViewCell";
@interface LMMyCollectionViewCell : UICollectionViewCell
@property (nonatomic , strong)UIImageView * imageView;

@property (nonatomic , strong)UILabel * lab;
@end
