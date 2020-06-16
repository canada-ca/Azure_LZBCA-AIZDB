#!/bin/bash
# BIG-IPS ONBOARD SCRIPT
#
# get device id for do
deviceId=$1
# catch deviceId for debugging purposes
if [ "$deviceId" -eq 1 ] || [ "$deviceId" -eq 2 ]; then
    echo "Got deviceId $deviceId";
else
    echo "FATAL: Got unknown value for deviceId: $deviceId !";
    echo "DEBUG Input values: $@";
    echo "Bailing out!";
    exit -1;
fi
#APM Webtop embedded artifact
echo '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
QDnjApL/mYir8SsAXzH9H9OGSB0ApAAA' | base64 -d > /config/webtop_psp.tgz
# vars
admin_username='${api_user}'
admin_password='${api_pass}'
CREDS="$admin_username:$admin_password"
atc="f5-declarative-onboarding f5-appsvcs-extension f5-telemetry-streaming f5-cloud-failover-extension"
# constants
authUrl="/mgmt/shared/authn/login"
rpmInstallUrl="/mgmt/shared/iapp/package-management-tasks"
rpmFilePath="/var/config/rest/downloads"
# do
doUrl="/mgmt/shared/declarative-onboarding"
doCheckUrl="/mgmt/shared/declarative-onboarding/info"
doTaskUrl="/mgmt/shared/declarative-onboarding/task"
# as3
as3Url="/mgmt/shared/appsvcs/declare"
as3CheckUrl="/mgmt/shared/appsvcs/info"
as3TaskUrl="/mgmt/shared/appsvcs/task/"
# ts
tsUrl="/mgmt/shared/telemetry/declare"
tsCheckUrl="/mgmt/shared/telemetry/info" 
tsTaskUrl="/mgmt/shared/telemetry/declare"
# cloud failover ext
cfUrl="/mgmt/shared/cloud-failover/declare"
cfCheckUrl="/mgmt/shared/cloud-failover/info"
cfTaskUrl="/mgmt/shared/cloud-failover/declare"
# webssh 
webssh_src=https://github.com/steveh565/f5tools/raw/master/BIG-IP-ILX-WebSSH2-0.2.8.tgz
webssh_file=$(basename $webssh_src)
# declaration content
cat > /config/do1.json <<EOF
${DO1_Document}
EOF
cat > /config/do2.json <<EOF
${DO2_Document}
EOF
cat > /config/as3.json <<EOF
${AS3_Document}
EOF
cat > /config/ts.json <<EOF
${TS_Document}
EOF

LOG_FILE=${onboard_log}
if [ ! -e "$LOG_FILE" ]
then
     touch $LOG_FILE
     exec &>>$LOG_FILE
else
    #if file exists, exit as only want to run once
    exit
fi
exec 1>$LOG_FILE 2>&1

startTime=$(date +%s)
echo "timestamp start: $(date)"
function timer () {
    echo "Time Elapsed: $(( ${1} / 3600 ))h $(( (${1} / 60) % 60 ))m $(( ${1} % 60 ))s"
}

#check for MCPD subsystem to be ready
function checkMcpd () {
    CNT=0
    while [ $CNT -lt 120 ]; do echo "Checking MCPD state..."
        tmsh -a show sys mcp-state field-fmt | grep -q running
    if [ "$?" == 0 ]; then
        echo "Got phase running! MCPD Ready!"
        break
    fi
    echo "MCPD is NOT ready yet..."
    CNT=$[$CNT+1]
    sleep 10
    done 
}
checkMcpd
#
# Create REST API User
echo "Create REST API user"
cat <<-EOF | tmsh -q
create cli transaction;
create /auth user ${api_user} password ${api_pass} shell bash partition-access replace-all-with { all-partitions { role admin } };
submit cli transaction
EOF
# CHECK TO SEE NETWORK IS READY
function checkNetwork () {
    count=0
    while true
    do
    STATUS=$(curl -s -k -I https://github.com | grep HTTP)
    if [[ $STATUS == *"200"* ]]; then
        echo "internet access check passed"
        break
    elif [ "$count" -le 10 ]; then
        echo "Status code: $STATUS Not done yet..."
        count=$[$count+1]
    else
        echo "GIVE UP..."
        break
    fi
    sleep 10
    done
}
checkNetwork

# download latest atc tools
toolsList=$(cat -<<EOF
{
  "tools": [
      {
        "name": "f5-declarative-onboarding",
        "version": "${doVersion}",
        "url": "${doExternalDeclarationUrl}"
      },
      {
        "name": "f5-appsvcs-extension",
        "version": "${as3Version}",
        "url": "${as3ExternalDeclarationUrl}"
      },
      {
        "name": "f5-telemetry-streaming",
        "version": "${tsVersion}",
        "url": "${tsExternalDeclarationUrl}"
      },
      {
        "name": "f5-cloud-failover-extension",
        "version": "${cfVersion}",
        "url": "${cfExternalDeclarationUrl}"
      },
      {
        "name": "f5-appsvcs-templates",
        "version": "${fastVersion}",
        "url": "${fastExternalDeclarationUrl}"
      }
  ]
}
EOF
)
function getAtc () {
    atc=$(echo $toolsList | jq -r .tools[].name)
    for tool in $atc
    do
        version=$(echo $toolsList | jq -r ".tools[]| select(.name| contains (\"$tool\")).version")
        if [ "$version" == "latest" ]; then
            path=''
        else
            path='tags/v'
        fi
        echo "downloading $tool, $version"
        #if [ "$tool" == "f5-appsvcs-templates" ]; then
        #    files=$(/usr/bin/curl -sk --interface mgmt https://api.github.com/repos/f5devcentral/$tool/releases/$path$version | jq -r '.assets[] | select(.name | contains (".rpm")) | .browser_download_url')
        #else
            files=$(/usr/bin/curl -sk --interface mgmt https://api.github.com/repos/F5Networks/$tool/releases/$path$version | jq -r '.assets[] | select(.name | contains (".rpm")) | .browser_download_url')
        #fi
        for file in $files
        do
        echo "download: $file"
        name=$(basename $file )
        # make download dir
        mkdir -p /var/config/rest/downloads
        result=$(/usr/bin/curl -Lsk  $file -o /var/config/rest/downloads/$name)
        done
    done
}
getAtc
function getWebSSH () {
    echo "Fetching WebSSH ILX Plugin from: $webssh_src"
    result=$(/usr/bin/curl -Lsk  $webssh_src -o /var/tmp/$webssh_file)
}
if [ "$deviceId" -eq 1 ]; then 
    echo "Downloading WebSSH ILX Plugin"
    getWebSSH
else
    echo "Not Downloading WebSSH ILX Plugin: $deviceId is not the primary"
fi
# install atc tools
rpms=$(find $rpmFilePath -name "*.rpm" -type f)
for rpm in $rpms
do
  filename=$(basename $rpm)
  echo "installing $filename"
  if [ -f "$rpmFilePath/$filename" ]; then
     postBody="{\"operation\":\"INSTALL\",\"packageFilePath\":\"$rpmFilePath/$filename\"}"
     while true
     do
        iappApiStatus=$(curl -i -u $CREDS  http://localhost:8100$rpmInstallUrl | grep HTTP | awk '{print $2}')
        case $iappApiStatus in 
            404)
                echo "api not ready status: $iappApiStatus"
                sleep 2
                ;;
            200)
                echo "api ready starting install task $filename"
                install=$(restcurl -u $CREDS -X POST -d $postBody $rpmInstallUrl | jq -r .id )
                break
                ;;
              *)
                echo "other error status: $iappApiStatus"
                debug=$(restcurl -u $CREDS $rpmInstallUrl)
                echo "ipp install debug: $debug"
                ;;
        esac
    done
  else
    echo " file: $filename not found"
  fi 
  while true
  do
    status=$(restcurl -u $CREDS $rpmInstallUrl/$install | jq -r .status)
    case $status in 
        FINISHED)
            # finished
            echo " rpm: $filename task: $install status: $status"
            break
            ;;
        STARTED)
            # started
            echo " rpm: $filename task: $install status: $status"
            ;;
        RUNNING)
            # running
            echo " rpm: $filename task: $install status: $status"
            ;;
        FAILED)
            # failed
            error=$(restcurl -u $CREDS $rpmInstallUrl/$install | jq .errorMessage)
            echo "failed $filename task: $install error: $error"
            break
            ;;
        *)
            # other
            debug=$(restcurl -u $CREDS $rpmInstallUrl/$install | jq . )
            echo "failed $filename task: $install error: $debug"
            ;;
        esac
    sleep 2
    done
done
function getDoStatus() {
    task=$1
    doStatusType=$(restcurl -u $CREDS -X GET $doTaskUrl/$task | jq -r type )
    if [ "$doStatusType" == "object" ]; then
        doStatus=$(restcurl -u $CREDS -X GET $doTaskUrl/$task | jq -r .result.status)
        echo $doStatus
    elif [ "$doStatusType" == "array" ]; then
        doStatus=$(restcurl -u $CREDS -X GET $doTaskUrl/$task | jq -r .[].result.status)
        echo $doStatus
    else
        echo "unknown type:$doStatusType"
    fi
}
function checkDO() {
    # Check DO Ready
    count=0
    while [ $count -le 4 ]
    do
    doStatusType=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r type )
    if [ "$doStatusType" == "object" ]; then
        doStatus=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r .code)
        if [ $? == 1 ]; then
            doStatus=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r .result.code)
        fi
    elif [ "$doStatusType" == "array" ]; then
        doStatus=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r .[].result.code)
    else
        echo "unknown type:$doStatusType"
    fi
    echo "status $doStatus"
    if [[ $doStatus == "200" ]]; then
        #version=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r .version)
        version=$(restcurl -u $CREDS -X GET $doCheckUrl | jq -r .[].version)
        echo "Declarative Onboarding $version online "
        break
    elif [[ $doStatus == "404" ]]; then
        echo "DO Status: $doStatus"
        bigstart restart restnoded
        sleep 60
        bigstart status restnoded | grep running
        status=$?
        echo "restnoded:$status"
    else
        echo "DO Status $doStatus"
        count=$[$count+1]
    fi
    sleep 10
    done
}
function checkAS3() {
    # Check AS3 Ready
    count=0
    while [ $count -le 4 ]
    do
    as3Status=$(restcurl -u $CREDS -X GET $as3CheckUrl | jq -r .code)
    if  [ "$as3Status" == "null" ] || [ -z "$as3Status" ]; then
        type=$(restcurl -u $CREDS -X GET $as3CheckUrl | jq -r type )
        if [ "$type" == "object" ]; then
            as3Status="200"
        fi
    fi
    if [[ $as3Status == "200" ]]; then
        version=$(restcurl -u $CREDS -X GET $as3CheckUrl | jq -r .version)
        echo "As3 $version online "
        break
    elif [[ $as3Status == "404" ]]; then
        echo "AS3 Status $as3Status"
        bigstart restart restnoded
        sleep 60
        bigstart status restnoded | grep running
        status=$?
        echo "restnoded:$status"
    else
        echo "AS3 Status $as3Status"
        count=$[$count+1]
    fi
    sleep 10
    done
}
function checkTS() {
    # Check TS Ready
    count=0
    while [ $count -le 4 ]
    do
    tsStatus=$(curl -si -u $CREDS http://localhost:8100$tsCheckUrl | grep HTTP | awk '{print $2}')
    if [[ $tsStatus == "200" ]]; then
        version=$(restcurl -u $CREDS -X GET $tsCheckUrl | jq -r .version)
        echo "Telemetry Streaming $version online "
        break
    else
        echo "TS Status $tsStatus"
        count=$[$count+1]
    fi
    sleep 10
    done
}
function checkCF() {
    # Check CF Ready
    count=0
    while [ $count -le 4 ]
    do
    cfStatus=$(curl -si -u $CREDS http://localhost:8100$cfCheckUrl | grep HTTP | awk '{print $2}')
    if [[ $cfStatus == "200" ]]; then
        version=$(restcurl -u $CREDS -X GET $cfCheckUrl | jq -r .version)
        echo "Cloud failover $version online "
        break
    else
        echo "Cloud Failover Status $tsStatus"
        count=$[$count+1]
    fi
    sleep 10
    done
}
function runDO() {
    count=0
    while [ $count -le 4 ]
        do 
        # make task
        task=$(curl -s -u $CREDS -H "Content-Type: Application/json" -H 'Expect:' -X POST http://localhost:8100$doUrl -d @/config/$1 | jq -r .id)
        taskId=$(echo $task)
        echo "starting DO task: $taskId"
        sleep 1
        count=$[$count+1]
        # check task code
        while true
        do
            code=$(restcurl -u $CREDS /mgmt/shared/declarative-onboarding/task/$task | jq -r .code)
            sleep 1
            if  [ "$code" == "null" ] || [ -z "$code" ]; then
                status=$(restcurl -u $CREDS /mgmt/shared/declarative-onboarding/task/$task | jq -r .result.status)
                sleep 1
                # 200,202,422,400,404,500
                echo "DO: $task response:$code"
                sleep 1
                status=$(getDoStatus $taskId)
                sleep 1
                #FINISHED,STARTED,RUNNING,ROLLING_BACK,FAILED,ERROR,NULL
                case $status in 
                FINISHED)
                    # finished
                    echo " $taskId status: $status "
                    break 2
                    ;;
                STARTED)
                    # started
                    echo " $filename status: $status "
                    sleep 30
                    ;;
                RUNNING)
                    # running
                    echo "DO Status: $status task: $taskId Not done yet..."
                    sleep 30
                    ;;
                FAILED)
                    # failed
                    error=$(getDoStatus $taskId)
                    echo "failed $taskId, $error"
                    #count=$[$count+1]
                    break
                    ;;
                ERROR)
                    # error
                    error=$(getDoStatus $taskId)
                    echo "Error $taskId, $error"
                    #count=$[$count+1]
                    break
                    ;;
                ROLLING_BACK)
                    # Rolling back
                    echo "Rolling back failed status: $status task: $taskId"
                    break
                    ;;
                OK)
                    # complete no change
                    echo "Complete no change status: $status task: $taskId"
                    break 2
                    ;;
                *)
                    # other
                    echo "other: $status"
                    debug=$(restcurl -u $CREDS $doTaskUrl/$taskId | jq .)
                    echo "debug: $debug"
                    error=$(getDoStatus $taskId)
                    echo "Other $taskId, $error"
                    # count=$[$count+1]
                    sleep 30
                    ;;
                esac
            else
                echo "DO status code: $code"
                debug=$(restcurl -u $CREDS $doTaskUrl/$taskId | jq .)
                echo "debug do code: $debug"
                # count=$[$count+1]
            fi
        done
    done
}

# Set sys.db vars
echo "Set sys.db vars"
cat <<-EOF | tmsh -q
modify /sys db config.allow.rfc3927 value enable;
EOF

# Replace MGMT-DHCP with static config
echo "Disable DHCP for MGMT interface"
bigstart stop dhclient;
tmsh modify sys global-settings mgmt-dhcp disabled;

echo "Configure MGMT interface";
if [ "$deviceId" -eq 1 ]; then
cat <<-EOF | tmsh -q
delete /sys management-route default;
delete /sys management-route dhclient_route1;
delete /sys management-ip all;
create /sys management-ip ${mgmt_ip1}/27;
create /sys management-route default network default gateway ${mgmt_gw};
create /sys management-route azure_platform network 168.63.129.16 gateway ${mgmt_gw};
create /sys management-route azure_metadata network 169.254.169.254 gateway ${mgmt_gw};
modify /sys dns name-servers replace-all-with { ${mgmt_dns} } search replace-all-with { ${dns_domain} };
EOF
elif [ "$deviceId" -eq 2 ]; then
cat <<-EOF | tmsh -q
delete /sys management-route default;
delete /sys management-route dhclient_route1;
delete /sys management-ip all;
create /sys management-ip ${mgmt_ip2}/27;
create /sys management-route default network default gateway ${mgmt_gw};
create /sys management-route azure_platform network 168.63.129.16 gateway ${mgmt_gw};
create /sys management-route azure_metadata network 169.254.169.254 gateway ${mgmt_gw};
modify /sys dns name-servers replace-all-with { ${mgmt_dns} } search replace-all-with { ${dns_domain} };
EOF
else 
echo "Config MGMT Interface ERROR: Unknown DeviceId $deviceId";
fi

#make sure all settings persist
tmsh save /sys config

#verify network connectivity after mgmt interface reconfig
checkNetwork

# run DO
count=0
while [ $count -le 4 ]
    do
        doStatus=$(checkDO)
        echo "DO check status: $doStatus"
    if [ "$deviceId" -eq 1 ] && [[ "$doStatus" = *"online"* ]]; then 
        echo "running do for id:$deviceId"
        runDO do1.json
        if [ "$?" == 0 ]; then
            echo "done with do"
            results=$(restcurl -u $CREDS -X GET $doTaskUrl | jq '.[] | .id, .result')
            echo "do results: $results"
            break
        fi
    elif [ "$deviceId" -eq 2 ] && [[ "$doStatus" = *"online"* ]]; then 
        echo "running do for id:$deviceId"
          runDO do2.json
        if [ "$?" == 0 ]; then
            echo "done with do"
            results=$(restcurl -u $CREDS -X GET $doTaskUrl | jq '.[] | .id, .result')
            echo "do results: $results"
            break
        fi
    elif [ "$count" -le 2 ]; then
        echo "Status code: $doStatus  DO not ready yet..."
        count=$[$count+1]
        sleep 30
    else
        echo "DO not online status: $doStatus"
        break
    fi
done

#check MCPD after running DO
checkMcpd

function runTS () {
    # make task
    taskOut=$(curl -s -u $CREDS -H "Content-Type: Application/json" -H 'Expect:' -X POST http://localhost:8100$tsUrl -d @/config/ts.json)
    sleep 1
    # check task code
    taskResult=$(echo $taskOut |jq -r .message)
    echo "Task status: $taskResult"
}

#  run TS
count=0
while [ $count -le 4 ]
do
    tsStatus=$(checkTS)
    echo "TS check status: $tsStatus"
    if [[ $tsStatus == *"online"* ]]; then
        echo "running TS"
        runTS
        echo "done with TS"
        results=$(restcurl -u $CREDS $tsUrl | jq -r .message)
        echo "TS results: $results"
        break
    elif [ "$count" -le 2 ]; then
        echo "Status code: $tsStatus  TS not ready yet..."
        count=$[$count+1]
        sleep 3
    else
        echo "TS API Status $tsStatus"
        break
    fi
done
#
function installWebSSH () {
    echo "WebSSH ILX Plugin installation starting..."
    tmsh create ilx workspace WebSSH2
    cd /var/ilx/workspaces/Common/WebSSH2
    result=$(tar -zxvf /var/tmp/$webssh_file)
    tmsh create ilx plugin WebSSH2_plugin from-workspace WebSSH2
    echo "installation complete"
}
if [ "$deviceId" -eq 1 ]; then 
    echo "Installing WebSSH ILX Plugin"
    installWebSSH
else
    echo "Not installing WebSSH ILX Plugin: $deviceId is not primary"
fi
#
function runAS3 () {
    count=0
    while [ $count -le 1 ]
        do
            # make task
            task=$(curl -s -u $CREDS -H "Content-Type: Application/json" -H 'Expect:' -X POST http://localhost:8100$as3Url?async=true -d @/config/as3.json | jq -r .id)
            taskId=$(echo $task)
            echo "starting as3 task: $taskId"
            sleep 1
            count=$[$count+1]
            # check task code
        while true
        do
            status=$(restcurl -s -u $CREDS $as3TaskUrl/$taskId | jq ".items[] | select(.id | contains (\"$taskId\")) | .results")
            messages=$(echo "$status" | jq -r .[].message)
            tenants=$(echo "$status" | jq .[].tenant)
            case $messages in
            *Error*)
                # error
                echo -e "Error: $taskId status: $messages tenants: $tenants "
                break
                ;;
            *failed*)
                # failed
                echo -e "failed: $taskId status: $messages tenants: $tenants "
                break
                ;;
            *success*)
                # successful!
                echo -e "success: $taskId status: $messages tenants: $tenants "
                break 3
                ;;
            no*change)
                # finished
                echo -e "no change: $taskId status: $messages tenants: $tenants "
                break 3
                ;;
            in*progress)
                # in progress
                echo -e "Running: $taskId status: $messages tenants: $tenants "
                sleep 60
                ;;
            *)
            # other
            echo "status: $messages"
            debug=$(curl -s -u $CREDS http://localhost:8100/mgmt/shared/appsvcs/task/$taskId | jq .)
            echo "debug: $debug"
            error=$(curl -s -u $CREDS http://localhost:8100/mgmt/shared/appsvcs/task/$taskId | jq -r '.results[].message')
            echo "Other: $taskId, $error"
            ;;
            esac
        done
    done
}
#  run as3
count=0
while [ $count -le 4 ]
do
    as3Status=$(checkAS3)
    echo "AS3 check status: $as3Status"
    if [[ $as3Status == *"online"* ]]; then
        if [ "$deviceId" -eq 1 ]; then
            echo "running as3"
            runAS3
            echo "done with as3"
            results=$(restcurl -u $CREDS $as3TaskUrl | jq '.items[] | .id, .results')
            echo "as3 results: $results"
            break
        else
            echo "Not posting as3 device $deviceid not primary"
            break
        fi
    elif [ "$count" -le 2 ]; then
        echo "Status code: $as3Status  As3 not ready yet..."
        count=$[$count+1]
    else
        echo "As3 API Status $as3Status"
        break
    fi
done
#
function installWebTop () {
    tmsh create apm profile connectivity /SRA/webtop_cp
    tmsh create apm profile vdi /SRA/webtop_vdi
    tmsh create ltm profile rewrite /SRA/webtop_rwp defaults-from rewrite-portal location-specific false split-tunneling false request { insert-xforwarded-for enabled rewrite-headers enabled } response { rewrite-content enabled rewrite-headers enabled }
    #import pre-fabricated template
    ng_import -s /config/webtop_psp.tgz webtop_ap -p SRA
    if [ "$?" -eq 0 ]; then
        tmsh modify apm resource portal-access /SRA/webtop_ap-WebSSH_F5VM01 { application-uri "http://${webssh_vip}:10022/ssh/host/${f5vm01_mgmt_ip}?port=22&header=CLASSIFIED&headerBackground=red" }
        tmsh modify apm resource portal-access /SRA/webtop_ap-WebSSH_F5VM02 { application-uri "http://${webssh_vip}:10022/ssh/host/${f5vm02_mgmt_ip}?port=22&header=CLASSIFIED&headerBackground=red" }
        tmsh modify apm profile access /SRA/webtop_ap-rdp_gateway_ap generation-action increment
        tmsh modify apm profile access /SRA/webtop_ap generation-action increment
        tmsh modify ltm virtual /SRA/Webtop/serviceMain profiles add {/SRA/webtop_ap} profiles add {/SRA/webtop_vdi} profiles add {/SRA/webtop_cp} profiles add {/SRA/webtop_rwp}
        tmsh modify ltm virtual /SRA/Webtop/serviceMain cmp-enabled no
        ldbutil --add --uname="${api_user}" --password="${api_pass}" --instance="/SRA/webtop_ap-webtop_db" --user_groups="administrators" --login_failures="3" --change_passwd="false" --locked_out="false" --first_name="Azure" --last_name="Ops" --email="${api_user}@${dns_domain}"
    else
        echo "WARN: APM Policy import failed";
        whoout=$(whoami)
        idout=$(id)
        echo "DEBUG: user=$USER, shell=$SHELL, home=$HOME, whoout=$whoout, id=$idout"
    fi
}
if [ "$deviceId" -eq 1 ]; then 
    echo "Installing APM WebTop"
    installWebTop
else
    echo "Not installing APM WebTop: $deviceId is not primary"
fi
#
# cleanup
## remove declarations
# rm -f /config/do1.json
# rm -f /config/do2.json
# rm -f /config/as3.json
## disable/replace default admin account
# echo  -e "create cli transaction;
# modify /sys db systemauth.primaryadminuser value $admin_username;
# submit cli transaction" | tmsh -q
tmsh save sys config
echo "timestamp end: $(date)"
echo "Onboarding complete $(timer "$(($(date +%s) - $startTime))")"