//
//  PBWIZasobyWydzialu.h
//  ObjIntro
//
//  Created by Marecki on 16/10/2017.
//  Copyright © 2017 Marecki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBWIZasobyWydzialu.h"
#import "PBWIZasob.h"
#import "PBWIPokoj.h"

@interface PBWIZasobyWydzialu : NSObject {
@private NSMutableDictionary *pokoje;
@private NSMutableArray *zasoby;
}

-(id) init;
-(void) dodajPokoj:(PBWIPokoj *) pokoj;
-(void) dodajZasob:(PBWIZasob *) zasob doPokoju:(PBWIPokoj *) pokoj;
-(void) przeniesZasob:(PBWIZasob *) zasob zPokoju:(PBWIPokoj *) zrodloPokoj doPokoju:(PBWIPokoj *) celPokoj;
-(void) usunZasob:(PBWIZasob *) zasob zPokoju:(PBWIPokoj *) pokoj;
-(NSArray *) wypiszNumery;
-(NSArray *) wypiszBiurka;
-(NSArray *) wypiszKrzesla;

@end
