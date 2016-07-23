//
//  StarView.m
//  StarDrawing-ObjC
//
//  Created by Alistair Cooper on 5/10/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "StarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation StarView

// method to draw star with frame
-(void)drawStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation
{
    // General declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw star
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 11.12, CGRectGetMinY(frame) + 9.62);
    CGContextRotateCTM(context, -rotation * M_PI / 180);
    
    UIBezierPath *starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(0, -9.38)];
    [starPath addLineToPoint: CGPointMake(2.5, -3.26)];
    [starPath addLineToPoint: CGPointMake(9.39, -2.9)];
    [starPath addLineToPoint: CGPointMake(4.04, 1.25)];
    [starPath addLineToPoint: CGPointMake(5.8, 7.58)];
    [starPath addLineToPoint: CGPointMake(0, 4.03)];
    [starPath addLineToPoint: CGPointMake(-5.8, 7.58)];
    [starPath addLineToPoint: CGPointMake(-4.04, 1.25)];
    [starPath addLineToPoint: CGPointMake(-9.39, -2.9)];
    [starPath addLineToPoint: CGPointMake(-2.5, -3.26)];
    [starPath closePath];
    [starColor setFill];
    [starPath fill];
    
    CGContextRestoreGState(context);
    
    
}

-(void)drawRect:(CGRect)rect
{
    [self drawStarWithFrame:CGRectMake(0.0, 0.0, 70.0, 70.0) starColor:[UIColor yellowColor] rotation:0.6];
}

// method to bounce star when touched
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CGFloat currentX = self.layer.position.x;
    CGFloat currentY = self.layer.position.y;
    
    
    // create a CGPath with arcs
    CGMutablePathRef thePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(thePath, NULL, currentX, currentY);
    CGPathAddLineToPoint(thePath, NULL, currentX, (currentY - 40.0));
    CGPathAddLineToPoint(thePath, NULL, currentX, currentY);
    CGPathAddLineToPoint(thePath, NULL, currentX, (currentY - 30.0));
    CGPathAddLineToPoint(thePath, NULL, currentX, currentY);
    CGPathAddLineToPoint(thePath, NULL, currentX, (currentY - 20.0));
    CGPathAddLineToPoint(thePath, NULL, currentX, currentY);
    CGPathAddLineToPoint(thePath, NULL, currentX, (currentY - 10.0));
    CGPathAddLineToPoint(thePath, NULL, currentX, currentY);
    CGPathAddLineToPoint(thePath, NULL, currentX, (currentY - 5.0));
    CGPathAddLineToPoint(thePath, NULL, currentX, currentY);
    
    CAKeyframeAnimation *theAnimation;
    
    // create the animation object
    theAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path = thePath;
    theAnimation.duration = 1.8;
    
    // add the animation to the layer
    [self.layer addAnimation:theAnimation forKey:@"position"];
    
    
    /* stuff to make the star spin
    CABasicAnimation* yRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    yRotation.toValue = @(M_PI+(M_PI * 2));
    yRotation.fromValue = @(M_PI);
    
    CABasicAnimation* zRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    zRotation.fromValue = @(0);
    zRotation.toValue = @(-M_PI*0.2 * 0.1 * 2);
    
    // New animation, set to do nothing on the x-axis
    CABasicAnimation* xRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    xRotation.toValue = @(M_PI);
    xRotation.fromValue = @(M_PI);
    
    CAAnimationGroup* rotations = [CAAnimationGroup animation];
    rotations.duration = 1.2;
    rotations.removedOnCompletion = NO;
    rotations.fillMode = kCAFillModeForwards;
    rotations.delegate = self;
    rotations.autoreverses = YES;
    rotations.animations = @[yRotation, zRotation, xRotation];
    [self.layer addAnimation:rotations forKey:@"endRotate2"];
     */
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
