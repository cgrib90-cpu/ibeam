# Thin overlay: official (working) IBeam image + PR#277 manual-2FA Python patch.
FROM voyz/ibeam:latest
USER root
COPY ibeam /srv/ibeam
COPY requirements.txt /srv/requirements.txt
RUN /opt/venv/bin/pip install --no-cache-dir -r /srv/requirements.txt && \
    chown -R basic_user:basic_group /srv/ibeam
USER basic_user
WORKDIR /srv/ibeam
CMD ["python", "ibeam_starter.py"]