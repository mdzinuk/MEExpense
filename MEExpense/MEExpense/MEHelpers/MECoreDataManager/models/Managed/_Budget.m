// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Budget.m instead.

#import "_Budget.h"

@implementation BudgetID
@end

@implementation _Budget

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Budget" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Budget";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Budget" inManagedObjectContext:moc_];
}

- (BudgetID*)objectID {
	return (BudgetID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic category;

@dynamic limit;

@end

@implementation BudgetRelationships 
+ (NSString *)category {
	return @"category";
}
+ (NSString *)limit {
	return @"limit";
}
@end

