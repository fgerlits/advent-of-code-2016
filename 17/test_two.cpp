#include "two.hpp"
#include <gtest/gtest.h>

TEST(LongestPathTest, ExampleOne) {
    EXPECT_EQ(370, longest_path("ihgpwlah"));
}

TEST(LongestPathTest, ExampleTwo) {
    EXPECT_EQ(492, longest_path("kglvqrro"));
}

TEST(LongestPathTest, ExampleThree) {
    EXPECT_EQ(830, longest_path("ulqzkmiv"));
}

int main(int argc, char * argv[])
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
