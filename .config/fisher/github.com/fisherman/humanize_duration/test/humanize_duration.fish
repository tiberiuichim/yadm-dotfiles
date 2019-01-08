test "$TESTNAME"
    1ms = (echo 1 | humanize_duration)
end

test "$TESTNAME"
    10ms = (echo 10 | humanize_duration)
end

test "$TESTNAME"
    "1m 40s" = (echo 100000 | humanize_duration)
end

test "$TESTNAME"
    "16m 40s" = (echo 1000000 | humanize_duration)
end

test "$TESTNAME"
    "2h 46m 40s" = (echo 10000000 | humanize_duration)
end

test "$TESTNAME"
    "27h 46m 40s" = (echo 100000000 | humanize_duration)
end
