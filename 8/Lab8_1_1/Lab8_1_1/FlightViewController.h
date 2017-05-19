//
//  FlightViewController.h
//  Lab8_1_1
//
//  Created by Daniel Muraveyko on 16/05/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Record.h"
#import "AppDelegate.h"

@interface FlightViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
-(id)initWithCities:(NSString*)cityFrom cityTo: (NSString*)cityTo;
@end
