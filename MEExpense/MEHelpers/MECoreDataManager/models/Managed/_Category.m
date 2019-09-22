// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Category.m instead.

#import "_Category.h"

@implementation CategoryID
@end

@implementation _Category

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Category";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Category" inManagedObjectContext:moc_];
}

- (CategoryID*)objectID {
	return (CategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"colorValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"color"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic color;

- (int32_t)colorValue {
	NSNumber *result = [self color];
	return [result intValue];
}

- (void)setColorValue:(int32_t)value_ {
	[self setColor:@(value_)];
}

- (int32_t)primitiveColorValue {
	NSNumber *result = [self primitiveColor];
	return [result intValue];
}

- (void)setPrimitiveColorValue:(int32_t)value_ {
	[self setPrimitiveColor:@(value_)];
}

@dynamic name;

@dynamic budget;

@dynamic transaction;

@end

@implementation CategoryAttributes 
+ (NSString *)color {
	return @"color";
}
+ (NSString *)name {
	return @"name";
}
@end

@implementation CategoryRelationships 
+ (NSString *)budget {
	return @"budget";
}
+ (NSString *)transaction {
	return @"transaction";
}
@end

