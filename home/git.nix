{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Smallten";
        email = "smallten@proton.me";
        signingKey = "091C610D2F80EAD3A54ABDCF71A90CEE9EB01E69";
      };
      core.editor = "vim";
      commit.gpgSign = true;
      tag.forceSignAnnotated = true;
      gpg = {
        format = "openpgp";
        program = "gpg";
      };
    };
  };
}
