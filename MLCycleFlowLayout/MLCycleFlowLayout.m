//
//  MLCycleFlowLayout.m
//
//  Created by Apple on 2020/5/27.
//

#import "MLCycleFlowLayout.h"

@interface MLCycleFlowLayout()

@property (nonatomic, strong) NSMutableArray *attributes;

@end

@implementation MLCycleFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    NSMutableArray *attributes = [NSMutableArray array];
    long cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat width = self.collectionView.bounds.size.width ;
    CGFloat degrees = 2 * M_PI / cellCount;
    for (int i = 0; i < cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        CGFloat itemW = self.itemSize.width;
        CGFloat itemH = self.itemSize.height;
        CGFloat centerX = width * 0.5 + sin(degrees * i) * self.radius;
        CGFloat centerY = width * 0.5 - cos(degrees * i) * self.radius;
        attribute.frame = CGRectMake(0, 0, itemW, itemH);
        attribute.center = CGPointMake(centerX, centerY);
        [attributes addObject:attribute];
    }
    self.attributes = attributes;
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.attributes[indexPath.item];
}

@end

