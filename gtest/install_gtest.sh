cur_dir=$(pwd)
# clone gtest git repository
git clone https://github.com/google/googletest.git googletest_download;
# build
cd googletest_download && mkdir build && cd build && cmake .. && sudo make install;
# clean up gtest dir
cd ${cur_dir} && rm -rf googletest_download;
