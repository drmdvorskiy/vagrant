#!/bin/bash

for VM in $(VBoxManage list vms | awk '{print $2}' | grep -Po '[^{}]+'); do 
    if [[ -z "`VBoxManage snapshot $VM list | grep 'UUID'`" ]]
    then
        VBoxManage snapshot $VM take PreparedOs --description="Prepared Os"
    else
        VBoxManage controlvm $VM poweroff
        VBoxManage snapshot $VM restore PreparedOs
        VBoxManage startvm $VM --type headless
    fi

done