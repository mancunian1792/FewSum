#!/bin/bash
wget https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/unsupervised.tar
wget https://abrazinskas.s3-eu-west-1.amazonaws.com/downloads/projects/fewsum/artifacts/amazon/checkpoints/joint_tuning.tar
mkdir artifacts/amazon/checkpoints
mv unsupervised.tar artifacts/amazon/checkpoints/
mv joint_tuning.tar artifacts/amazon/checkpoints/
mkdir artifacts/amazon/reviews
mkdir artifacts/amazon/reviews/train
mkdir artifacts/amazon/reviews/val
