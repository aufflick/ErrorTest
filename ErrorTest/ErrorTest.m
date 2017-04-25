//
//  ErrorTest.m
//  ErrorTest
//
//  Created by Mark Aufflick on 25/4/17.
//  Copyright © 2017 The High Technology Bureau. All rights reserved.
//

#import "ErrorTest.h"

@implementation ErrorTest

- (BOOL)doWithError:(NSError *__autoreleasing *)error
{
    NSDictionary *foo = @{ @"foo": @YES, @"bar": @NO };
    
    __block BOOL ret = YES;
    
    [foo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![self failOnNo:obj error:error])
        {
            ret = NO;
            *stop = YES;
        }
    }];
    
    return ret;
}

- (BOOL)failOnNo:(NSNumber *)value error:(NSError **)error
{
    if (value.boolValue)
        return YES;
    
    if (error)
        *error = [NSError errorWithDomain:@"Oops" code:42 userInfo:@{ NSLocalizedDescriptionKey: @"Oops" }];
    
    return NO;
}

@end
