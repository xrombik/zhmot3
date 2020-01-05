//
//  ViewController.m
//  zhmot3
//
//  Created by Иван Иванов on 03.01.2020.
//  Copyright © 2020 Иван Иванов. All rights reserved.
//
// https://advancetechtutorial.blogspot.com/2016/07/ios-uipickerview-example-and-tutorial.html
#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray* view_seconds;
    NSMutableArray* view_minutes;
    NSMutableArray* view_hours;
    NSString* url;
    NSUInteger i_seconds;
    NSUInteger i_minutes;
    NSUInteger i_hours;
    UIPasteboard *pasteboard;
}

@end


@implementation ViewController

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        i_hours = row;
    }
    else if (component == 1)
    {
        i_minutes = row;
    }
    else if (component == 2)
    {
        i_seconds = row;
    }
    NSUInteger secs = i_hours * 60 * 60 + i_minutes * 60 + i_seconds;
    self.url_edit.text = [NSString stringWithFormat:@"%@?t=%ld", url, (long)secs];
}
    
- (NSMutableArray*) fill_with_values: (NSUInteger) cnt
{
    NSMutableArray* view = [NSMutableArray array];
    for (NSUInteger i = 0; i < cnt; i ++)
    {
        NSString* s = [NSString stringWithFormat:@"%d", i];
        [view addObject: s];
    }
    return view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    pasteboard = [UIPasteboard generalPasteboard];
    url = [NSString new];
    view_seconds = [self fill_with_values: 60];
    view_minutes = [self fill_with_values: 60];
    view_hours = [self fill_with_values: 24];
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return view_hours.count;
    }
    else if (component == 1)
    {
        return view_minutes.count;
    }
    return view_seconds.count;
}

// The data to return for the row and component (column) that's being passed in
 - (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return view_hours[row];
    }
    else if (component == 1)
    {
        return view_minutes[row];
    }
    return view_seconds[row];
}

- (IBAction)on_button_paste:(id)sender
{
    self.url_edit.text = pasteboard.string;
    NSArray* items = [pasteboard.string componentsSeparatedByString:@"?t="];
    url = items[0];
    if (items.count > 1)
    {
        NSUInteger secs_total = [items[1] intValue];
        i_seconds = (secs_total % 60);
        i_minutes = (secs_total % 3600) / 60;
        i_hours = (secs_total % 86400) / 3600;
        [self set_picker: i_hours : i_minutes : i_seconds];
    }
    else
    {
        i_seconds = 0;
        i_minutes = 0;
        i_hours = 0;
        [self set_picker: 0 : 0 : 0];
    }
}

- (void)set_picker: (NSUInteger)h : (NSUInteger)m : (NSUInteger)s
{
    [self.picker selectRow:h inComponent:0 animated:YES];
    [self.picker selectRow:m inComponent:1 animated:YES];
    [self.picker selectRow:s inComponent:2 animated:YES];
}


- (IBAction)on_button_copy:(id)sender
{
    pasteboard.string = self.url_edit.text;
}


@end
