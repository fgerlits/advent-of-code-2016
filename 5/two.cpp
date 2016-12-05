// compile with: g++ --std=c++11 -O3 ./two.cpp -lcrypto

#include "two.h"

int main(int argc, char * argv[])
{
  std::string input;
  std::cin >> input;

  int n = 0;
  std::string result = "........";
  for (int i = 0; i < 8; ++i) {
      result = nextSolutionChar(input, n, result);
      std::cout << "\r" << result << std::flush;
  }
  std::cout << std::endl;

  return 0;
}
