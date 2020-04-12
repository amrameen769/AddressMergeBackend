from rest_framework import viewsets, permissions

from .models import Sponsors, SponsorGroup, Candidates, CandidateCategory, Donations
from .serializers import SponsorSerializer, SponsorGroupSerializer, CandidateSerializer, CandidateCategorySerializer, \
    DonationsSerializer


# Sponsor ViewSet
class SponsorViewSet(viewsets.ModelViewSet):
    queryset = Sponsors.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]

    serializer_class = SponsorSerializer

    # def get_queryset(self):
    #     return self.request.user.sponsors.all()

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


# SponsorGroupViewSet
class SponsorGroupViewSet(viewsets.ModelViewSet):
    queryset = SponsorGroup.objects.all()

    serializer_class = SponsorGroupSerializer


# CandidateViewSet
class CandidateViewSet(viewsets.ModelViewSet):
    queryset = Candidates.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]

    serializer_class = CandidateSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


# CandidateCategoryViewSet
class CandidateCategoryViewSet(viewsets.ModelViewSet):
    queryset = CandidateCategory.objects.all()

    serializer_class = CandidateCategorySerializer


# DonationsViewSet
class DonationsViewSet(viewsets.ModelViewSet):
    queryset = Donations.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]

    serializer_class = DonationsSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
