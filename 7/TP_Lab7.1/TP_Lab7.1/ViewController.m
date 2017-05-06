//
//  ViewController.m
//  TP_Lab7.1
//
//  Created by Daniel Muraveyko on 21/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@property CGPoint lastPoint;
@property UIColor* color;
@property NSArray *pickerData;
@property int width;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _pickerData = @[@[@"1", @"2", @"3", @"4", @"5"],
                    @[@"red", @"blue", @"green", @"yellow", @"black"]];

    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.width = 1;
    self.color = [UIColor redColor];
}


// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[component][row];;
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 1){
        switch (row) {
            case 0:
                _color = [UIColor redColor];
                break;
            case 1:
                _color = [UIColor blueColor];
                break;
            case 2:
                _color = [UIColor greenColor];
                break;
            case 3:
                _color = [UIColor yellowColor];
                break;
            case 4:
                _color = [UIColor blackColor];
                break;
            default:
                break;
        }
    }
    else
        _width = (int)row + 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (touch.tapCount == 1) {
        _lastPoint = [touch locationInView:self.view];
    } else {
        _canvas.image = nil;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
    [_canvas.image drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _width);
    [_color set];
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    _canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _lastPoint = currentPoint;
}

- (IBAction)save:(id)sender {
    UIImageWriteToSavedPhotosAlbum(_canvas.image, nil, nil, nil);
}

@end
