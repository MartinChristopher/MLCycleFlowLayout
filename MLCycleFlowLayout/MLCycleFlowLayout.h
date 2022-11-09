//
//  MLCycleFlowLayout.h
//
//  Created by Apple on 2020/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLCycleFlowLayout : UICollectionViewLayout
// Item大小
@property (nonatomic, assign) CGSize itemSize;
// CollectionView的center 到 Item的center 距离
@property (nonatomic, assign) CGFloat radius;

@end

NS_ASSUME_NONNULL_END
