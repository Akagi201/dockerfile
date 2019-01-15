FROM akagi201/eosbuilder
ARG branch=master
ARG symbol=SYS

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y zsh openssl ca-certificates vim psmisc python3-pip openssh-server \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install numpy

RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN chsh -s `which zsh`

RUN git clone -b $branch https://github.com/EOSIO/eos.git --recursive \
    && cd eos && echo "$branch:$(git rev-parse HEAD)" > /etc/eosio-version \
    && cmake -H. -B"/opt/eosio" -GNinja -DCMAKE_BUILD_TYPE=Release -DWASM_ROOT=/opt/wasm -DCMAKE_CXX_COMPILER=clang++ \
       -DCMAKE_C_COMPILER=clang -DCMAKE_INSTALL_PREFIX=/opt/eosio -DBUILD_MONGO_DB_PLUGIN=true -DCORE_SYMBOL_NAME=$symbol \
    && cmake --build /opt/eosio --target install \
    && cp /eos/Docker/config.ini / && ln -s /opt/eosio/contracts /contracts && cp /eos/Docker/nodeosd.sh /opt/eosio/bin/nodeosd.sh && ln -s /eos/tutorials /tutorials


ENV EOSIO_ROOT=/opt/eosio
RUN chmod +x /opt/eosio/bin/nodeosd.sh
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH /opt/eosio/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

EXPOSE 22
CMD /etc/init.d/ssh start