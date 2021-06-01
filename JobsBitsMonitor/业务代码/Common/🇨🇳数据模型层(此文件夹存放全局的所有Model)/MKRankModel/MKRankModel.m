//
//  MKRankModel.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/21.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "MKRankModel.h"

@implementation MKRankListModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id",
    };
}

@end

@implementation MKRankListModel (Custom)

static char *MKRankListModel_Custom_indexPath = "MKRankListModel_Custom_indexPath";
@dynamic indexPath;

static char *MKRankListModel_Custom_headImageURL = "MKRankListModel_Custom_headImageURL";
@dynamic headImageURL;

static char *MKRankListModel_Custom_rankStyle = "MKRankListModel_Custom_rankStyle";
@dynamic rankStyle;

#pragma mark —— @property(nonatomic,strong)NSIndexPath *indexPath;
-(NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, MKRankListModel_Custom_indexPath);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self,
                             MKRankListModel_Custom_indexPath,
                             indexPath,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,strong)NSURL *headImageURL;
-(NSURL *)headImageURL{
    NSURL *HeadImageURL = objc_getAssociatedObject(self, MKRankListModel_Custom_headImageURL);
    if (!HeadImageURL) {
        HeadImageURL = [NSURL URLWithString:self.headImage];
        objc_setAssociatedObject(self,
                                 MKRankListModel_Custom_headImageURL,
                                 HeadImageURL,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return HeadImageURL;
}

-(void)setHeadImageURL:(NSURL *)headImageURL{
    objc_setAssociatedObject(self,
                             MKRankListModel_Custom_headImageURL,
                             headImageURL,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark —— @property(nonatomic,assign)RankStyle rankStyle;
-(RankStyle)rankStyle{
    return [objc_getAssociatedObject(self, MKRankListModel_Custom_rankStyle) integerValue];
}

-(void)setRankStyle:(RankStyle)rankStyle{
    objc_setAssociatedObject(self,
                             MKRankListModel_Custom_rankStyle,
                             [NSNumber numberWithInteger:rankStyle],
                             OBJC_ASSOCIATION_ASSIGN);
}

@end

@implementation MKRankModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"data" : MKRankListModel.class
    };
}

@end
