//
//  GameViewController.h
//  GameNew
//
//  Created by Dima Bogonos on 3/21/16.
//  Copyright © 2016 Dima Bogonos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *restartView;
@property (weak, nonatomic) UIImageView* testView;
@property (assign, nonatomic) BOOL recursTest;
@property (weak, nonatomic) IBOutlet UILabel *StatusTaps;

@property (assign, nonatomic) int taps;



- (IBAction)menuButton:(id)sender;
- (IBAction)restartButton:(UIButton *)sender;
@end
