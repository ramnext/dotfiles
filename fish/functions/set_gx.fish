function set_gx
    if test (count $argv) -ge 2
        set key (first $argv)
        set r (rest $argv)
        set d (distinct $r)
        set e (filter_exists $d)
        set -gx $key $e
    end
end
