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
    
    [self generateRandomStars];
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(tick) userInfo:nil repeats:YES];

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
        starLayer = starView.layer;
        
        [self.skyView addSubview:starView];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)tick
{
    self.angle += .1;
    
    starView.transform = CGAffineTransformMakeRotation(self.angle);
}

// MARK: Failed alternate attempts for touch recognition on starLayer. Implementation for touch / bounce now in StarView class

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [touches anyObject];
//    CGPoint thePoint = [t locationInView:self.view];
//    
//    thePoint = [[self.starView layer] convertPoint:thePoint toLayer:[[self view] layer]];
//    
//    if([[self.starView layer].presentationLayer hitTest:thePoint])
//    {
//        NSLog(@"You touched a Shape!");
//    }
//    else{
//        NSLog(@"backgound touched");
//    }
//}

//- (IBAction)pressedLayer:(UIGestureRecognizer *)gestureRecognizer {
//    CGPoint touchPoint = [gestureRecognizer locationInView:[self view]];
//    
//    if ([[[self starLayer] presentationLayer] hitTest:touchPoint]) {
//        [self blinkLayerWithColor:[UIColor orangeColor]];
//        NSLog(@"TOUCH");
//    } else if ([[self starLayer] hitTest:touchPoint]) {
//        [self blinkLayerWithColor:[UIColor redColor]];
//        NSLog(@"TOUCH STAR");
//    }
//}




@end
