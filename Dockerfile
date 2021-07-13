FROM python:3.9.5-alpine as builder
RUN mkdir /install
WORKDIR /install
RUN pip install --prefix="/install" flask


FROM python:3.9.5-alpine
WORKDIR /var/www/site
COPY ./source ./
COPY --from=builder /install /usr/local
EXPOSE 8080/tcp
ENTRYPOINT ["python", "./test_site.py"]
