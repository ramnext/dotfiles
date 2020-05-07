function distinct -d "Returns a set of the distinct elements of coll."
    set -l uniq
    for a in $argv
        if not contains $a $uniq
            set uniq $uniq $a
            echo $a
        end
    end
end
