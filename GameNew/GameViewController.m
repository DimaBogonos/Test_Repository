//
//  GameViewController.m
//  GameNew
//
//  Created by Dima Bogonos on 3/21/16.
//  Copyright © 2016 Dima Bogonos. All rights reserved.
//

#import "GameViewController.h"
#import "MenuViewController.h"

@implementation GameViewController

-(void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.restartView.alpha = 0;
    [self blockAdd];
    
    UITapGestureRecognizer* tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    ////////////
    self.navigationController.navigationBarHidden = YES;

    
}
- (UIImage*) randomImage    {
    
    int im = (arc4random() % 3);
    
    if (im == 0) {
        
        UIImage* image = [UIImage imageNamed:@"Apple"];
        return image;
        
    }else if (im == 1){
        UIImage* image = [UIImage imageNamed:@"Orange"];
        return image;
        
    }else if (im == 2){
        UIImage* image = [UIImage imageNamed:@"Banana"];
        return image;
        
    }else if (im == 3){
        UIImage* image = [UIImage imageNamed:@"Kiwi"];
        return image;
        
    }
    
    return nil;
    
}


-(UIColor*) randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat bl = (CGFloat)(arc4random() % 3);
    
    if (bl == 1) {
        return [UIColor blackColor];
    } else{
        return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    }
}

-(void) blockAdd {
    self.recursTest = YES;
    
    CGFloat koordinateY =  arc4random_uniform(CGRectGetMaxX(self.view.frame));

    //CGFloat koordinateY = arc4random(25) % 100;
    
    CGFloat x = koordinateY;
    
    CGFloat y = 25;
    
    CGFloat time = 5;
    
    UIImageView* view1 = [[UIImageView alloc] initWithFrame:CGRectMake(koordinateY, self.view.frame.size.height +50, 50, 50)];
    
    if (![self.testView.backgroundColor isEqual:[UIColor blackColor]]) {
        
        NSLog(@"stop fire");
        view1.layer.cornerRadius = 25.f;
    } else {

        NSLog(@"fire");
           view1.layer.cornerRadius = 25.f;
    }
    
    
    
    [self.view addSubview:view1];
    
    self.testView = view1;
    
    [UIView animateWithDuration: time
                          delay:0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         [UIView setAnimationRepeatCount:1];
                         
                         view1.center = CGPointMake(x, y);
                         
                         view1.image = [self randomImage];
                   
                         //view1.backgroundColor = [self randomColor];
                         
                     }
     
                     completion:^(BOOL finished) {
                         
                         NSLog(@"animation finishid! %d", finished);
                         [self.testView removeFromSuperview];
                         if (self.recursTest == YES) {
                           [self blockAdd];
                         }
                         
                        
                     }];
    
}

- (void) handleTap:(UITapGestureRecognizer*) tapGesture {
    
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    
    if ([self.testView.layer.presentationLayer hitTest: [tapGesture locationInView:self.view]]) {
        //self.testView.backgroundColor = [self randomColor];
        [self.testView removeFromSuperview];
        
        ///////////////////////lolololololololollololololololoolololololololollololoolo///////////////////////////////
       //if ([self.testView.backgroundColor isEqual:[UIColor blackColor]]) {
        if ([self.testView.image isEqual:[UIImage imageNamed:@"Apple"]]){
            CFTimeInterval paused_time = [self.view.layer convertTime:CACurrentMediaTime() fromLayer:nil];
            self.view.layer.speed = 0.0;
            self.view.layer.timeOffset = paused_time;
            
            self.restartView.alpha = 1;
            
            
            
           
        }else{
            //
            self.taps++;
            
            self.StatusTaps.text = [NSString stringWithFormat:@"Taps: %i", self.taps];
            //
            
        }
        ///////////////////////lolololololololollololololololoolololololololollololoolo///////////////////////////////
        
    }
    
    
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"menuVC"]) {
        MenuViewController *menuVC = [[MenuViewController alloc] init];
        [self.navigationController pushViewController:menuVC animated:YES];
    }
}

- (IBAction)menuButton:(id)sender {
    self.recursTest = NO;
    
}
- (IBAction)restartButton:(UIButton *)sender {
 
    self.testView.alpha = 0;
    self.restartView.alpha = 0;
    //self.view.layer.speed = 1.5;
    self.view.layer.speed = (arc4random() % 300)/100;
    
    
}

@end
