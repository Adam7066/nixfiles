{ lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ "rm *" "pkill *" "cp *" ];
      ignoreAllDups = true; # 忽略所有重複的歷史紀錄
      ignoreSpace = true; # 忽略以空格開頭的歷史紀錄
    };

    initContent = lib.mkMerge [
      (
        ''
          export ZLE_RPROMPT_INDENT=0
          
          [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        ''
      )
    ];

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
    ];
  };
}
