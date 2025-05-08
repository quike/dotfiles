function aws --description "Execute AWS CLI commands in a Docker container"
  # Check if the user has provided any arguments
  if test (count $argv) -eq 0
      echo "Usage: aws [--profile <profile>] <aws-cli-commands>"
      return 1
  end

  # Run the AWS CLI in a Docker container with the provided arguments
  set -l aws_cli_image "amazon/aws-cli"
  set -l aws_cli_container_name "aws-cli"

  # Check if the Docker image is available locally
  if not docker images | grep -q $aws_cli_image
      echo "Pulling AWS CLI Docker image..."
      docker pull $aws_cli_image
  end

  if test -z "$AWS_PROFILE"
    echo "No AWS profile specified. Using default profile."
    set AWS_PROFILE "default"
  end

  echo "Using AWS profile: $AWS_PROFILE"

  eval docker run --rm -it -v ~/.aws:/root/.aws \
    -v (pwd):(pwd) \
    -w (pwd) \
    -e AWS_PROFILE=$AWS_PROFILE \
    --entrypoint aws \
    $aws_cli_image \
    $argv
end
