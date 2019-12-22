//
//  ASNetworkingTools.h
//  ArcSoftFaceEngineDemo
//
//  Created by 刘战军 on 2019/12/22.
//  Copyright © 2019 ArcSoft. All rights reserved.
//

#import "AFHTTPSessionManager.h"
//枚举，列出请求的方式，还可以继续添加
typedef enum: NSInteger{
    GET,
    POST,
    HEADER
}ASRequestMethod;

NS_ASSUME_NONNULL_BEGIN

@interface ASNetworkingTools : AFHTTPSessionManager

+ (instancetype)sharedTools;
- (void)request:(ASRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void(^)(id result, NSError *error))finished;

@end

NS_ASSUME_NONNULL_END
