//
//  MEBasePresenter.m
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 19/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import "MEBasePresenter.h"
#import "FacadeService.h"

@interface MEBasePresenter()<MEBasePresenterServiceProtocol>
@property (nonatomic, readwrite, assign) float convertionRate;
@property (nonatomic, readwrite, copy) NSString* latestupdate;
@property (nonatomic, strong) id<MEFacadeServiceProtocol>service;
@end

@implementation MEBasePresenter
- (instancetype)initWith:(id<MEBaseViewProtocol>)view {
    self = [super init];
    if (self) {
        self.viewContext = view;
        return self;
    }
    return nil;
}

- (void)dealloc {
    self.service = nil;
}

- (id<MEFacadeServiceProtocol>)getService {
    if (self.service == nil)  {
        self.service = [[FacadeService alloc] initWith:(id<MEBasePresenterServiceProtocol>)self];
    }
    return self.service;
}

- (UIColor* )presentationColor:(ColorType)code {
   switch (code) {
        case ColorTypeGreen:
            return [UIColor greenColor];
            break;
        case ColorTypeOrange:
            return [UIColor orangeColor];
            break;
        case ColorTypeBlue:
            return [UIColor blueColor];
            break;
        case ColorTypeRed:
            return [UIColor redColor];
            break;
        case ColorTypeYellow:
            return [UIColor yellowColor];
            break;
        default:
            return [UIColor blackColor];
            break;
    }
}

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        formatter.timeZone = [NSTimeZone localTimeZone];
        [formatter setLocale:[NSLocale currentLocale]];
    });
    return formatter;
}

+ (NSString* )timeStringFormat:(NSDate* )date {
    return [self.dateFormatter stringFromDate:date];
}

#pragma mark --
#pragma mark -- MEBasePresenterProtocol
- (void)checkLatestCurrencyRate {
    // After loadednew network data
    [self.getService didNeedtoStartTask];
    
}

#pragma mark --
#pragma mark -- MEBasePresenterServiceProtocol
- (void)didSuccessWithNetwork:(NSDictionary* _Nullable)serialized {
    //model.source = serialized[@"source"];
    self.convertionRate = [serialized[@"quotes"][@"USDNZD"] floatValue];
    NSTimeInterval interval = [serialized[@"timestamp"] doubleValue];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];;
    self.latestupdate = [MEBasePresenter timeStringFormat:date];
    
    [self.viewContext reloadview];
}
- (void)didFailWithNetwork:(NSError* _Nullable )error {
    [self.viewContext reloadview];
}
@end
