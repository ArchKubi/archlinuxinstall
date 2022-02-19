#install other shell

PS3='Please enter your selection : '


options=("Zsh" "Fish" "Quit")
select opt in "${options[@]}"
do
    case $opt in

        "Fish")
        echo "Your Chosen Fish"
            sudo pacman -S fish
            curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
            chsh -s $(which fish)
            break
            ;;

        "Zsh")
        echo "Your Chosen Zsh"
            sudo pacman -S zsh  zsh-completions  zsh-syntax-highlighting
             chsh -s $(which Zsh)
            break
            ;;

        "Quit")
            break
            ;;
    esac
done