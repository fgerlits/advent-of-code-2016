// compile with: g++ --std=c++11 -O3 ./solve.cpp -lcrypto

#include <openssl/md5.h>
#include <iostream>
#include <string>
#include <sstream>
#include <iomanip>

std::string createMd5(const std::string & input) {
  unsigned char digest[MD5_DIGEST_LENGTH];
  MD5((unsigned char *)input.c_str(), input.size(), (unsigned char *)&digest);
  return std::string((const char *)&digest, MD5_DIGEST_LENGTH);
}

size_t countLeadingZeros(const std::string & input) {
  size_t numZeros = 0;
  size_t i = 0;
  while (i < input.size() && input[i] == '\x0') {
    numZeros += 2;
    ++i;
  }
  if (i < input.size() && (unsigned char)(input[i]) < '\x10') {
    numZeros += 1;
  }
  return numZeros;
}

std::string format(const std::string & input) {
  std::ostringstream ss;
  for (unsigned char c : input) {
    ss << std::hex << std::setw(2) << std::setfill('0') << (int)(c);
  }
  return ss.str();
}

std::string nextHashWithFiveZeros(const std::string & input, int & n) {
  size_t numZeros = 0;
  std::string md5;
  do {
    md5 = createMd5(input + std::to_string(n));
    numZeros = countLeadingZeros(md5);
    ++n;
  } while (numZeros < 5);
  return format(md5);
}
