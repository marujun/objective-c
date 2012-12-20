//
//  PDFViewBase.m
//  learn-IOS
//
//  Created by mrj on 12-12-18.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "PDFViewBase.h"
#import "pfview.h"

@implementation PDFViewBase

static int count,pageIndex;

- (void)awakeFromNib{

       CGRect frame = CGRectMake(0, 50, 768, 1000);

    pfview *pdfView = [[pfview alloc] initWithFrame:frame index:1 filename:@"test.pdf"];
       pdfView.backgroundColor=[UIColor whiteColor];
       [pdfView setTag:110];
       [self addSubview:pdfView];
       count=[pdfView getNumberOfPages];
       pageIndex=1;
}

- (IBAction)return_home:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)next_page_pdf:(id)sender {
    if(pageIndex<count){
        pageIndex++;
        UIView *uv =(UIView *)[self viewWithTag:110];
        [uv removeFromSuperview];
        [uv release];
        CGRect frame = CGRectMake(0, 50, 768, 1000);
        pfview *pdfView = [[pfview alloc] initWithFrame:frame index:pageIndex filename:@"test.pdf"];
        pdfView.backgroundColor=[UIColor whiteColor];
        [pdfView setTag:110];
        [self addSubview:pdfView];
    }
}

- (IBAction)back_page_pdf:(id)sender {
    if(pageIndex>1){
        pageIndex--;
        UIView *uv =(UIView *)[self viewWithTag:110];
        [uv removeFromSuperview];
        [uv release];
        CGRect frame = CGRectMake(0, 50, 768, 1000);
        pfview *pdfView = [[pfview alloc] initWithFrame:frame index:pageIndex filename:@"test.pdf"];
        pdfView.backgroundColor=[UIColor whiteColor];
        [pdfView setTag:110];
        [self addSubview:pdfView];
    }
}


@end
