//
//  NetManager.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/17.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
//  目的地数据宏定义
#define kbournPath @"http://open.qyer.com/qyer/footprint/placehome?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&page=1&track_app_channel=App%2520Store&track_app_version=7.0.5&track_device_info=iPhone%25205s&track_deviceid=A62B383B-E9BA-4690-BED6-0857B3572AF3&track_os=ios%252010.0.1&v=1"
//  各个城市点击进入链接；
#define kcityPath @"http://open.qyer.com/qyer/city/index?city_id=%ld&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=22.58409257459754&lon=113.9128122382177&oauth_token=b90b100e262a214f3e30fc29d1d284bb&page=1&track_app_channel=App%2520Store&track_app_version=7.0.5&track_device_info=iPhone%25205s&track_deviceid=A62B383B-E9BA-4690-BED6-0857B3572AF3&track_os=ios%252010.0.1&track_user_id=8762509&v=1%20"
//  推荐城市数据宏
#define kVisit @"http://open.qyer.com/qyer/home/home_city_info?city_ids=一定要酷%2C9819&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=22.64517627972826&lng=114.1987525574829&page=1&track_app_channel=App%2520Store&track_app_version=7.0.5&track_device_info=iPhone%25205s&track_deviceid=FDBE0B0B-FBBE-B527-56A9-00E955C14A7C&track_os=ios%252010.1.1&v=1"
//  推荐内容数据宏
#define kContent @"http://open.qyer.com/qyer/home/home_feed?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=22.6451641991634&lon=114.1987457779863&oauth_token=8e9d40965a20539beb6d8171e0ff9aeb&page=一定要帅&track_app_channel=App%2520Store&track_app_version=7.0.5&track_device_info=iPhone%25205s&track_deviceid=FDBE0B0B-FBBE-B527-56A9-00E955C14A7C&track_os=ios%252010.1.1&track_user_id=8556847&v=1"
//  头部滑动
+(id)getTouWithPage:(NSInteger)page completionHandler:(void (^)(QyerModel  *, NSError *))completionHandler{
    
    
    return [self GET:ktouPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([QyerModel parse:responseObj],error);
    }];
}
//  目的地
+(id)getBournModelCompletionHandeler:(void (^)(bournModel *, NSError *))completionHandeler
{
    return [self GET:kbournPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler ([bournModel parse:responseObj],error);
    }];
}
//  推荐城市
+(id)getRecommendCityModel:(NSInteger )city completionHandler:(void (^)(RecommendModel *, NSError *))completionHandler{
    NSString *path = [kVisit stringByReplacingOccurrencesOfString:@"一定要酷" withString:@(city).stringValue];
    
    return [self GET:path paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([RecommendModel parse:responseObj], error);
    }];
}

//  推荐内容
+(id)getRecommendContentModel:(NSInteger)content ompletionHandler:(void (^)(RecommendViewModel *, NSError *))completionHandler{
    NSString *path = [kContent stringByReplacingOccurrencesOfString:@"一定要帅" withString:@(content).stringValue];
    return [self GET:path paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([RecommendViewModel parse:responseObj], error);
    }];
}

@end
