//
//  LMMyCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/28.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMMyCollectionViewCell.h"
@interface LMMyCollectionViewCell()




@end
@implementation LMMyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.lab];
    }
    return self;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor grayColor];
    }
    return _imageView;
}
-(UILabel *)lab{
    if (!_lab) {
        _lab = [[UILabel alloc]init];
        _lab.backgroundColor = [UIColor yellowColor];
    }
    return _lab;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.lab.frame = CGRectMake(0, width-25, width, 25);
}


@end
