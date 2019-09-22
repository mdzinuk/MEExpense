// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Amount.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

#import "Transaction.h"

NS_ASSUME_NONNULL_BEGIN

@interface AmountID : TransactionID {}
@end

@interface _Amount : Transaction
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AmountID *objectID;

@property (nonatomic, strong, nullable) NSString* currency;

@property (nonatomic, strong, nullable) NSNumber* value;

@property (atomic) double valueValue;
- (double)valueValue;
- (void)setValueValue:(double)value_;

@end

@interface _Amount (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveCurrency;
- (void)setPrimitiveCurrency:(nullable NSString*)value;

- (nullable NSNumber*)primitiveValue;
- (void)setPrimitiveValue:(nullable NSNumber*)value;

- (double)primitiveValueValue;
- (void)setPrimitiveValueValue:(double)value_;

@end

@interface AmountAttributes: NSObject 
+ (NSString *)currency;
+ (NSString *)value;
@end

NS_ASSUME_NONNULL_END
