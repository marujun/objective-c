//
//  PDFViewBase.h
//  learn-IOS
//
//  Created by mrj on 12-12-18.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewBase : UIView{
    CGPDFDocumentRef pdf;
//    CGContextRef context;
    CGPDFPageRef page;
}

- (IBAction)return_home:(id)sender;

- (IBAction)next_page_pdf:(id)sender;

- (IBAction)back_page_pdf:(id)sender;

@end
