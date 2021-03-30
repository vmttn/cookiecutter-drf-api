from django.urls import include, path

from meta.api.router import router
from meta.api import views

urlpatterns = [
    path("api/", include(router.urls)),
    path("api/version/", views.VersionEndpoint.as_view()),
]
