#
# Cookbook Name:: users
# Attributes:: users
#
# Copyright 2010, Map of Medicine
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
#

# A users hash will generally look something like:
# set_unless[:users] = {"username" => {"uid" => "999999", "home" => "/path/to/home", "pwd_hash" => "hash", "is_admin" => "true" }}
#

set_unless[:users] = ""