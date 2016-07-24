//
//  ViewController.m
//  StarDrawing-ObjC
//
//  Created by Alistair Cooper on 5/10/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGradient];
    
    self.skyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                       [[UIScreen mainScreen] bounds].size.width,
                                                       [[UIScreen mainScreen] bounds].size.height)];
    [self.view addSubview:self.skyView];
    
    // set initial state of skyView off screen
    self.skyView.transform = CGAffineTransformMakeTranslation(0, 2000.0);
    
    // initialize starViews array
    self.starArray = [[NSMutableArray alloc] init];
    
    [self generateRandomStars];
    
    [self addStarsToSky];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                        
                         self.skyView.transform = CGAffineTransformMakeTranslation(0, 0);
                         
                     }completion:^(BOOL finished){
                         
                     }];
    
}

// method to generate star Views with random positions
-(void)generateRandomStars
{
    CGFloat xRandom = 0;
    CGFloat yRandom = 0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    int randNumberStars = (arc4random() % 70) + 30;    // random stars from 30-100
    
    for(int i = 0; i < randNumberStars; i++) {
        xRandom = (arc4random() % (int)width) + 1;
        yRandom = (arc4random() % (int)height) + 1;
        
        starView = [[StarView alloc] initWithFrame:CGRectMake(xRandom, yRandom, 20.0, 20.0)];
        starView.backgroundColor = [UIColor clearColor];
        
        // make star rotate
        [starView makeStarRotate];
        
        [self.starArray addObject:(starView)];
        
    }
}

// method to add stars from array to skyView
-(void)addStarsToSky
{
    for (int i = 0; i < (self.starArray.count - 1); i++) {
        
        [self.skyView addSubview:self.starArray[i]];
    }
}

// add a gradient to the main view background
-(void)addGradient {
    CAGradientLayer *gradient = [[CAGradientLayer alloc] init];
    
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor blackColor].CGColor,
                       (id)[UIColor colorWithRed:0.0 green:0.0 blue:128.0/255.0 alpha:1.0].CGColor ,
                       nil];
    gradient.frame = self.view.frame;
    [self.view.layer insertSublayer:gradient atIndex:0];
}


@end
