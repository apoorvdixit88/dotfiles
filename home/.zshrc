# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
vscode
zsh-autosuggestions
dirhistory
jsontools)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g++='g++ -std=c++17'
alias g++14="g++-14 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
alias g++14="g++-14 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
function jclaude() {
    MODEL=$(curl -X GET \
      'https://grid.ai.juspay.net/models?return_wildcard_routes=false&include_model_access_groups=false&only_model_access_groups=false&include_metadata=false' \
      -H 'accept: application/json' \
      -H "Authorization: Bearer $JUSPAY_API_KEY" | jq -r '.data|.[].id' | fzf)
    # Unset unwanted environment variables for this function scope
    GEMINI_API_KEY="" \
    GOOGLE_CLOUD_PROJECT="" \
    GOOGLE_APPLICATION_CREDENTIALS="" \
    CLAUDE_CODE_USE_VERTEX="" \
    CLOUD_ML_REGION="" \
    GOOGLE_VERTEX_PROJECT="" \
    ANTHROPIC_VERTEX_PROJECT_ID="" \
    ANTHROPIC_BASE_URL="https://grid.ai.juspay.net/" \
    ANTHROPIC_AUTH_TOKEN="$JUSPAY_API_KEY" \
    ANTHROPIC_MODEL="$MODEL" \
    ANTHROPIC_SMALL_FAST_MODEL="$MODEL" \
    CLAUDE_CODE_SUBAGENT_MODEL="$MODEL" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="$MODEL" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="$MODEL" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="$MODEL" \
    DISABLE_INTERLEAVED_THINKING=true \
    API_TIMEOUT_MS=600000 \
    BASH_MAX_TIMEOUT_MS=300000 \
    CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1 \
    claude "${@:1}"
}

export JUSPAY_API_KEY="sk-MLP-GyNDCFRnwbewiuWLAA"

# Claude Code - Juspay as additional model option (keeps Anthropic models too)
export ANTHROPIC_CUSTOM_MODEL_OPTION="claude-3-5-sonnet-20241022"
export ANTHROPIC_CUSTOM_MODEL_OPTION_NAME="Juspay Sonnet"
export ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION="Claude via Juspay gateway"
export ANTHROPIC_CUSTOM_MODEL_OPTION_BASE_URL="https://grid.ai.juspay.net"
export ANTHROPIC_CUSTOM_MODEL_OPTION_API_KEY="$JUSPAY_API_KEY"
eval "$(/opt/homebrew/bin/brew shellenv)"
