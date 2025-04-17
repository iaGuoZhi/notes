# rpm(1)

## Common usage

```sh
rpm -qi <package>    # query package info
rpmbuild -ba <spec>  # build package from spec file
rpmbuild -i <src>    # install source package
```

## Advanced notes

```
%define debug_package %{nil}
%global kmod_requires_skip
%global __requires_exclude ^kernel\\(i2c_bit_add_bus\\).*
```

