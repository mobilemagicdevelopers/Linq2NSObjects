//
//  PredicateIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "PredicateIteratorTests.h"
#import "RangeIterator.h"
#import "NSEnumerator+Linq2NSObjects.h"

@implementation PredicateIteratorTests

-(void)testCanFilterWithWhere
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    Predicate isEven = ^BOOL(NSNumber *item) { return item.integerValue % 2 == 0; };

    int actualEvenCount = 0;
    for (NSNumber *number in [rangeIterator where:isEven])
    {
        actualEvenCount++;
        STAssertTrue(isEven(number), @"Value %@ not matching predicate returned.", number);
    }
    
    int expectedEvenCount = 0;
    for (int i = start; i < start + count; i++)
        if (isEven([NSNumber numberWithInt:i]))
            expectedEvenCount++;
    
    STAssertEquals(actualEvenCount, expectedEvenCount, @"WhereIterator returned unexpected number of items.");
}

-(void)testSkipWhileTakeWhileIterator
{
    int start = 2, count = 17, skipLessThan = 4, takeLessThanEqualTo = 6;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    Predicate skip = ^BOOL(NSNumber *item) { return item.integerValue < skipLessThan; };
    Predicate take = ^BOOL(NSNumber *item) { return item.integerValue <= takeLessThanEqualTo; };
    
    int actualCount = 0;
    for (NSNumber *number in [[rangeIterator skipWhile:skip] takeWhile:take])
        STAssertEquals(number.integerValue, skipLessThan + actualCount++, @"SkipWhileIterator failed.");
    
    STAssertEquals(actualCount, takeLessThanEqualTo - skipLessThan + 1, @"TakeWhileIterator failed.");
}

@end
