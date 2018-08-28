//
//  LMCollectionViewCell.h
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/27.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const KLMCollectionViewCell = @"KLMCollectionViewCell";

@interface LMCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong)UIImageView * topImageView;
@property (nonatomic , strong)UILabel * bottomLab;


@end
