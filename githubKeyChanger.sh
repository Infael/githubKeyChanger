# Tool to change github personal token in current repository
# Input: github personal token

token=$1

if [ -z "$token" ]
then
    echo "Please provide github personal token"
    exit 1
fi

# check if current directory is git repository
if [ ! -d .git ]
then
    echo "Current directory is not a git repository"
    exit 1
fi

# get current origin url
origin_url=$(git remote get-url origin)

# remove current origin url
git remote remove origin

# if origin url has token, remove it
origin_url=$(echo $origin_url | sed 's/^https:\/\/[^@]*@/https:\/\//')

# Add new token to origin URL
origin_url=$(echo "$origin_url" | sed "s/^https:\/\//https:\/\/$token@/")

# Set the new origin URL with the token
git remote add origin "$origin_url"

echo "Updated origin URL with new token:"
echo "$origin_url"

# If current branch is master, set upstream to origin master
current_branch=$(git branch --show-current)
if [ "$current_branch" = "master" ]; then
    git fetch
    git branch --set-upstream-to=origin/master master
fi