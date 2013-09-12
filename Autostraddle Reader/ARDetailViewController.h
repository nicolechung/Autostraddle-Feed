//
//  ARDetailViewController.h
//  Autostraddle Reader
//
//  Created by Nicole Chung on 2013-09-12.
//  Copyright (c) 2013 Nicole Chung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
