# FROM python:3 as builder
# RUN mkdir /app
# WORKDIR /app
# RUN mkdir ./tmp
# COPY ./source ./
# RUN apt update
# RUN apt install upx-ucl -y
# RUN apt install patchelf -y
# #RUN apt install python3-pip -y
# RUN pip3 install pyinstaller
# RUN pip3 install staticx
# RUN pip3 install flask
# RUN pyinstaller -F test_site.py
# RUN staticx ./dist/test_site app
# RUN ls -l

# FROM scratch
# COPY ./source/ /
# COPY --from=builder /app/app /
# COPY --from=builder /tmp /tmp
# ENTRYPOINT ["/app"]

FROM python:3-alpine as builder
RUN mkdir /install
WORKDIR /install
RUN pip install --prefix="/install" flask


FROM python:3-alpine
WORKDIR /var/www/site
COPY ./source ./
COPY --from=builder /install /usr/local
EXPOSE 443/tcp
ENTRYPOINT ["python", "./test_site.py"]
