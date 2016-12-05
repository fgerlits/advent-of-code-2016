#include "one.h"

std::string nextSolutionChar(const std::string & input, int & n, std::string result) {
    while (true) {
        std::string hash = nextHashWithFiveZeros(input, n);
        int pos = hash[5] - '0';
        if (pos >= 0 && pos < result.size() && result[pos] == '.') {
            result[pos] = hash[6];
            return result;
        }
    }
}
