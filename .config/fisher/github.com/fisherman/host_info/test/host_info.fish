test "$TESTNAME - Get user and host / domain information #1"
    (id -un | sed -E 's|^(.).*|\1|') = (
        host_info usr
        )
end

test "$TESTNAME - Get user and host / domain information #2"
    (id -un)@(hostname -s) = (
        host_info
        )
end

test "$TESTNAME - Get user and host / domain information #3"
    (hostname -s) = (
        host_info host
        )
end
