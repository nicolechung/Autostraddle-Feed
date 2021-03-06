//
//  ARTableHeaderView.m
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import "ARTableHeaderView.h"

@interface ARTableHeaderView()
{
    UILabel* label;
}

@end

@implementation ARTableHeaderView

-(id)initWithText:(NSString*)text
{
    UIImage* img = [UIImage imageNamed:@"arss_header.png"];
    if ((self = [super initWithImage:img]))
    {
        // Initialization code
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 70)];
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor grayColor];
        label.shadowOffset = CGSizeMake(1, 1);
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:20];
        label.text = text;
        label.numberOfLines = 2;
        [self addSubview:label];
    }
    return self;
}

-(void)setText:(NSString*)text
{
    label.text = text;
}
@end
