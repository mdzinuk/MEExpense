// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Category.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Budget;
@class Transaction;

@interface CategoryID : NSManagedObjectID {}
@end

@interface _Category : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CategoryID *objectID;

@property (nonatomic, strong, nullable) NSNumber* color;

@property (atomic) int32_t colorValue;
- (int32_t)colorValue;
- (void)setColorValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic, strong, nullable) Budget *budget;

@property (nonatomic, strong, nullable) Transaction *transaction;

@end

@interface _Category (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSNumber*)primitiveColor;
- (void)setPrimitiveColor:(nullable NSNumber*)value;

- (int32_t)primitiveColorValue;
- (void)setPrimitiveColorValue:(int32_t)value_;

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

- (nullable Budget*)primitiveBudget;
- (void)setPrimitiveBudget:(nullable Budget*)value;

- (nullable Transaction*)primitiveTransaction;
- (void)setPrimitiveTransaction:(nullable Transaction*)value;

@end

@interface CategoryAttributes: NSObject 
+ (NSString *)color;
+ (NSString *)name;
@end

@interface CategoryRelationships: NSObject
+ (NSString *)budget;
+ (NSString *)transaction;
@end

NS_ASSUME_NONNULL_END
