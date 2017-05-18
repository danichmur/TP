//
//  FlightViewController.m
//  Lab8_1_1
//
//  Created by Admin on 07.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

#import "FlightViewController.h"


@interface FlightViewController  ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic) NSString *cityFrom;
@property (nonatomic) NSString *cityTo;
@property (nonatomic) NSMutableArray *flights;

@end

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.table.dataSource = self;
    self.table.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)showFlight: (Record*) record{
    _priceLabel.text = [NSString stringWithFormat:@"%@", record.price];
    _companyLabel.text = record.aviaCompany;
    _destinationLabel.text = record.cityTo;
    _sourceLabel.text = record.cityFrom;
}*/

-(id)initWithCities:(NSString*)cityFrom cityTo:(NSString *)cityTo
{
    self = [[FlightViewController alloc] init];
    if(self)
    {
        _cityFrom = cityFrom;
        _cityTo = cityTo;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%@ %@", _cityFrom, _cityTo);
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%@ %@", _cityFrom, _cityTo);
    return [[self flights] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Record *flight = _flights[[indexPath row]];
    NSLog(@"%@ %@", _cityFrom, _cityTo);
    UITableViewCell *cell = (UITableViewCell*)[[self table] dequeueReusableCellWithIdentifier:@"flightCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"From: %@ To: %@ Company: %@ Price: %f", _cityFrom, _cityTo, (NSString*)[flight valueForKey:@"aviaCompany"], [[flight valueForKey:@"price"] floatValue]];
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    dispatch_async(dispatch_get_main_queue(), ^{
        _flights = [NSMutableArray arrayWithArray:[appDelegate getAllFlights]];
        for (int i = 0; i < [_flights count];)
        {
            if (!([(NSString*)[_flights[i] valueForKey:@"cityFrom"] isEqualToString:_cityFrom] && [(NSString*)[_flights[i] valueForKey:@"cityTo"] isEqualToString:_cityTo]))
            {
                [_flights removeObjectAtIndex:i];
            }
            else
            {
                i++;
            }
        }
        
        for (Record *record in _flights)
        {
            NSLog(@"%@", [record valueForKey:@"cityFrom"]);
        }
        NSLog(@"%@", _table);
        [_table reloadData];
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
