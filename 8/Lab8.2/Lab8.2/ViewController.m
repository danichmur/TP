//
//  ViewController.m
//  Lab8.2
//
//  Created by Daniel Muraveyko on 16/05/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordAuth;
@property (weak, nonatomic) IBOutlet UITextField *loginAuth;
@property (weak, nonatomic) IBOutlet UITextField *loginReg;
@property (weak, nonatomic) IBOutlet UITextField *mailReg;
@property (weak, nonatomic) IBOutlet UITextField *passReg;
@property (weak, nonatomic) IBOutlet UITextField *repeatPassReg;
@property (weak, nonatomic) IBOutlet UISwitch *rulesReg;

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

- (IBAction)registrationButtonPressed:(id)sender {
    if(![_loginReg.text isEqualToString:@""] || ![_passReg.text isEqualToString:@""]){
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:_loginReg.text forKey:@"login"];
        [user setObject:_passReg.text forKey:@"pass"];
        [self performSegueWithIdentifier:@"closeZone" sender:self];
    }
}
- (IBAction)loginButtonPressed:(id)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if([user objectForKey:@"login"] != nil || [user objectForKey:@"pass"] != nil){
        [self performSegueWithIdentifier:@"closeZone" sender:self];
    }
}


@end
