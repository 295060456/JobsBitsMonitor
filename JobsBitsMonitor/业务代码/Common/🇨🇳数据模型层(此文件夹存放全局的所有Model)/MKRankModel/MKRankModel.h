//
//  MKRankModel.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/21.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKRankListModel : NSObject

@property(nonatomic,strong)NSNumber *areSelf;
@property(nonatomic,strong)NSNumber *attention;
@property(nonatomic,strong)NSNumber *goldNum;
@property(nonatomic,copy)NSString *headImage;
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *userId;

@end

@interface MKRankListModel (Custom)

@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)NSURL *headImageURL;
@property(nonatomic,assign)RankStyle rankStyle;

@end

@interface MKRankModel : BaseModel

@property(nonatomic,strong)NSArray <MKRankListModel *>*list;

@end

NS_ASSUME_NONNULL_END
