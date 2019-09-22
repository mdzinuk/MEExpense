#import "_Budget.h"

@interface Budget : _Budget
+ (instancetype)initWithAmount:(double )value
                      currency:(NSString* )currency
                       context:(NSManagedObjectContext* )context;
@end
