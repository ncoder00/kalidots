# Kali Dotfiles Repository

This repository contains configuration files (dotfiles) for managing and setting up your development environment across multiple Kali Linux installations. It includes configurations for `zsh`, `rofi`, `terminator`, and any other tools you may want to add in the future.

## Scripts

### 1. `update_repo.sh`

This script automates the process of copying your configuration files to the repository, committing the changes, and pushing them to your GitHub repository.

#### How it works:
- Copies updated configuration files (e.g., `.zshrc`, `rofi`, `terminator`) from their respective locations to the `~/config/` directory.
- Stages the changes using Git.
- Commits the changes with a timestamped message.
- Pushes the changes to the remote repository on GitHub.

#### Usage:
To update the repository with your latest configurations, simply run:
```bash
./update_repo.sh
```

### 2. `install_configs.sh`

This script automates the setup of your configurations on a new Kali Linux installation. It checks for the necessary applications (`zsh`, `rofi`, `terminator`) and installs them if they are not present, then pulls the latest configuration files from the repository and symlinks them to the appropriate locations.

#### How it works:
- Checks if required applications (`zsh`, `rofi`, `terminator`) are installed. If not, it installs them.
- Clones the repository if it's not already cloned.
- Pulls the latest changes from the repository.
- Creates symlinks from the configuration files in the repository to their respective locations in the home directory.

#### Usage:
To set up your configurations on a new system, simply run:
```bash
./install_configs.sh
```

## Adding Configurations for Other Applications

If you want to add configuration files for other applications to this repository, follow these steps:

1. **Copy the Configuration Files to the `config` Directory:**
   - Determine the location of the application's configuration files. For example, `~/.config/application/config` or `~/.applicationrc`.
   - Copy these files to the appropriate directory inside `~/config/`. If the directory doesn't exist, create it.

   ```bash
   mkdir -p ~/config/application
   cp ~/.config/application/config ~/config/application/
   ```

2. **Update the `update_repo.sh` Script:**
   - Add a new `cp -u` command in the `update_repo.sh` script to copy the application's config files to the repository before committing.

   ```bash
   cp -u ~/.config/application/config ~/config/application/
   ```

3. **Update the `install_configs.sh` Script:**
   - Add a check for the application in the `install_configs.sh` script, similar to the existing checks for `rofi`, `terminator`, etc.
   - Create a symlink for the new application's configuration files in the appropriate location.

   ```bash
   check_and_install "application"
   ln -sf $HOME/config/application/config $HOME/.config/application/config
   ```

4. **Commit and Push the Changes:**
   - After updating the scripts and adding the new configurations, run `./update_repo.sh` to commit and push the changes to the repository.

## Cloning and Initial Setup

To clone this repository and set up the configurations on a new system, follow these steps:

1. Clone the repository to your home directory:
   ```bash
   git clone https://github.com/ncoder00/kalidots.git ~/config
   ```

2. Run the `install_configs.sh` script:
   ```bash
   cd ~/config
   ./install_configs.sh
   ```

This will ensure that all necessary applications are installed, and your configuration files are correctly set up on the new system.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
