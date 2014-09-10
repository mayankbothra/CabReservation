 //
//  main.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pixate/Pixate.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [Pixate licenseKey:@"B3O1A-P67Q6-LRRM8-KCV4H-UI40E-08KSI-1GKTF-3MASH-S48NL-A3JCD-VDVPN-JIJC8-IBSJ9-5TH3E-M31J4-O0" forUser:@"mayank.tcet@gmail.com"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
