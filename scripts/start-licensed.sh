#!/bin/bash
if [ -z "$CONNECT_LICENSE" ]; then
    echo >&2 'error: The CONNECT_LICENSE variable is not set.'
    exit 1
fi


activate() {
    echo "Activating license ..."
    sudo /opt/rstudio-connect/bin/license-manager activate $CONNECT_LICENSE # output is informative.
    if [ $? -ne 0 ]
    then
        echo >&2 'error: CONNECT_LICENSE could not be activated.'
        exit 1
    fi     
}

deactivate() {
    echo "Deactivating license ..."
    sudo /opt/rstudio-connect/bin/license-manager deactivate >/dev/null 2>&1
}

activate

# trap process exits and deactivate our license.
trap deactivate EXIT

echo "Starting connect ..."
"$@"
STATUS="$?"
exit $STATUS
