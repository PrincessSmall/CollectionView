//
//  LMCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/27.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMCollectionViewCell.h"
@interface LMCollectionViewCell()



@end

@implementation LMCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.topImageView];
        [self.contentView addSubview:self.bottomLab];
    }
    return self;
}
-(UIImageView *)topImageView{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc]init];
        _topImageView.backgroundColor = [UIColor yellowColor];
    }
    return _topImageView;
}
-(UILabel *)bottomLab{
    if (!_bottomLab) {
        _bottomLab = [[UILabel alloc]init];
        _bottomLab.textAlignment = NSTextAlignmentCenter;
        _bottomLab.font = [UIFont systemFontOfSize:14];
        _bottomLab.textColor = [UIColor blackColor];
        _bottomLab.backgroundColor = [UIColor grayColor];
    }
    return _bottomLab;
}
-(void)layoutSubviews{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size .height;
    self.topImageView.frame = CGRectMake(10, 3, width-20, height-23);
    self.bottomLab.frame = CGRectMake(10, CGRectGetMaxY(self.topImageView.frame)-20, width-20, 20);
}





@end
