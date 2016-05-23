//
//  MenuViewController.m
//  GameNew
//
//  Created by Dima Bogonos on 3/21/16.
//  Copyright © 2016 Dima Bogonos. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@implementation MenuViewController

-(void)viewDidLoad {
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"gameVC"]) {
        GameViewController *gameVC = [[GameViewController alloc] init];
        [self.navigationController pushViewController:gameVC animated:YES];
    }
}

- (IBAction)playAction:(UIButton *)sender {
    
}

@end
