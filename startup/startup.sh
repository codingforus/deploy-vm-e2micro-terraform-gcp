# Update package list for upgrades
sudo apt update

# Allow user account access to sudo without password for certain actions
sudo echo "<USER> ALL=(ALL) NOPASSWD:/bin/mkdir,/bin/mv,/bin/cat,/bin/rm,/bin/vim" >> /etc/sudoers

# Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg --batch --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce vim -y
