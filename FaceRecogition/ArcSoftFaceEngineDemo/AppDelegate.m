//
//  AppDelegate.m
//

#import "AppDelegate.h"
#import <ArcSoftFaceEngine/ArcSoftFaceEngine.h>

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self testHttp];
    [self registerFaceEngine];
    return YES;
}

- (void)registerFaceEngine {
    NSString *appid = @"8fuEkF2US6vDrjoTaqJfXsn3CByGF5AFpevJXHJ5XVpR";
    NSString *sdkkey = @"D16Kpg88rKx1g4wncwsesaCobq8DPQLbsSGGB6mRWHLH";
    ArcSoftFaceEngine *engine = [[ArcSoftFaceEngine alloc] init];
    MRESULT mr = [engine activeWithAppId:appid SDKKey:sdkkey];
    if (mr == ASF_MOK) {
        NSLog(@"*** SDK激活成功 ***");
    } else if(mr == MERR_ASF_ALREADY_ACTIVATED){
        NSLog(@"*** SDK已激活 ***");
    } else {
        NSLog(@"*** SDK激活失败：%ld ***", mr);
    }
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)testHttp {
    NSURL* url = [NSURL URLWithString:@"https://ai.arcsoft.com.cn"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
    }];
    [dataTask resume];
}

@end
