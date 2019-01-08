test "$TESTNAME - Test if the current directory is not HOME"
    1 -eq (
        pushd /
        pwd_is_home
        echo $status
        )
end

test "$TESTNAME - Test if the current directory equals HOME"
    0 -eq (
        pushd $HOME
        pwd_is_home
        echo $status
        )
end

for dir in $HOME/*
    if test -d $dir
        if test ! -z "$dir"
            test "$TESTNAME - Test if the current directory is inside HOME"
                0 -eq (
                    pushd $dir
                    pwd_is_home
                    echo $status
                    )
            end
        end
        break
    end
end
