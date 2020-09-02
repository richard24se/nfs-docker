echo "shared folders -> $1"
echo "allowed ips -> $2"
folders=$1
ips=$2
for mnt in ${folders[@]}
do
    echo $mnt
    #mkdir -p $mnt
    #chmod 777 $mnt
    multi_ip=""
    for ip in ${ips[@]}
    do
        multi_ip="${multi_ip} ${ip}(rw,insecure,sync,no_root_squash)"
    done
    echo $multi_ip
    echo "$mnt $multi_ip" >> /etc/exports  
done
more /etc/exports
