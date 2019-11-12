FROM python:3.8-slim

ENV APP_DIR=/app
WORKDIR ${APP_DIR}
# We don't want to run as root
RUN groupadd -r app && useradd -r -g app app

# Create any directories we may need
RUN mkdir -p /output ${APP_DIR}

# Install lib for pdf
RUN apt-get update && apt-get install -y libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info libglib2.0-dev libcairo2 && apt-get clean -y

# Copy files into container
COPY requirements.txt ${APP_DIR}/
RUN pip install -r requirements.txt

COPY . ${APP_DIR}

# Start
RUN chmod +x ${APP_DIR}/docker/entrypoint.sh && chown -R app:app ${APP_DIR}

# Drop permissions to app user and start
USER app
ENTRYPOINT [ "./docker/entrypoint.sh" ]
CMD [ "html" ]