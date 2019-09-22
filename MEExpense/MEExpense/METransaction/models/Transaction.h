#import "_Transaction.h"

@interface Transaction : _Transaction
+ (instancetype)initWithDate:(NSDate* )date
                    category: (NSString*)name
                    andColor:(NSNumber* )color
                      amount:(double )value
                    currency:(NSString* )currency
                     context:(NSManagedObjectContext* )context;
@end
