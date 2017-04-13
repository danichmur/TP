//
//  ViewController.m
//  TP_Lab6_2
//
//  Created by Daniel Muraveyko on 09/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UILabel *type;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentChange:(id)sender {
    int clickedSegment = (int)[[self  segment] selectedSegmentIndex];
    [[self type] setText: clickedSegment ? @"Coord:" : @"City:"];
}

- (IBAction)refresh:(id)sender {
    int clickedSegment = (int)[[self  segment] selectedSegmentIndex];
    NSString *s = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/find?q=%@&type=like&APPID=2a14f920dcfe16913d46ff86cb1d61b4", [[self textField] text]];
    if(clickedSegment == 1){
        s = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&type=like&APPID=2a14f920dcfe16913d46ff86cb1d61b4", [[self textField] text]];
        s = [s stringByReplacingOccurrencesOfString:@" " withString:@"&lon="];
    }
    NSURL *url = [[NSURL alloc] initWithString:s];
    NSData *contents = [[NSData alloc] initWithContentsOfURL:url];
    
    if(contents.length == 0){
        [[self label] setText:@"Not Found"];
        return;
    }
    
    NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData:contents
            options:NSJSONReadingMutableContainers error:nil];
    
    if(clickedSegment == 0)
        [self refreshCity:forcasting];
    else
        [self refreshCoords:forcasting];
}

//53.55 27.33
-(void)refreshCoords:(NSDictionary*)forcasting{
    NSDictionary *main = forcasting[@"main"];
    [[self label] setText:[NSString stringWithFormat:@"%.1f˚C", [main[@"temp"] doubleValue] - 273.15]];
}

-(void)refreshCity:(NSDictionary*)forcasting{
    NSDictionary *list = forcasting[@"list"];
    NSDictionary *main = [list valueForKey:@"main"];
    NSArray *temp = [main valueForKey:@"temp"];
    [[self label] setText:[NSString stringWithFormat:@"%.1f˚C", [temp[0] floatValue] - 273.15]];
}
@end
