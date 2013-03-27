//
//  NSEnumerator+Linq2NSObjects.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "NSEnumerator+Linq2NSObjects.h"
#import "WhereIterator.h"
#import "SkipIterator.h"
#import "TakeIterator.h"
#import "SelectIterator.h"
#import "SkipWhileIterator.h"
#import "TakeWhileIterator.h"
#import "ConcatIterator.h"

@implementation NSEnumerator (Linq2NSObjects)

-(Iterator *)where:(Predicate)predicate
{
    return [[WhereIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)skipWhile:(Predicate)predicate
{
    return [[SkipWhileIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)takeWhile:(Predicate)predicate
{
    return [[TakeWhileIterator alloc] initWithSource:self andPredicate:predicate];
}

-(Iterator *)skip:(int)count
{
    return [[SkipIterator alloc] initWithSource:self andCount:count];
}

-(Iterator *)take:(int)count
{
    return [[TakeIterator alloc] initWithSource:self andCount:count];
}

-(Iterator *)select:(Selector)selector
{
    return [[SelectIterator alloc] initWithSource:self andSelector:selector];
}

-(Iterator *)concat:(NSEnumerator *)enumerator, ...
{
    NSMutableArray *enumerators = [NSMutableArray array];
    
    va_list args;
    va_start(args, enumerator);
    
    for (NSEnumerator *item = enumerator; item != nil; item = va_arg(args, NSEnumerator*))
        [enumerators addObject:item];
    
    return [[ConcatIterator alloc] initWithSource:self andEnumerators:enumerators];
}

-(id)first
{
    return [self nextObject];
}

-(id)first:(Predicate)predicate
{
    id result = [self nextObject];;
    while (result && !predicate(result))
        result = [self nextObject];
    
    return result;
}

-(BOOL)any
{
    return [self first] != nil;
}

-(BOOL)any:(Predicate)predicate
{
    return [self first:predicate] != nil;
}

-(BOOL)contains:(id)item
{
    id element;
    while (element = [self nextObject])
        if ([element isEqual:item])
            return true;
    
    return false;
}

-(id)aggregateWithSeed:(id)seed andAccumulator:(Accumulator)accumulator
{
    id result = seed;
    for (id item in self)
        result = accumulator(result, item);
    
    return result;
}

-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector
{
    return [self toDictionaryWithKeySelector:keySelector andValueSelector:^id(id item) {
        return item;
    }];
}

-(NSDictionary *)toDictionaryWithKeySelector:(KeyObjectSelector)keySelector andValueSelector:(Selector)valueSelector
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (id item in self)
        [result setObject:valueSelector(item) forKey:keySelector(item)];
    
    return result;
}

-(NSArray *)toArray
{
    NSMutableArray *result = [NSMutableArray array];
    
    for (id item in self)
        [result addObject:item];
    
    return result;
}

@end
