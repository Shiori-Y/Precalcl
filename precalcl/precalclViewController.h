//
//  precalclViewController.h
//  precalcl
//
//  Created by 湯尾　志織 on 12/10/23.
//  Copyright (c) 2012年 Shiori Yuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface precalclViewController : UIViewController{
    IBOutlet UILabel *label;
    BOOL startInput;
    int currentValue;
    int operation;
}
- (IBAction)number:(id)sender;

//- (IBAction)point:(id)sender;

- (IBAction)op:(id)sender;

//- (IBAction)signchange:(id)sender;

- (IBAction)allclear:(id)sender;

- (IBAction)equal:(id)sender;


@end
