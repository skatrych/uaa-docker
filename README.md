Dockerized UAA service, version 3.4.0
===========
Docker project for Dockerizing UAA application from CF. Please visit http://docs.cloudfoundry.org/api/uaa/#overview for UAA docs.

How to:
------
######1. Build docker image
$ docker build -t uaa-docker:latest .

######2. Start uaa container and detach from your shell
$ docker run -d -p 8080:8080 uaa-docker

###Testing APIs from shell:

######1. Get token

$ curl -u app:appclientsecret http://192.168.99.100:8080/oauth/token -d "grant_type=password&username=portal&password=portalpass123"

{
    "access_token": "eyJhbGciOiJIUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI0ZGFmMWNmYjg2YjM0ZDBlYmMzOTdjYWY0ZTA3YzZjMCIsInN1YiI6IjFiNzU0YzU0LWRiMzctNDRiMy05ZjUyLWZlZjBjM2I5NDg0MiIsInNjb3BlIjpbInNjaW0udXNlcmlkcyIsIm9wZW5pZCIsImNsb3VkX2NvbnRyb2xsZXIucmVhZCIsInBhc3N3b3JkLndyaXRlIiwiY2xvdWRfY29udHJvbGxlci53cml0ZSJdLCJjbGllbnRfaWQiOiJhcHAiLCJjaWQiOiJhcHAiLCJhenAiOiJhcHAiLCJncmFudF90eXBlIjoicGFzc3dvcmQiLCJ1c2VyX2lkIjoiMWI3NTRjNTQtZGIzNy00NGIzLTlmNTItZmVmMGMzYjk0ODQyIiwib3JpZ2luIjoidWFhIiwidXNlcl9uYW1lIjoicG9ydGFsIiwiZW1haWwiOiJwb3J0YWwiLCJhdXRoX3RpbWUiOjE0NjY2ODYwMzcsInJldl9zaWciOiJkNmI3MWU1MCIsImlhdCI6MTQ2NjY4NjAzOCwiZXhwIjoxNDY2Njg5NjM4LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODAvdWFhL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiYXVkIjpbImFwcCIsInNjaW0iLCJvcGVuaWQiLCJjbG91ZF9jb250cm9sbGVyIiwicGFzc3dvcmQiXX0.pYZ_ym0z-Y44B4OyI6bI2VcSY5y1woak6JgqgzlPstE",
    "token_type": "bearer",
    "refresh_token": "eyJhbGciOiJIUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI0ZGFmMWNmYjg2YjM0ZDBlYmMzOTdjYWY0ZTA3YzZjMC1yIiwic3ViIjoiMWI3NTRjNTQtZGIzNy00NGIzLTlmNTItZmVmMGMzYjk0ODQyIiwic2NvcGUiOlsic2NpbS51c2VyaWRzIiwib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlci5yZWFkIiwicGFzc3dvcmQud3JpdGUiLCJjbG91ZF9jb250cm9sbGVyLndyaXRlIl0sImlhdCI6MTQ2NjY4NjAzOCwiZXhwIjoxNDY2Njg5NjM4LCJjaWQiOiJhcHAiLCJjbGllbnRfaWQiOiJhcHAiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODAvdWFhL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiZ3JhbnRfdHlwZSI6InBhc3N3b3JkIiwidXNlcl9uYW1lIjoicG9ydGFsIiwib3JpZ2luIjoidWFhIiwidXNlcl9pZCI6IjFiNzU0YzU0LWRiMzctNDRiMy05ZjUyLWZlZjBjM2I5NDg0MiIsInJldl9zaWciOiJkNmI3MWU1MCIsImF1ZCI6WyJhcHAiLCJzY2ltIiwib3BlbmlkIiwiY2xvdWRfY29udHJvbGxlciIsInBhc3N3b3JkIl19.XHqNRlMWLEKTYFxVKL8HbMjqrK3sqN1Cn_Zhrb5KiO4",
    "expires_in": 3599,
    "scope": "scim.userids openid cloud_controller.read password.write cloud_controller.write",
    "jti": "4daf1cfb86b34d0ebc397caf4e07c6c0"
}
######2. Check token and decode it

$ curl -u app:appclientsecret 'http://192.168.99.100:8080/check_token' -i -X POST -d 'token=YOUR_TOKEN_GOES_HERE'

{
    "user_id": "1b754c54-db37-44b3-9f52-fef0c3b94842",
    "user_name": "portal",
    "email": "portal",
    "client_id": "app",
    "exp": 1466689638,
    "scope": ["scim.userids", "openid", "cloud_controller.read", "password.write", "cloud_controller.write"],
    "jti": "4daf1cfb86b34d0ebc397caf4e07c6c0",
    "aud": ["app", "scim", "openid", "cloud_controller", "password"],
    "sub": "1b754c54-db37-44b3-9f52-fef0c3b94842",
    "iss": "http://localhost:8080/oauth/token",
    "iat": 1466686038,
    "cid": "app",
    "grant_type": "password",
    "azp": "app",
    "auth_time": 1466686037,
    "zid": "uaa",
    "rev_sig": "d6b71e50",
    "origin": "uaa",
    "revocable": false
}

######3. Other API examples to be added
