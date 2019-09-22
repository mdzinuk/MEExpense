// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Budget.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Category;
@class Amount;

@interface BudgetID : NSManagedObjectID {}
@end

@interface _Budget : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BudgetID *objectID;

@property (nonatomic, strong, nullable) Category *category;

@property (nonatomic, strong, nullable) Amount *limit;

@end

@interface _Budget (CoreDataGeneratedPrimitiveAccessors)

- (nullable Category*)primitiveCategory;
- (void)setPrimitiveCategory:(nullable Category*)value;

- (nullable Amount*)primitiveLimit;
- (void)setPrimitiveLimit:(nullable Amount*)value;

@end

@interface BudgetRelationships: NSObject
+ (NSString *)category;
+ (NSString *)limit;
@end

NS_ASSUME_NONNULL_END
