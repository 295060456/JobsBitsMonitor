//
//  NetworkingAPI.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "DDNetworkingAPI.h"
#import "DDNetworkingAPI+StatisticsApi.h"//数据统计相关接口
#import "DDNetworkingAPI+LoginApi.h"//App登录信息相关接口
#import "DDNetworkingAPI+AdsApi.h"//App广告相关接口
#import "DDNetworkingAPI+FriendsRelationshipApi.h"//App好友关系相关接口
#import "DDNetworkingAPI+ConfigApi.h"//App获取配置信息
#import "DDNetworkingAPI+EarnApi.h"//App看视频获得金币奖励
#import "DDNetworkingAPI+CommentApi.h"//App评论相关接口
#import "DDNetworkingAPI+WalletApi.h"//App钱包相关接口
#import "DDNetworkingAPI+PostFansApi.h"//App帖子粉丝相关接口
#import "DDNetworkingAPI+PostFocusApi.h"//App帖子关注相关接口
#import "DDNetworkingAPI+PostCommentApi.h"//App帖子评论相关接口
#import "DDNetworkingAPI+MsgApi.h"//App消息相关接口
#import "DDNetworkingAPI+MsgStateApi.h"//App消息状态相关接口
#import "DDNetworkingAPI+FeedBackApi.h"//App意见反馈相关接口
#import "DDNetworkingAPI+UserFansApi.h"//App用户粉丝相关接口
#import "DDNetworkingAPI+UserAttentionApi.h"//App用户关注相关接口
#import "DDNetworkingAPI+UserPostApi.h"//App用户帖子相关接口
#import "DDNetworkingAPI+UserInfoApi.h"//App用户信息相关接口
#import "DDNetworkingAPI+Vip.h"//AppVip相关接口
/*
 * 只定义successBlock处理我们想要的最正确的答案,并向外抛出
 * 错误在内部处理不向外抛出
 */
@implementation DDNetworkingAPI
/// 【只有Body参数、不需要错误回调】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(MKDataBlock _Nullable)successBlock{
    
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    
    {
        NSMutableArray *paramMutArr = NSMutableArray.array;
        
        if (!parameters) {
            parameters = NSDictionary.dictionary;
        }
        
        [paramMutArr addObject:parameters];
        
        if (successBlock) {
            [paramMutArr addObject:successBlock];
        }

        NSString *funcName = [requestApi stringByAppendingString:@":successBlock:"];
        [NSObject methodName:funcName
                   targetObj:(DDNetworkingAPI *)self
                 paramarrays:paramMutArr];
    }
}
///【只有Body参数、需要错误回调的】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(MKDataBlock _Nullable)successBlock
     failureBlock:(MKDataBlock _Nullable)failureBlock{
    
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    
    {
        NSMutableArray *paramMutArr = NSMutableArray.array;
        
        if (!parameters) {
            parameters = NSDictionary.dictionary;
        }
        
        if (parameters) {
            [paramMutArr addObject:parameters];
        }
        
        if (successBlock) {
            [paramMutArr addObject:successBlock];
        }
        
        if (failureBlock) {
            [paramMutArr addObject:failureBlock];
        }

        NSString *funcName = [requestApi stringByAppendingString:@":successBlock:failureBlock:"];
        [NSObject methodName:funcName
                   targetObj:(DDNetworkingAPI *)self
                 paramarrays:paramMutArr];
    }
}
#pragma mark —— 特殊的上传文件的网络请求
/// 上传【图片】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
     successBlock:(MKDataBlock _Nullable)successBlock
     failureBlock:(MKDataBlock _Nullable)failureBlock{

    NSMutableArray *paramMutArr = nil;
    
    if (uploadImagesParamArr) {
        paramMutArr = [NSMutableArray arrayWithArray:uploadImagesParamArr];
    }else{
        paramMutArr = NSMutableArray.array;
    }
    
    if (successBlock) {
        [paramMutArr addObject:successBlock];
    }
    
    if (failureBlock) {
        [paramMutArr addObject:failureBlock];
    }
    
    NSString *funcName = [requestApi stringByAppendingString:@":uploadImageDatas:successBlock:failureBlock:"];
    [NSObject methodName:funcName
               targetObj:(DDNetworkingAPI *)self
             paramarrays:paramMutArr];
}
/// 上传【视频】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
     successBlock:(MKDataBlock _Nullable)successBlock
     failureBlock:(MKDataBlock _Nullable)failureBlock{
    
    NSMutableArray *paramMutArr = nil;
    
    if (uploadVideosParamArr) {
        paramMutArr = [NSMutableArray arrayWithArray:uploadVideosParamArr];
    }else{
        paramMutArr = NSMutableArray.array;
    }
    
    if (successBlock) {
        [paramMutArr addObject:successBlock];
    }
    
    if (failureBlock) {
        [paramMutArr addObject:failureBlock];
    }
    
    NSString *funcName = [requestApi stringByAppendingString:@":uploadVideo:successBlock:failureBlock:"];
    [NSObject methodName:funcName
               targetObj:(DDNetworkingAPI *)self
             paramarrays:paramMutArr];
}
/// 请求成功的处理代码
+(void)networkingSuccessHandleWithData:(DDResponseModel *_Nullable)responseObject
                               request:(ZBURLRequest *_Nullable)request
                          successBlock:(MKDataBlock _Nullable)successBlock
                          failureBlock:(MKDataBlock _Nullable)failureBlock{

    if ([responseObject isKindOfClass:DDResponseModel.class]) {
        // 公共请求错误直接抛出
        if (responseObject.code == HTTPResponseCodeSuccess) {
            NSLog(@"请求成功");
            if (successBlock) successBlock(responseObject);
        }else if (responseObject.code == HTTPResponseCodeServeError ||// 服务器异常
                  responseObject.code == HTTPResponseCodeLoginDate  ||// 登录已过期，请重新登录
                  responseObject.code == HTTPResponseCodeAuthorizationFailure ||// 授权失败
                  responseObject.code == HTTPResponseCodeLeakTime ||// 限定时间内超过请求次数
                  responseObject.code == HTTPResponseCodeRiskOperation ||// 风险操作
                  responseObject.code == HTTPResponseCodeNoSettingTransactionPassword ||// 未设置交易密码
                  responseObject.code == HTTPResponseCodeOffline){//帐号已在其他设备登录
            NSLog(@"一些特殊定义的服务器错误❌");
            [WHToast toastErrMsg:responseObject.msg];
            if (failureBlock) failureBlock(responseObject);
        }else{
            NSLog(@"其他代号,展示msg内容即可");
            [WHToast toastErrMsg:responseObject.msg];
            if (failureBlock) failureBlock(responseObject);
        }
    }else{
        NSLog(@"responseObject 不是 DDResponseModel类型");
    }
}

@end
