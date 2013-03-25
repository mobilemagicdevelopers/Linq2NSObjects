//
//  Iterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "Iterator.h"

@implementation Iterator

-(id)initWithSource:(NSEnumerator *)source
{
    if (self = [super init])
        _source = source;
    
    return self;
}

@end
