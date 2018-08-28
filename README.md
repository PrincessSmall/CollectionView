#### CollectionView
<pre>
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
</pre>

####布局对象

<pre>
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
</pre>
