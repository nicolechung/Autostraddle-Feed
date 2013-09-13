//
//  ARRSSItem.h
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRSSItem : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSURL* link;
@property (strong, nonatomic) NSAttributedString* cellMessage;

@end
