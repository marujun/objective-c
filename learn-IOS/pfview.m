//
//  pfview.m
//  learn-IOS
//
//  Created by mrj on 12-12-19.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import "pfview.h"

@implementation pfview

@synthesize pageIndex;

- (id)initWithFrame:(CGRect)frame index:(NSInteger)index filename:(NSString *)filename
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        pageIndex=index;
        CFStringRef path;
        CFURLRef url;
        NSString *filePath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
        path = CFStringCreateWithCString (NULL, [filePath UTF8String], kCFStringEncodingUTF8);
        url = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
//        CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("test.pdf"), NULL, NULL);
        pdf = CGPDFDocumentCreateWithURL(url);
        CFRelease(url);
    }
    return self;
}

-(NSInteger) getNumberOfPages {
    return CGPDFDocumentGetNumberOfPages(pdf);
}

-(void)drawInContext:(CGContextRef)context
{
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    page = CGPDFDocumentGetPage(pdf, pageIndex);
    CGContextSaveGState(context);
    CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, 0, true);
    CGContextConcatCTM(context, pdfTransform);
    CGContextDrawPDFPage(context, page);
    CGContextRestoreGState(context);
    //    CGPDFDocumentRelease (pdf);
}

- (void)drawRect:(CGRect)rect {
    [self drawInContext:UIGraphicsGetCurrentContext()];
}
@end
