//
//  ARRSSLoader.m
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import "ARRSSLoader.h"
#import "RXMLElement.h"
#import "ARRSSItem.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation ARRSSLoader

-(void)fetchRSSWithURL:(NSURL *)url complete:(RSSLoaderCompleteBlock)c
{
    dispatch_async(kBgQueue, ^{
        
        // work in the background
        RXMLElement* rss = [RXMLElement elementFromURL:url];
        RXMLElement* title = [[rss child:@"channel"] child:@"title"];
        NSArray* items = [[rss child:@"channel"] children:@"item"];
        
        NSMutableArray* result = [NSMutableArray arrayWithCapacity:items.count];
        
        for (RXMLElement *e in items){
            // iterate over the articles
            ARRSSItem* item = [[ARRSSItem alloc] init];
            item.title = [[e child:@"title"] text];
            item.description = [[e child:@"description"] text];
            item.link = [NSURL URLWithString:[[e child:@"link"] text]];
            [result addObject: item];
        }
        c([title text], result);
    });
}

@end
