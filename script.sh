#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/Masood-J/manifest_evolution -b vic-qpr1 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/BaranAspect-Development/rom-build.git -b evo-x .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

rm -rf hardware/qcom-caf/msm8996 \
       hardware/qcom-caf/msm8998 \
       hardware/qcom-caf/sdm660 \
       hardware/qcom-caf/msm8953 \
       hardware/qcom-caf/sdm845 \
       hardware/qcom-caf/sm8150 \
       hardware/qcom-caf/sm8250 \
       hardware/qcom-caf/sm8350 \
       hardware/qcom-caf/sm8450 \
       hardware/qcom-caf/sm8550 
echo "==========================="
echo "Unnecessary dirs removed"
echo "==========================="

# Export
export BUILD_USERNAME=Masood
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
# initiate build setup
. build/envsetup.sh

echo "======= Export Done ======"
lunch lineage_topaz-ap4a-userdebug && m evolution
