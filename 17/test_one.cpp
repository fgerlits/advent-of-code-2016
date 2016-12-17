#include "one.hpp"
#include <gtest/gtest.h>

namespace
{
    void expect_eq(auto const& expected, auto const& actual)
    {
        EXPECT_EQ(expected, actual);
    }

    std::string const SEED = "hijkl";

    Path to_path(std::string const& path_string)
    {
        return Path{path_string.begin(), path_string.end()};
    }
}

TEST(ValidMovesFromTest, Start) {
    expect_eq(Positions{{{'D'}, {0, 1}}},
              valid_moves_from({{}, {0, 0}}, SEED));
}

TEST(ValidPathsFromTest, D) {
    expect_eq(Positions{{{'D', 'U'}, {0, 0}}, {{'D', 'R'}, {1, 1}}},
              valid_moves_from({{'D'}, {0, 1}}, SEED));
}

TEST(ValidPathsFromTest, DR) {
    expect_eq(Positions{}, valid_moves_from({{'D', 'R'}, {1, 1}}, SEED));
}

TEST(ValidPositionsFromTest, DU) {
    expect_eq(Positions{{{'D', 'U', 'R'}, {1, 0}}},
              valid_moves_from({{'D', 'U'}, {0, 0}}, SEED));
}

TEST(ValidPositionsFromTest, DUR) {
    expect_eq(Positions{},
              valid_moves_from({{'D', 'U', 'R'}, {1, 0}}, SEED));
}

TEST(ShortestPathTest, ExampleOne) {
    EXPECT_EQ(to_path("DDRRRD"), shortest_path("ihgpwlah"));
}

TEST(ShortestPathTest, ExampleTwo) {
    EXPECT_EQ(to_path("DDUDRLRRUDRD"), shortest_path("kglvqrro"));
}

TEST(ShortestPathTest, ExampleThree) {
    EXPECT_EQ(to_path("DRURDRUDDLLDLUURRDULRLDUUDDDRR"), shortest_path("ulqzkmiv"));
}

int main(int argc, char * argv[])
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
