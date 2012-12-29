//
//  ViewController.m
//  learn-IOS
//
//  Created by mrj on 12-11-14.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "ViewController.h"
#import "webViewController.h"
#import "dictionary_use_demo.h"
#import "PDFViewBase.h"
#import "Nav_Controller.h"
#import "/usr/include/sqlite3.h"
#import "WebViewController_local.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize items;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [dictionary_use_demo test];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)operate_addresBook:(id)sender {
    NSLog(@"the button has been click");
    
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath]==NO)
    {
        //没找到则创建一个plist文件
        NSFileManager* fm = [NSFileManager defaultManager];
        [fm createFileAtPath:fullPath contents:nil attributes:nil];
        //创建一个dic，写到plist文件里
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"mrj",@"name",@"15210943874",@"phone",nil];
        [dic writeToFile:fullPath atomically:YES];
    }
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:fullPath];//文件数据类型是*dictionary
    
    NSLog(@"dic is:%@",dictionary);
    
    ABAddressBookRef addressBook = ABAddressBookCreate();
    CFErrorRef error = NULL;
    ABRecordRef contactPerson = ABPersonCreate();//联系人
    //名字
    NSString* nameStr = [dictionary objectForKey:@"name"];
    NSString* phoneNum=[dictionary objectForKey:@"phone"];
    CFStringRef name = CFStringCreateWithCString( kCFAllocatorDefault, [nameStr UTF8String], kCFStringEncodingUTF8);
    ABRecordSetValue(contactPerson, kABPersonFirstNameProperty, name, &error);//写入名字进联系人
    //号码
    ABMultiValueRef phone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    // ⋯⋯ 添加多个号码
    ABMultiValueAddValueAndLabel(phone, phoneNum, kABPersonPhoneMobileLabel, NULL);//添加移动号码0
    
    ABRecordSetValue(contactPerson, kABPersonPhoneProperty, phone, &error);//写入全部号码进联系人
    
    ABAddressBookAddRecord(addressBook, contactPerson, &error);//写入通讯录
    ABAddressBookSave(addressBook, &error);
    //释放各数据
    CFRelease(name);
    CFRelease(phone);
    CFRelease(contactPerson);
    CFRelease(addressBook);
//   弹出提示框
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:@"添加成功"
                                                 delegate:self
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:@"取消",nil];
    [alert show];
    [alert release];
    
}
- (void)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker

      shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    NSLog(@"用户选择了通讯录一级列表的某一项");
}
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    //    当用户点击cancel按钮时回到主页面
    [peoplePicker dismissModalViewControllerAnimated:YES];
    NSLog(@"回到主页面");
    
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    if (property == kABPersonPhoneProperty) {
        ABMutableMultiValueRef phoneMulti = ABRecordCopyValue(person, property);
        int index = ABMultiValueGetIndexForIdentifier(phoneMulti,identifier);
        NSString *phone = (NSString*)ABMultiValueCopyValueAtIndex(phoneMulti, index);
        //do something
        
        [phone release];
        [peoplePicker dismissModalViewControllerAnimated:YES];
    }
    return NO;
}

- (IBAction)view_Image:(id)sender {
    NSLog(@"start look up image!");
//    在ipad上使用会报错只能在iphone上使用下面的代码调用系统图片库
//    UIImagePickerController* picker =[[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentModalViewController:picker animated:YES];
    
    
//    在ipad上使用UIPopoverController
    UIImagePickerController* m_imagePicker =[[UIImagePickerController alloc] init];
    m_imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    m_imagePicker.delegate = self;
    [m_imagePicker setAllowsEditing:NO];
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:m_imagePicker];
//    popover.delegate = self;
    [popover presentPopoverFromRect:CGRectMake(0, 0, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//    [popover release];
//    [m_imagePicker release];

}

- (IBAction)view_addressBook:(id)sender {
    ABPeoplePickerNavigationController *picker;
    picker = [[ABPeoplePickerNavigationController alloc] init];        
    // place the delegate of the picker to the controll
    picker.peoplePickerDelegate = self;
    [self presentModalViewController:picker animated:YES];
}



- (IBAction)add_view:(id)sender {
 
//    在页面上添加一个view
    UIView *uv=[[UIView alloc]initWithFrame:CGRectMake(110, 0, 100, 100)];
//    设置一个tag值
    [uv setTag:101];
    [uv setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:uv];
}


- (IBAction)remove_view:(id)sender {
//    通过tag值找到view
    UIView *uv =(UIView *)[self.view viewWithTag:101];
    [uv removeFromSuperview];
    [uv release];
}

- (IBAction)add_tableView:(id)sender {
    self.items = [[NSArray alloc] initWithObjects:@"Item 1",@"Item 2",@"Item 3", @"Item 4",@"Item 5",@"Item 6",@"Item 7",@"Item 8",@"Item 9",@"Item 10",@"Item 11",@"Item 12", nil];
    UITableView *tView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    [tView setTag:102];
    tView.dataSource = self;
    tView.delegate = self;
    tView.scrollEnabled = YES;
    [tView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:tView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)removeTableView:(id)sender {
    UITableView *uv =(UITableView *)[self.view viewWithTag:102];
    [uv removeFromSuperview];
    [uv release];
}

- (IBAction)look_webView:(id)sender {
    changeViewController=[[[webViewController alloc] initWithNibName:@"webViewController" bundle:nil] autorelease];
    [self addChildViewController:changeViewController];
    [self.view addSubview:changeViewController.view];
}

- (IBAction)look_PDF:(id)sender {
    PDFViewBase *PDFViewBase = [[[NSBundle mainBundle] loadNibNamed:@"PDFViewBase" owner:self options:nil] objectAtIndex:0];
    [self.view addSubview:PDFViewBase];
}

- (IBAction)look_local_html:(id)sender {
    changeViewController=[[[WebViewController_local alloc] initWithNibName:@"WebViewController_local" bundle:nil] autorelease];
    [self addChildViewController:changeViewController];
    [self.view addSubview:changeViewController.view];
}

- (IBAction)look_navigation:(id)sender {
    UINavigationController *aNav=[[[Nav_Controller alloc] initWithNibName:nil bundle:nil] autorelease];
    [self addChildViewController:aNav];
    [self.view addSubview:aNav.view];
}

- (IBAction)operate_db:(id)sender {
    sqlite3 *database;
    NSArray *documentsPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                                , NSUserDomainMask
                                                                , YES);
    NSString *databaseFilePath=[[documentsPaths objectAtIndex:0] stringByAppendingPathComponent:@"data.sqlite"];
    
//    NSString *databaseFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
    if (sqlite3_open([databaseFilePath UTF8String], &database)==SQLITE_OK) {
        NSLog(@"open sqlite db ok.");
    }
    const char *selectSql="select * from camera";
    NSString *query =@"select * from camera";
    sqlite3_stmt *statement;
    int result = sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil);
    NSLog(@"select result %d",result);
    if (sqlite3_prepare_v2(database, selectSql, -1, &statement, nil)==SQLITE_OK) {
        NSLog(@"select ok.");
    }
    while (sqlite3_step(statement)==SQLITE_ROW) {
        int _id=sqlite3_column_int(statement, 0);
        NSString *name=[[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
        NSLog(@"row>>id %i, name %@",_id,name);
    }
    
    sqlite3_finalize(statement);
}


@end
