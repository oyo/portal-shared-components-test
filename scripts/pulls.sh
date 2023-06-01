#!/bin/bash

###############################################################
# Copyright (c) 2021, 2023 Contributors to the Eclipse Foundation
#
# See the NOTICE file(s) distributed with this work for additional
# information regarding copyright ownership.
#
# This program and the accompanying materials are made available under the
# terms of the Apache License, Version 2.0 which is available at
# https://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# SPDX-License-Identifier: Apache-2.0
###############################################################

#
# Bash utils for GitHub API
#
# prerequisites:
#   - curl installed
#   - GITHUB_TOKEN enviroment variable set to token with repo scope
#

export REPO_OWNER=oyo
export REPO_NAME=portal-shared-components-test

list-pulls() {
    curl -L \
        -X GET \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $GITHUB_TOKEN"\
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls
}

create-pull() {
    CC=$1
    DESC=$2
    WHY=$3
    ISSUE=$4
    curl -L \
        -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $GITHUB_TOKEN"\
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/pulls \
        -d '{"title":"'$CC'","body":"'
$(cat << EOM
Description
$DESC

Why
$WHY

Issue
$ISSUE

Checklist
[x] I have followed the contributing guidelines
[x] I have performed a self-review of my own code
[x] I have successfully tested my changes locally
EOM
)
            '","head":"'$REPO_OWNER':'$CC'","base":"main"}'
}

commit-push-raise() {
    CC=$1
    yarn version --patch
    git checkout -b $CC
    git add -A
    git commit -m $CC
    git push origin $CC
    create-pull $CC
}
