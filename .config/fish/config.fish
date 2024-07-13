set fish_greeting

function fish_prompt
  echo (whoami)@(hostname) \((pwd | awk -F / '{print $NF}')\) \-\> ""
end
