// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Transaction.m instead.

#import "_Transaction.h"

@implementation TransactionID
@end

@implementation _Transaction

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Transaction" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Transaction";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Transaction" inManagedObjectContext:moc_];
}

- (TransactionID*)objectID {
	return (TransactionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic amount;

@dynamic category;

@end

@implementation TransactionAttributes 
+ (NSString *)creationDate {
	return @"creationDate";
}
@end

@implementation TransactionRelationships 
+ (NSString *)amount {
	return @"amount";
}
+ (NSString *)category {
	return @"category";
}
@end

