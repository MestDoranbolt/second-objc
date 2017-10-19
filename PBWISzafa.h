//
//  PBWISzafa.h
//  ObjIntro
//
//  Created by Marecki on 19/10/2017.
//  Copyright © 2017 Marecki. All rights reserved.
//

#import "PBWIZasob.h"
#import "PBWISzafa.h"

@interface PBWISzafa : PBWIZasob {
@private int _wysokosc;
@private int _szerokosc;
@private int _dlugosc;
}

@property(readonly) int wysokosc;
@property(readonly) int szerokosc;
@property(readonly) int dlugosc;

-(id) initWithParams: (int)wys :(int)szer :(int)dl;
-(NSString *) opisZasobu;

@end
