//
//  DDNetworkingAPI+PostFocusApi.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/8.
//

#import "DDNetworkingAPI+PostFocusApi.h"

 

@implementation DDNetworkingAPI (PostFocusApi)

#pragma mark —— App帖子关注相关接口
/// 添加 POST
NSString *postFansListPOST;
+(void)postFansListPOST:(id _Nullable)parameters
           successBlock:(MKDataBlock _Nullable)successBlock
           failureBlock:(MKDataBlock _Nullable)failureBlock{
//    NSDictionary *parameterss = @{};
//    NSDictionary *headers = @{};
    
    [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {

        request.server = NSObject.BaseUrl;
        request.url = [request.server stringByAppendingString:NSObject.postFansListPOST.url];
        NSLog(@"request.URLString = %@",request.url);
        
        request.methodType = ZBMethodTypePOST;//默认为GET
        request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
        request.parameters = parameters;//与公共配置 Parameters 兼容
//        request.headers = headers;//与公共配置 Headers 兼容
        request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
        request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
        if (![NSString isNullString:[DataManager sharedInstance].tag]) {
            request.userInfo = @{@"info":[DataManager sharedInstance].tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        
        {
//            request.filtrationCacheKey = @[@""];//与公共配置 filtrationCacheKey 兼容
//            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
//            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
           
            /**
             多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做
             使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
             */
//            request.keepType=ZBResponseKeepNone;
        }//一些临时的其他的配置
        
    }progress:^(NSProgress * _Nullable progress){
        NSLog(@"进度 = %f",progress.fractionCompleted * 100);
    }success:^(id  _Nullable responseObject,
               ZBURLRequest * _Nullable request){
        if ([responseObject isKindOfClass:NSDictionary.class]) {
            NSDictionary *dataDic = (NSDictionary *)responseObject;
            DDResponseModel *model = [DDResponseModel mj_objectWithKeyValues:dataDic];
            // 公共请求错误直接抛出
            if (model.code != HTTPResponseCodeSuccess) {
                [WHToast toastMsg:model.msg];
            }else{
                if (successBlock) {
                    successBlock(model);
                }
            }
        }else{
            [WHToast toastMsg:[@"异常接口" stringByAppendingString:NSObject.postFansListPOST.funcName]];
        }
    }failure:^(NSError * _Nullable error){
        NSLog(@"error = %@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }finished:^(id  _Nullable responseObject,
                NSError * _Nullable error,
                ZBURLRequest * _Nullable request){
        NSLog(@"请求完成 userInfo:%@",request.userInfo);
    }];
}
/// 删除 GET
NSString *postFocusDeleteGET;
+(void)postFocusDeleteGET:(id _Nullable)parameters
             successBlock:(MKDataBlock _Nullable)successBlock
             failureBlock:(MKDataBlock _Nullable)failureBlock{
//    NSDictionary *parameterss = @{};
//    NSDictionary *headers = @{};
    
    [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {

        request.server = NSObject.BaseUrl;
        request.url = [request.server stringByAppendingString:NSObject.postFocusDeleteGET.url];
        NSLog(@"request.URLString = %@",request.url);
        
        request.methodType = ZBMethodTypeGET;//默认为GET
        request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
        request.parameters = parameters;//与公共配置 Parameters 兼容
//        request.headers = headers;//与公共配置 Headers 兼容
        request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
        request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
        if (![NSString isNullString:[DataManager sharedInstance].tag]) {
            request.userInfo = @{@"info":[DataManager sharedInstance].tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        
        {
//            request.filtrationCacheKey = @[@""];//与公共配置 filtrationCacheKey 兼容
//            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
//            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
           
            /**
             多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做
             使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
             */
//            request.keepType=ZBResponseKeepNone;
        }//一些临时的其他的配置
        
    }progress:^(NSProgress * _Nullable progress){
        NSLog(@"进度 = %f",progress.fractionCompleted * 100);
    }success:^(id  _Nullable responseObject,
               ZBURLRequest * _Nullable request){
        if ([responseObject isKindOfClass:NSDictionary.class]) {
            NSDictionary *dataDic = (NSDictionary *)responseObject;
            DDResponseModel *model = [DDResponseModel mj_objectWithKeyValues:dataDic];
            // 公共请求错误直接抛出
            if (model.code != HTTPResponseCodeSuccess) {
                [WHToast toastMsg:model.msg];
            }else{
                if (successBlock) {
                    successBlock(model);
                }
            }
        }else{
            [WHToast toastMsg:[@"异常接口" stringByAppendingString:NSObject.postFocusDeleteGET.funcName]];
        }
    }failure:^(NSError * _Nullable error){
        NSLog(@"error = %@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }finished:^(id  _Nullable responseObject,
                NSError * _Nullable error,
                ZBURLRequest * _Nullable request){
        NSLog(@"请求完成 userInfo:%@",request.userInfo);
    }];
}
/// 帖子关注用户列表 GET
NSString *postFocusListGET;
+(void)postFocusListGET:(id _Nullable)parameters
           successBlock:(MKDataBlock _Nullable)successBlock{
//    NSDictionary *parameterss = @{};
//    NSDictionary *headers = @{};
    
    [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {

        request.server = NSObject.BaseUrl;
        request.url = [request.server stringByAppendingString:NSObject.postFocusListGET.url];
        NSLog(@"request.URLString = %@",request.url);
        
        request.methodType = ZBMethodTypeGET;//默认为GET
        request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
        request.parameters = parameters;//与公共配置 Parameters 兼容
//        request.headers = headers;//与公共配置 Headers 兼容
        request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
        request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
        if (![NSString isNullString:[DataManager sharedInstance].tag]) {
            request.userInfo = @{@"info":[DataManager sharedInstance].tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        
        {
//            request.filtrationCacheKey = @[@""];//与公共配置 filtrationCacheKey 兼容
//            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
//            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
           
            /**
             多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做
             使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
             */
//            request.keepType=ZBResponseKeepNone;
        }//一些临时的其他的配置
        
    }progress:^(NSProgress * _Nullable progress){
        NSLog(@"进度 = %f",progress.fractionCompleted * 100);
    }success:^(id  _Nullable responseObject,
               ZBURLRequest * _Nullable request){
        if ([responseObject isKindOfClass:NSDictionary.class]) {
            NSDictionary *dataDic = (NSDictionary *)responseObject;
            DDResponseModel *model = [DDResponseModel mj_objectWithKeyValues:dataDic];
            // 公共请求错误直接抛出
            if (model.code != HTTPResponseCodeSuccess) {
                [WHToast toastMsg:model.msg];
            }else{
                if (successBlock) {
                    successBlock(model);
                }
            }
        }else{
            [WHToast toastMsg:[@"异常接口" stringByAppendingString:NSObject.postFocusListGET.funcName]];
        }
    }failure:^(NSError * _Nullable error){
        NSLog(@"error = %@",error);
    }finished:^(id  _Nullable responseObject,
                NSError * _Nullable error,
                ZBURLRequest * _Nullable request){
        NSLog(@"请求完成 userInfo:%@",request.userInfo);
    }];
}

@end
