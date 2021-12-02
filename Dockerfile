FROM ubuntu:20.04

# Install dependencies
RUN apt update &&  apt install -y \
    bzip2 \
    curl \
    samtools \
    tabix \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

COPY files/vimrc .vimrc

################################################################################
# Install CGAtools
RUN curl -L -O http://downloads.sourceforge.net/project/cgatools/1.8.0/cgatools-1.8.0.1-linux_binary-x86_64.tar.gz
RUN tar -xzf cgatools-1.8.0.1-linux_binary-x86_64.tar.gz
RUN cp cgatools-1.8.0.1-linux_binary-x86_64/bin/cgatools /usr/local/bin/cgatools
RUN rm -fr /root/cgatools-1.8.0.1-linux_binary-x86_64*

################################################################################
# Preparing build37.crr
#
# -  Complete Genomics "build37" consists of the assembled nuclear chromosomes from
# -  GRCh37 (not unplaced or alternate loci), plus the Cambridge Reference Sequence
# -  for the mitochondrion (NC_012920.1). This assembly (though with an alternate
# -  mitochondrial sequence) is also known as UCSC hg19. Customers who build the CRR
# -  files as described below must use the correct mitochondrial sequence. CRR files
# -  generated using the UCSC hg19 FASTA files are incompatible with CGA Tools
# -  because they contain a different mitochondrial sequence.
#
# ** Reference: http://cgatools.sourceforge.net/docs/1.8.0/cgatools-user-guide.pdf (pages 16-18)

## Step 1
# Download UCSC hg19 and recompress (on-the-fly) as a SAMtools-compatible bgzip file
RUN wget -qO- \
    http://hgdownload.cse.ucsc.edu/goldenpath/hg19/bigZips/initial/hg19.fa.gz \
	| zcat - \
	| bgzip -i -I hg19.fa.gz.gzi -c \
	> hg19.fa.gz

## Step 2
# Copy chrM from NC_0123920.1 to container
COPY files/chrM.fa .

## Step 3
# (see comments in create-build37.sh)
COPY files/create-build37.sh .
RUN ./create-build37.sh

## Cleanup
RUN rm hg19* chrM.fa create-build37.sh
