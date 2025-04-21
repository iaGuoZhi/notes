# rpm(1)

## Common usage

```sh
rpmdev-setuptree # create rpm build tree
rpmbuild -ba <spec>  # build package from spec file
rpmbuild -i <src>    # install source package
rpm --addsign package.rpm # add signature to package
rpm -qi <package>    # query package info
rpm -ql <package>    # query package files
```

## SPEC tricks

```
%define debug_package %{nil}
%global kmod_requires_skip
%global __requires_exclude ^kernel\\(i2c_bit_add_bus\\).* # Avoid false positive
```

