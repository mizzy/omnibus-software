#
# Copyright 2014 Chef Software, Inc.
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

name "perl-extutils-makemaker"
default_version "6.78"

dependency "perl"

source url: "http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/ExtUtils-MakeMaker-#{version}.tar.gz",
       md5: "843886bc1060b5e5c619e34029343eba"

relative_path "ExtUtils-MakeMaker-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge(
    "INSTALL_BASE" => "#{install_dir}/embedded",
  )

  command "#{install_dir}/embedded/bin/perl Makefile.PL", env: env

  make env: env
  make "install", env: env
end
