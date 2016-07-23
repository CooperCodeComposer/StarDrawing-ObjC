//
//  ViewController.h
//  StarDrawing-ObjC
//
//  Created by Alistair Cooper on 5/10/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "StarView.h"

@interface ViewController : UIViewController
{
    StarView *starView;
    CALayer *starLayer;
}

@property UIView *skyView;
@property CGFloat angle;

@end

