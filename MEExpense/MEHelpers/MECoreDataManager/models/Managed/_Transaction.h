// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Transaction.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Amount;
@class Category;

@interface TransactionID : NSManagedObjectID {}
@end

@interface _Transaction : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TransactionID *objectID;

@property (nonatomic, strong, nullable) NSDate* creationDate;

@property (nonatomic, strong, nullable) Amount *amount;

@property (nonatomic, strong, nullable) Category *category;

@end

@interface _Transaction (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(nullable NSDate*)value;

- (nullable Amount*)primitiveAmount;
- (void)setPrimitiveAmount:(nullable Amount*)value;

- (nullable Category*)primitiveCategory;
- (void)setPrimitiveCategory:(nullable Category*)value;

@end

@interface TransactionAttributes: NSObject 
+ (NSString *)creationDate;
@end

@interface TransactionRelationships: NSObject
+ (NSString *)amount;
+ (NSString *)category;
@end

NS_ASSUME_NONNULL_END
