{pkgs, ...}: {
  enable = true;
  attributes = ''
    * text=auto
    *.md linguist-detectable=true
  '';
  ignore = '''';
  settings = {
    core = {
      compression = 9;
      whitespace = "error";
      preloadindex = true;
      autocrlf = false;
    };
    commit = {
      verbose = true;
    };
    init = {defaultBranch = "master";};
    status = {
      branch = true;
      showStash = true;
    };
    diff = {
      renames = "copies";
      interHunkContext = 10;
      context = 3;
    };
    pager.diff = "${pkgs.diff-so-fancy}/bin/diff-so-fancy | $PAGER";
    diff-so-fancy = {
      markEmptyLines = false;
    };
    interactive = {
      diffFilter = "${pkgs.diff-so-fancy}/bin/diff-so-fancy --patch";
      singlekey = true;
    };
    log = {
      abbrevCommit = true;
      graphColors = "blue,yellow,cyan,magenta,green,red";
    };
    push = {
      autoSetupRemove = true;
      default = "current";
      followTags = true;
    };
    pull = {
      rebase = true;
      default = "current";
    };
    submodule.fetchJobs = 16;
    rebase.autoStash = true;
    rebase.missingCommitsCheck = "warn";
  };
}
