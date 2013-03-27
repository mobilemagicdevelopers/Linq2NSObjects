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
    STAssertEquals([self.sampleArray.objectEnumerator first], [self.sampleArray objectAtIndex:0], @"First category method failed.");
}

-(void)testLast
{
    STAssertEquals([self.sampleArray.objectEnumerator first], [self.sampleArray objectAtIndex:0], @"First category method failed.");
    
    NSString *searchValue = self.sampleArray.lastObject;
    NSString *valueFound = [self.sampleArray.objectEnumerator last:^BOOL(id element) {
        return element == searchValue;
    }];
    
    STAssertEquals(valueFound, searchValue, @"Last category method with predicate failed.");
    STAssertEquals([self.sampleArray.objectEnumerator last], searchValue, @"Last category method failed.");
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

-(void)testToDictionary
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    
    KeyObjectSelector keySelector = ^NSNumber *(NSNumber *item){ return item; };
    Selector valueSelector = ^NSString *(NSNumber *item){ return [NSString stringWithFormat:@"%i", item.integerValue]; };
    
    NSDictionary *dictionary = [rangeIterator toDictionaryWithKeySelector:keySelector andValueSelector:valueSelector];
    for (NSNumber *number in dictionary.keyEnumerator)
    {
        NSString *actualValue = [dictionary objectForKey:number];
        NSString *expectedValue = valueSelector(number);
        STAssertTrue([actualValue isEqualToString:expectedValue], @"ToDictionary Value not equal.");
    }
    
    STAssertEquals(dictionary.count, (uint)count, @"ToDictionary has unexpected length.");
}

-(void)testToArray
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    NSArray *array = [[rangeIterator select:^NSString *(NSNumber *item) {
        return [NSString stringWithFormat:@"%i", item.integerValue];
    }] toArray];
    
    for (int i = 0; i < count; i++)
    {
        NSString *expected = [NSString stringWithFormat:@"%i", i + start];
        NSString *actual = [array objectAtIndex:i];
        STAssertTrue([actual isEqualToString:expected], @"ToArray failed to produce valid array.");
    }
}

@end
