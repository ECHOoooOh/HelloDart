void variables(){//变量
    var name = 'Voyager I';
    var year = 1997;
    var antennaDiameter = 3.7;
    var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
    var image = {
        'tags' : ['saturn'],
        'url' : '//path/to/saturn.jpg'
    };
    print(
        'name is $name,\n year is $year,\n antennaDiameter is $antennaDiameter,\n flybyObjects is $flybyObjects,\n image is $image'
    );

    //流程控制语句
    if ( year >= 2001){
        print ('21st century\n');
    }else if( year >= 1901){
        print ('20th century\n');
    }

    for(final object in flybyObjects){
        print('$object\n');
    }

    for(int month = 1; month <= 12; month++){
        print ('$month\t');
    }
    while(year < 2016){
        year += 1;
        print('$year\t');
    }
}

void main(){
    variables();
}