#import "_Category.h"

@interface Category : _Category
+ (instancetype)initWithName:(NSString* )name
                    andColor:(NSNumber* )color
                      amount:(double )amount
                    currency:(NSString* )currency
                     context:(NSManagedObjectContext* )context;
@end
