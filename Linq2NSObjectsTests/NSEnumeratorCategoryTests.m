//
//  NSEnumeratorCategoryTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "NSEnumeratorCategoryTests.h"
#import "NSEnumerator+Linq2NSObjects.h"
#import "RangeIterator.h"

@interface NSEnumeratorCategoryTests ()
@property (nonatomic, strong, readonly) NSArray *sampleArray;
@end

@implementation NSEnumeratorCategoryTests
@synthesize sampleArray = _sampleArray;

-(NSArray *)sampleArray
{
    if (!_sampleArray)
        _sampleArray = @[@"Piper", @"Lauren", @"Cory", @"Colin", @"Jennifer"];
    
    return _sampleArray;
}

-(void)testFirst
{
    STAssertEquals([self.sampleArray.objectEnumerator first], [self.sampleArray objectAtIndex:0], @"First category method failed.");
    
    NSString *searchValue = [self.sampleArray objectAtIndex:1];
    NSString *valueFound = [self.sampleArray.objectEnumerator first:^BOOL(id element) {
        return element == searchValue;
    }];
    
    STAssertEquals(valueFound, searchValue, @"First category method with predicate failed.");
}

-(void)testAggregate
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    Accumulator sum = ^NSNumber *(NSNumber *aggregate, NSNumber *item)
    {
        int newValue = aggregate.integerValue + item.integerValue;
        return [NSNumber numberWithInt:newValue];
    };
    
    int expectedValue = 0;
    for (int i = start; i < start + count; i++)
        expectedValue += i;
    
    int actualValue = ((NSNumber *)[rangeIterator aggregateWithSeed:0 andAccumulator:sum]).integerValue;
    STAssertEquals(actualValue, expectedValue, @"Aggregate category method failed.");
}

@end
