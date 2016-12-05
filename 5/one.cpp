// compile with: g++ --std=c++11 -O3 ./solve.cpp -lcrypto

#include "one.h"

int main(int argc, char * argv[])
{
  bool debug = (argc > 1);

  std::string input;
  std::cin >> input;

  int n = 0;
  for (int i = 0; i < 8; ++i) {
      std::cout << nextSolutionChar(input, n);
  }
  std::cout << std::endl;

  return 0;
}
