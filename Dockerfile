FROM privetkakdela/devops_course:python_builder as builder
RUN mkdir /app
WORKDIR /app
RUN mkdir /tmp_new
COPY ./source ./
# RUN apt update
# RUN apt install upx-ucl -y
# RUN apt install patchelf -y
# RUN apt install python3-pip -y
# RUN pip3 install pyinstaller
# RUN pip3 install staticx
# RUN pip3 install flask
RUN pyinstaller -F app_py.py
RUN staticx ./dist/app_py app
RUN ls -lh

FROM scratch
COPY --from=builder /app/app /
COPY --from=builder /tmp_new /tmp
ENTRYPOINT ["/app"]

# FROM python:3-alpine as builder
# RUN mkdir /install
# WORKDIR /install
# RUN pip install --prefix="/install" flask


# FROM python:3-alpine
# WORKDIR /var/www/site
# COPY ./source ./
# COPY --from=builder /install /usr/local
# EXPOSE 80/tcp
# ENTRYPOINT ["python", "./test_site.py"]
