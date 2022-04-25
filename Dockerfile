FROM quay.io/pypa/manylinux2014_x86_64
WORKDIR /py
# RUN yum -y install gcc libffi-devel  # not needed if nothing needs to be built
COPY mysql_type/ mysql_type/
COPY pyproject.toml LICENSE setup.py README.md ./
RUN \
	/opt/python/cp36-cp36m/bin/python setup.py bdist_wheel --verbose && \
	find dist -name '*-linux_*.whl' -exec bash -c 'auditwheel repair "$1" -w dist/ && rm "$1"' -- {} \;
