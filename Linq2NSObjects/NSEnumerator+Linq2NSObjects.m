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
    for(id item in self)
        result = accumulator(result, item);
    
    return result;
}

@end
