#import "_Amount.h"

@interface Amount : _Amount
+ (instancetype)initWithAmount:(double )value
                      currency:(NSString* )currency
                       context:(NSManagedObjectContext* )context;
@end
