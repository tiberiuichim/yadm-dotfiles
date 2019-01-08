set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/foo/bar/baz
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Print info about the current working directory."
    (echo "pwd_info"\n(dirname (prompt_pwd) | sed -E 's|[~/]||g')\n"tfbbaz") = (
        pushd $path/foo/bar/baz
        pwd_info
        )
end
