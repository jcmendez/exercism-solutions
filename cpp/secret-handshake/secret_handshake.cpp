#include "secret_handshake.h"

#include <algorithm> // To use std::reverse

namespace secret_handshake {

/**
 * @brief This implements the secret handshake algorithm in the
 * exercise. It takes an integer and returns a vector of strings
 * that represent the secret handshake.
 * 
 * The actions for each number place are:
 *
 *  00001 = wink
 *  00010 = double blink
 *  00100 = close your eyes
 *  01000 = jump
 *  10000 = Reverse the order of the operations in the secret handshake.
 * 
 * @param n is the integer to be converted to a secret handshake. 
 * @return vector<string> is the secret handshake.
 */
vector<string> commands(int n) {
    vector<string> result;
    if (n & 1) result.push_back("wink");
    if (n & 2) result.push_back("double blink");
    if (n & 4) result.push_back("close your eyes");
    if (n & 8) result.push_back("jump");
    if (n & 16) reverse(result.begin(), result.end());
    return result;
}

}  // namespace secret_handshake
