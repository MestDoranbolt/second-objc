#import <objc/objc.h>
#import <objc/Object.h>
#import <Foundation/Foundation.h>
#import "PBWIZasob.h"
#import "PBWIBiurko.h"
#import "PBWIKrzeslo.h"
#import "PBWIPokoj.h"
#import "PBWIZasobyWydzialu.h"

int main()
{
	@autoreleasepool {	
		PBWIZasob * zasob = [[PBWIZasob alloc] init];
		[zasob setKolor: @"szary"];
		NSLog(@"Przykladowy zasob: %@", [zasob opisZasobu]);
		PBWIBiurko * biurko = [[PBWIBiurko alloc] initWithParams:100 :80 :140];
		[biurko setKolor: @"brazowy"];
		NSLog(@"Przykladowe biurko: %@", [biurko opisZasobu]);
		PBWIKrzeslo * krzeslo = [[PBWIKrzeslo alloc] init];
		[krzeslo setObicie: @"skora"];
		[krzeslo setKolor: @"czarny"];
		NSLog(@"Przykladowe krzeslo: %@", [krzeslo opisZasobu]);

		PBWIPokoj *pokoj= [[PBWIPokoj alloc] init];
		[pokoj dodajZasob: biurko];
		[pokoj dodajZasob: krzeslo];
		[pokoj usunZasob: biurko];
        
        PBWIPokoj *pokojDwa = [[PBWIPokoj alloc] init];
        
        PBWIZasobyWydzialu *wydzial = [[PBWIZasobyWydzialu alloc] init];
        
        // metoda dodajaca pokoj
        [wydzial dodajPokoj: pokoj];
        [wydzial dodajPokoj: pokojDwa];
        
        // metoda dodajaca zasob do pokoju
        PBWIKrzeslo * krzesloDwa = [[PBWIKrzeslo alloc] init];
        [krzesloDwa setObicie: @"material"];
        [krzesloDwa setKolor: @"braz"];
        [wydzial dodajZasob:krzesloDwa doPokoju:pokojDwa];
        NSLog(@"Krzeslo dodane: %@", [krzesloDwa opisZasobu]);
        
        // metoda przenoszaca zasob do innego pokoju
        NSLog(@"Przenoszenie krzesla");
        NSArray *zasoby = [pokoj wszystkieZasoby];
        NSLog(@"Ilosc mebli w pokoju 1: %lu", (unsigned long)[zasoby count]);
        [wydzial przeniesZasob:krzeslo zPokoju:pokoj doPokoju:pokojDwa];
        zasoby = [pokoj wszystkieZasoby];
        NSLog(@"Ilosc mebli w 1 po przeniesieniu: %lu", (unsigned long)[zasoby count]);
    
        // metoda usuwajaca zasob z pokoju
        zasoby = [pokojDwa wszystkieZasoby];
        NSLog(@"Ilosc zasobow w pokoju 2 przed usunieciem: %lu", (unsigned long)[zasoby count]);
        [wydzial usunZasob:krzesloDwa zPokoju:pokojDwa];
        zasoby = [pokojDwa wszystkieZasoby];
        NSLog(@"Ilosc zasobow w pokoju 2 po usunieciu: %lu", (unsigned long)[zasoby count]);
        
        // metoda zwracajaca numery pokojow
        NSArray *numery = [wydzial wypiszNumery];
        for (id element in numery){
            NSLog(@"Pokoj nr %@",element);
        }
        
        // metoda zwracajaca wszystkie biurka
        NSArray *biurka = [wydzial wypiszBiurka];
        for (id element in biurka){
            NSLog(@"%@",[element opisZasobu]);
        }
        
        // metoda zwracajaca wszystkie krzesla
        
        PBWIKrzeslo * krzesloTrzy = [[PBWIKrzeslo alloc] init];
        [krzesloTrzy setObicie: @"skora"];
        [krzesloTrzy setKolor: @"bialy"];
        [wydzial dodajZasob:krzesloTrzy doPokoju:pokoj];
        NSArray *krzesla = [wydzial wypiszKrzesla];
        for (id element in krzesla){
            NSLog(@"%@",[element opisZasobu]);
        }
        
	}
	return 0;
}


