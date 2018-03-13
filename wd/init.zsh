_wd_path="${0:h}/external"
fpath=($_wd_path $fpath)
wd() {
  . "$_wd_path"/wd.sh
}
