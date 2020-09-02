FROM centos:7
ENV container docker
RUN yum install nfs-utils -y
RUN yum install initscripts -y
RUN yum clean all
RUN systemctl enable rpcbind
RUN systemctl enable nfs-server
RUN systemctl enable nfs-lock
RUN systemctl enable nfs-idmap
COPY mount.sh /
ARG shared_folder
ARG shared_ip
RUN echo $shared_folder
RUN sed -i 's/\r//' mount.sh
RUN chmod +x mount.sh && ./mount.sh "${shared_folder}" "${shared_ip}"
EXPOSE 111/udp 111/tcp 2049/tcp 20048/udp 20048/tcp