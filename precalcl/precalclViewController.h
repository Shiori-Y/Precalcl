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
    double currentValue;
    int operation;
}
- (IBAction)number:(id)sender;

- (IBAction)op:(id)sender;

- (IBAction)clear:(id)sender;

- (IBAction)equal:(id)sender;



@end
