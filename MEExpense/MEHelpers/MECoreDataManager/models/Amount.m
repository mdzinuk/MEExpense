#import "Amount.h"

@interface Amount ()
@end

@implementation Amount
+ (instancetype)initWithAmount:(double )value
                      currency:(NSString* )currency
                       context:(NSManagedObjectContext* )context {
    Amount *amount = (Amount*)[Amount insertInManagedObjectContext:context];
    amount.value = @(value);
    amount.currency = currency;
    return amount;
}
@end
