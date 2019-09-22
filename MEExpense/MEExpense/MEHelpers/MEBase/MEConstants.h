//
//  MEConstants.h
//  MEExpense
//
//  Created by Mohammad Arafat Hossain on 20/09/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define CORE_DATABASE @"MEExpenses"

#ifndef MEConstants_h
#define MEConstants_h

typedef void (^MEFetchDataWithError)(NSArray* _Nullable result, NSError* _Nullable error);
typedef void (^MESucccess)(BOOL isSuccess);
typedef void (^MEManagedObject)(NSManagedObject  * _Nullable object);
typedef void (^MENetworkResponse)(NSDictionary* _Nullable, NSError* _Nullable);

typedef NS_ENUM(NSUInteger, ColorType) {
    ColorTypeGreen = 0,
    ColorTypeOrange = 1,
    ColorTypeBlue = 2,
    ColorTypeRed = 3,
    ColorTypeYellow = 4,
    ColorTypeBlack = 5,
    ColorTypeUnknown
};

static NSString * _Nonnull const ColorCode[ColorTypeUnknown] = {
    [ColorTypeGreen] = @"Green",
    [ColorTypeOrange] = @"Orange",
    [ColorTypeBlue] = @"Blue",
    [ColorTypeRed] = @"Red",
    [ColorTypeYellow] = @"Yellow",
    [ColorTypeBlack] = @"Black"
};

static NSArray* _Nullable const colorCodeRawValues() {
    return @[ColorCode[ColorTypeGreen],
             ColorCode[ColorTypeOrange],
             ColorCode[ColorTypeBlue],
             ColorCode[ColorTypeRed],
             ColorCode[ColorTypeYellow],
             ColorCode[ColorTypeBlack]];
}

static NSInteger const colorCodeEnum(NSString* _Nullable rawvalue) {
    return [@[ColorCode[ColorTypeGreen],
              ColorCode[ColorTypeOrange],
              ColorCode[ColorTypeBlue],
              ColorCode[ColorTypeRed],
              ColorCode[ColorTypeYellow],
              ColorCode[ColorTypeBlack]] indexOfObject: rawvalue];
}

typedef NS_ENUM(NSUInteger, CurrencyType) {
    CurrencyTypeUSD = 0,
    CurrencyTypeNZD = 1,
    CurrencyTypUnknown
};

static NSString * _Nullable const CurrencyCode[CurrencyTypUnknown] = {
    [CurrencyTypeUSD] = @"USD",
    [CurrencyTypeNZD] = @"NZD"
};

static NSInteger const currencyCodeEnum(NSString* _Nullable rawvalue) {
    return [@[CurrencyCode[CurrencyTypeUSD],
              CurrencyCode[CurrencyTypeNZD]] indexOfObject: rawvalue];
}

static NSArray* _Nullable const currencyCodeRawValues() {
    return @[CurrencyCode[CurrencyTypeUSD],
             CurrencyCode[CurrencyTypeNZD]];
}

#endif /* MEConstants_h */
