FROM privetkakdela/devops_course:python_builder as builder
RUN mkdir /app
WORKDIR /app
RUN mkdir /tmp_new
COPY ./source ./
RUN pyinstaller -F app_py.py
RUN staticx ./dist/app_py app
RUN ls -lh

FROM scratch
COPY --from=builder /app/app /
COPY --from=builder /tmp_new /tmp
ENTRYPOINT ["/app"]