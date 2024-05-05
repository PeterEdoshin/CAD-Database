# include <iostream>
# include "math.h"

using namespace std;

// объявление функции gcd, потому что она вызывается раньше, чем определяется

int
gcd(int, int);

class Drob {
  public:
    Drob(void);
    Drob(int, int);
    // Для более удобной печати на stdout
    friend ostream& operator << (ostream&, const Drob&);
  private:
    int p, q;
};

Drob::Drob(void)
{
   p = 0; q = 1;
}

Drob::Drob(int num, int denom)
{
   // Задача: убедиться, что denom != 0
   if (denom == 0)
        throw invalid_argument("Знаменатель дроби не может быть 0");
   // Задача: сократить p и q, найдя их наибольший общий делитель.
   int d = gcd(num, denom);
   p = num / d;
   q = denom / d;
}

ostream & operator << (ostream& os, const Drob& drob)
{
    os << "Drob: " << drob.p << "/" << drob.q;
    return os;
}

// Функция для поиска наибольшего общего делителя для двух целых чисел.
// gcd(a, 0) = a
// gcd(a, b) = gcd(b, a mod b)
// https://ru.wikipedia.org/wiki/Наибольший_общий_делитель
// gcd: Greatest Common Divisor (англ. Наибольший общий делитель)

int 
gcd(int a, int b)
{
    if (a < b)
        return gcd(b, a);
    else if (b == 0)
        return a;
    else
        return gcd(b, a % b); 
        // % -- оператор взятия модуля, т.е. остатка от деления a на b: 
        //   19 % 5 = 4 потому что максимальное число меньше 19 которое
        //   делится на 5 -- это 15, и разница между 19 и 15 -- это 4.
}

int main(void)
{
    Drob a;
    Drob b = Drob();

    Drob c(0, 1);
    Drob d = Drob(1, 2);

    try {
        Drob e(1, 0);
    }
    catch (const invalid_argument& e) {
       // e.what() -- метод стандартных исключений, который пришлось гуглить. 
       // Можно сделать собственные исключения, но пока ладно.
       cout << "Ошибка: " << e.what() << endl;
    }

    Drob f = Drob(8, 16); // должен сократить до 1/2.
    Drob g = Drob(9, 6);  // должен сократить до 3/2

    cout << "a: " << a << endl;
    cout << "b: " << b << endl;
    cout << "c: " << c << endl;
    cout << "d: " << d << endl;
    cout << "f: " << f << endl;
    cout << "g: " << g << endl;
    return 0;
}
