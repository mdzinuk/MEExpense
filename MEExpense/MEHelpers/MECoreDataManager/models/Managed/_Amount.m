// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Amount.m instead.

#import "_Amount.h"

@implementation AmountID
@end

@implementation _Amount

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Amount" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Amount";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Amount" inManagedObjectContext:moc_];
}

- (AmountID*)objectID {
	return (AmountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"valueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"value"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic currency;

@dynamic value;

- (double)valueValue {
	NSNumber *result = [self value];
	return [result doubleValue];
}

- (void)setValueValue:(double)value_ {
	[self setValue:@(value_)];
}

- (double)primitiveValueValue {
	NSNumber *result = [self primitiveValue];
	return [result doubleValue];
}

- (void)setPrimitiveValueValue:(double)value_ {
	[self setPrimitiveValue:@(value_)];
}

@end

@implementation AmountAttributes 
+ (NSString *)currency {
	return @"currency";
}
+ (NSString *)value {
	return @"value";
}
@end

