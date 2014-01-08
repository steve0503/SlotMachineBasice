//
//  ViewController.m
//  SlotMachine
//
//  Created by 해용 이 on 2014. 1. 7..
//  Copyright (c) 2014년 해용 이. All rights reserved.
//

#define MAX_NUM 100

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController


-(IBAction)startMachine:(id)sender{
    
    int r1 = arc4random()%MAX_NUM;
    
    [self.picker selectRow:r1 inComponent:0 animated:YES];
    
    
    int r2 = arc4random()%MAX_NUM;
    
    [self.picker selectRow:r2 inComponent:1 animated:YES];
    
    int r3 = arc4random()%MAX_NUM;
    
    [self.picker selectRow:r3 inComponent:2 animated:YES];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return MAX_NUM;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 64;
    
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    NSString *imagePath = [NSString stringWithFormat:@"flag%ld.jpeg",row%10];
    
    UIImage *image = [UIImage imageNamed:imagePath];
    
    UIImageView *imageView;
    
    if (nil == view) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 100, 60);
        
    }
    else{
        
        imageView = (UIImageView *)view;
        imageView.image = image;
        
    }
    
    return imageView;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
