void variables(){
    //变量
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

    //（胖箭头）简写语法
    flybyObjects.where((name) => name.contains('turn')).forEach(print);
    //找到flybyObjects中包含turn的所有变量并将其打印（我猜）
}

int fibonacci(int n){//斐波那契数列
    if( n == 0 || n == 1) return n;
    return fibonacci(n-1) + fibonacci(n - 2);
}

class Spacecraft{
    String name;
    DateTime? launchDate;
    //dart 中默认进行空安全检查，？表示不用检查

    int? get launchYear => launchDate?.year;

    Spacecraft(this.name, this.launchDate){
        //初始化代码

    }

    Spacecraft.unlaunched(String name) : this(name, null);

    //方法
    void describe(){
        print('Spacecraft:$name');
        //？？类型提升对getters不起作用
        var launchDate = this.launchDate;
        if (launchDate != null){
            int years = DateTime.now().difference(launchDate).inDays ~/ 365;
            print ('Launched: $launchYear ($years years ago)');
        }else{
            print('Unlaunched');
        }
    }
    
}
class Orbiter extends Spacecraft{
    double altitude;

    Orbiter(String name, DateTime launchDate, this.altitude)
        : super(name, launchDate);
    

    void describe(){
        print('Spacecraft:$name');
        //？？类型提升对getters不起作用
        var launchDate = this.launchDate;
        if (launchDate != null){
            int years = DateTime.now().difference(launchDate).inDays ~/ 365;
            print ('Launched: $launchYear ($years years ago)');
            print ('altitude: $altitude');
        }else{
            print('Unlaunched');
        }
    }
}
void useClass(){
    //var voyager = Spacecraft('Voyager I',DateTime(1997, 9, 5));
    //voyager.describe();

    //var voyager3 = Spacecraft.unlaunched('Voyager III');
    //voyager3.describe();

    var voyager4 = Orbiter('Voyager IV',DateTime(2022, 3, 31));
    voyager4.describe();
}


void main(){
    //variables();
    var result = fibonacci(20);
    //print('fibonacci(20) is $result');
    useClass();
}