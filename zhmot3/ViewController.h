//
//  ViewController.h
//  zhmot3
//
//  Created by Иван Иванов on 03.01.2020.
//  Copyright © 2020 Иван Иванов. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *url_edit;

@end
