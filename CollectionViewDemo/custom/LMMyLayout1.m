//
//  LMMyLayout1.m
//  CollectionViewDemo
//
//  Created by 李敏 on 2018/8/28.
//  Copyright © 2018年 李敏. All rights reserved.
//

#import "LMMyLayout1.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LMMyLayout1()
/**内边距*/
@property (nonatomic , assign)UIEdgeInsets edgeInset;
/**行边距*/
@property (nonatomic , assign)CGFloat lineSpacing;
/**列边距*/
@property (nonatomic , assign)CGFloat columnsSpacing;
/**列数*/
@property (nonatomic , assign)NSInteger columnsNum;
/**存放所有列的高度*/
@property (nonatomic , strong)NSMutableArray * columnsHeightArray;
/**CollectionContent最大高度*/
@property (nonatomic , assign)CGFloat maxHeight;
/**存放所有的cell的布局*/
@property (nonatomic , strong)NSMutableArray * attributeArray;

@end
@implementation LMMyLayout1

-(instancetype)init{
    if (self = [super init]) {
        self.edgeInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.lineSpacing = 15;
        self.columnsSpacing = 10;
        self.columnsNum = 3;
        self.maxHeight = _edgeInset.top;
        self.columnsHeightArray = [NSMutableArray array];
        self.columnsHeightArray = [NSMutableArray arrayWithCapacity:self.columnsNum];
    }
    return self;
}

/**
 1. 重写prepareLayout方法；
 2. 大概思路就是：首先初始化layout的各种属性和变量，在- (void)prepareLayout中循环调用-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath：方法，为所有的cell添加布局，最后从-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:中将其返回即可。本例中，
 
 调用layout的方法也很简单，就正常创建layout，并赋给collectionView就可以了：
 
 */
-(void)prepareLayout{
    [super prepareLayout];
    [self.columnsHeightArray removeAllObjects];
    for (int i = 0; i < self.columnsNum; i++) {
        [self.columnsHeightArray addObject:[NSNumber numberWithInteger:self.edgeInset.top]];
    }
    [self.attributeArray removeAllObjects];
    NSInteger cellNum = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < cellNum; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributeArray addObject:attr];
    }
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributeArray;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes * attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat cellW = (SCREEN_WIDTH - self.edgeInset.left - self.columnsSpacing * (_columnsNum - 1))/self.columnsNum;
    CGFloat cellH = indexPath.item % 2 == 0 ? 160:125;
    NSInteger minHeightColumn = 0;
    CGFloat minColumnHeight = [self.columnsHeightArray[minHeightColumn] doubleValue];
    for (int i = 0; i < self.columnsNum; i++) {
        CGFloat tempHeight = [self.columnsHeightArray[i]floatValue];
        if (minColumnHeight > tempHeight) {
            minColumnHeight = tempHeight;
            minHeightColumn = i;
        }
    }
    CGFloat cellY = [self.columnsHeightArray[minHeightColumn] floatValue]+self.lineSpacing;
    CGFloat cellX = self.edgeInset.left + minHeightColumn*(cellW + self.columnsSpacing);
    attributes.frame = CGRectMake(cellX, cellY, cellW, cellH);
    CGFloat newHeight = cellH + cellY;
    [self.columnsHeightArray replaceObjectAtIndex:minHeightColumn withObject:[NSNumber numberWithInteger:newHeight]];
    return attributes;
}
-(CGSize)collectionViewContentSize{
    [self.columnsHeightArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat maxHeight = [self.columnsHeightArray[idx] floatValue];
        if (maxHeight > self.maxHeight) {
            self.maxHeight = maxHeight;
        }
    }];
    return CGSizeMake(SCREEN_WIDTH, self.maxHeight);
}
-(NSMutableArray *)attributeArray{
    if (!_attributeArray) {
        _attributeArray = [NSMutableArray array];
        
    }
    return _attributeArray;
}



@end
