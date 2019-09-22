//
//  NetworkManager.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 21/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "NetworkManager.h"
#import "NSDictionary+URLEncoding.h"

@interface NetworkManager ()
- (nonnull NSURL*)buildQueryURLFor:(NSString* )path with:(NSDictionary* )items;
@end

@implementation NetworkManager
static NSString* baseURL = @"http://www.apilayer.net/api";
static NSString* APIKey =  @"e06ee648d984606e6470ce30df174c1b";

+ (NetworkManager* )sharedManager {
    static NetworkManager* instantManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instantManager = [[self alloc] init];
    });
    return instantManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        return self;
    }
    return nil;
}
- (void)taskWith:(NSString* )path andParam:(NSDictionary* )params completionHandler:(MENetworkResponse)completion {
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]
                                  dataTaskWithURL:[self buildQueryURLFor:path with:params]
                                  completionHandler:^(NSData * _Nullable data,
                                                      NSURLResponse * _Nullable response,
                                                      NSError * _Nullable error) {
                                      if (error != nil) {
                                          completion(nil, error);
                                      } else {
                                          NSError *jsError = nil;
                                          id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &jsError];
                                          completion(json, jsError);
                                      }
                                  }];
    
    [task resume];
}
- (nonnull NSURL*)buildQueryURLFor:(NSString* )path with:(NSDictionary* )items {
    NSURLComponents *components = [NSURLComponents
                                   componentsWithString:
                                   [NSString stringWithFormat:@"%@%@", baseURL, path]];
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:@"access_key" value:APIKey];
    NSMutableArray *givenQueries = [NSMutableArray arrayWithArray:[items urlqueryItems]];
    [givenQueries insertObject:apiQuery atIndex:0];
    components.queryItems = givenQueries;
    return components.URL;
}
@end

