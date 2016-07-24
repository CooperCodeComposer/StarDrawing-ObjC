//
//  StarView.h
//  StarDrawing-ObjC
//
//  Created by Alistair Cooper on 5/10/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
-(void)makeStarRotate;

@property CALayer *starLayer;
@property CGFloat angle;

@end
