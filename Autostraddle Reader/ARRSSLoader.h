//
//  ARRSSLoader.h
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RSSLoaderCompleteBlock)(NSString* title, NSArray* results);

@interface ARRSSLoader : NSObject
-(void)fetchRSSWithURL:(NSURL *)url complete:(RSSLoaderCompleteBlock)c;
@end
