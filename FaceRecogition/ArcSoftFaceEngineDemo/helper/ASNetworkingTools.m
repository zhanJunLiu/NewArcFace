//
//  ASNetworkingTools.m
//  ArcSoftFaceEngineDemo
//
//  Created by 刘战军 on 2019/12/22.
//  Copyright © 2019 ArcSoft. All rights reserved.
//

#import "ASNetworkingTools.h"

@protocol ASNetworkingToolsProxy <NSObject>
/*
    这个方法实际是AFN中GET,POST调用的方法 －dataTaskWithHTTPMethod
    但是，Xcode不提示，可以设计一个协议，提示这个方法，并使编译通过
    这个方法，可以去AFN代码中直接复制过来
 */
@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;


@end

@interface ASNetworkingTools ()<ASNetworkingToolsProxy>

@end

@implementation ASNetworkingTools


//网络工具的类方法，单例模式
+(instancetype)sharedTools{
    static ASNetworkingTools *sharedTools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseUrl = [NSURL URLWithString:@"http://httpbin.org/"];
        sharedTools = [[self alloc] initWithBaseURL:baseUrl];
        
    });
    return sharedTools;
}

//封装的对象方法，把AFN方法封装为 自己的 －request（参数1，参数2，参数3，参数4）方法使用在项目中
-(void)request:(ASRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id, NSError *))finished{
    
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    
    /*
        这样把success和failure，成功和失败封装到一个finished方法中
     */
    [[self dataTaskWithHTTPMethod:methodName URLString:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id result) {
        finished(result, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        finished(nil, error);
    }] resume];
    
    
    if (method == GET) {
        
        [self GET:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            finished(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
           
            finished(nil, error);
            
        }];
        
    } else if (method == POST) {
        
        [self POST:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            finished(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
           
            finished(nil, error);
            
        }];
        
    } else if (method == HEADER) {
        
        //通过枚举判断还可调用，HEADER PUT DELETE方法
    }
}

@end
