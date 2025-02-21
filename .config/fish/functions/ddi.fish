function ddi --description "Remove docker images by name"
    if test (count $argv) -eq 0
        __ddi_usage
        return 1
    end
    set param $argv[1]
    docker rmi (docker images --format "{{.Repository}}:{{.Tag}}" | grep "^$param")
end

function __ddi_usage
    echo "Usage: ddi <param>"
end
