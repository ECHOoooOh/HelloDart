void variables(){
    var name = 'Voyager I';
    var year = 1997;
    var antennaDiameter = 3.7;
    var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
    var image = {
        'tags' : ['saturn'],
        'url' : '//path/to/saturn.jpg'
    };
    print(
        'name is $name\n, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image'
    );
}

void main(){
    variables();
}