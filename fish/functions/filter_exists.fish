function filter_exists -d "Returns a list of existed files."
    set -l exists
    # $argv の値のリストを1つずつ確認して
    for p in $argv
        # 存在しているパスのみリスト末尾へ追加する
        if test -e $p
            set exists $exists $p
            echo $p
        end
    end
end
