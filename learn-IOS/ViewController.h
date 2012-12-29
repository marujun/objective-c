//
//  ViewController.h
//  learn-IOS
//
//  Created by mrj on 12-11-14.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *items;
    UIViewController *changeViewController;
}

@property (nonatomic,retain) NSArray *items;    //存储列表数据

- (IBAction)operate_addresBook:(id)sender;

- (IBAction)view_Image:(id)sender;

- (IBAction)view_addressBook:(id)sender;

- (IBAction)add_view:(id)sender;

- (IBAction)remove_view:(id)sender;

- (IBAction)add_tableView:(id)sender;

- (IBAction)removeTableView:(id)sender;

- (IBAction)look_webView:(id)sender;

- (IBAction)look_PDF:(id)sender;

- (IBAction)look_local_html:(id)sender;

- (IBAction)look_navigation:(id)sender;

- (IBAction)operate_db:(id)sender;

@end
