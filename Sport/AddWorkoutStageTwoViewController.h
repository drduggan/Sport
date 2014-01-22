//
//  AddWorkoutStageTwoViewController.h
//  Sport
//
//  Created by Desmond Duggan on 1/21/14.
//  Copyright (c) 2014 Desmond Duggan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface AddWorkoutStageTwoViewController : UITableViewController <UITextFieldDelegate>

@property WorkoutType workoutType;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *repValue;
@property (nonatomic, strong) NSNumber *repCount;

@end