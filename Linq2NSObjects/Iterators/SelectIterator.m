//
//  SelectIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "SelectIterator.h"

@implementation SelectIterator

-(id)nextObject
{
    id result = [_source nextObject];
    if (!result)
        return nil;
    
    return _selector(result);
}

@end
