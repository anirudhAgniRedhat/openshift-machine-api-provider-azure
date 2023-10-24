#!/bin/bash

# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT=$(dirname "${BASH_SOURCE}")/..

# Ensure that some home var is set and that it's not the root.
# This is required for the kubebuilder cache.
export HOME=${HOME:=/tmp/kubebuilder-testing}
if [ $HOME == "/" ]; then
  export HOME=/tmp/kubebuilder-testing
fi

cd $REPO_ROOT && \
	source ./hack/fetch-ext-bins.sh && \
	fetch_tools && \
	setup_envs && \
	make unit
