#import "Budget.h"
#import "Amount.h"

@interface Budget ()
@end

@implementation Budget
+ (instancetype)initWithAmount:(double )value
                      currency:(NSString* )currency
                       context:(NSManagedObjectContext* )context {
    Budget *budget = (Budget*)[Budget insertInManagedObjectContext: context];
    budget.limit = [Amount initWithAmount:value currency:currency context:context];
    return budget;
}
@end
