from rest_framework import serializers
from Core.models import Sponsors, SponsorGroup, Candidates, CandidateCategory, Donations


# Sponsor Serializer
class SponsorSerializer(serializers.ModelSerializer):
    sponsorGroupName = serializers.StringRelatedField(source='sponsorGroup', many=False)
    sponsorOwnerName = serializers.StringRelatedField(source='owner', many=False)

    class Meta:
        model = Sponsors
        fields = '__all__'


# SponsorGroupSerializer
class SponsorGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = SponsorGroup
        fields = '__all__'


# CandidateSerializer
class CandidateSerializer(serializers.ModelSerializer):
    candidateCategoryName = serializers.StringRelatedField(source='candidateCategory', many=False)
    candidateOwnerName = serializers.StringRelatedField(source='owner', many=False)
    sponsorName = serializers.StringRelatedField(source='sponsor', many=False)

    class Meta:
        model = Candidates
        fields = '__all__'


# CandidateCategorySerializer
class CandidateCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CandidateCategory
        fields = '__all__'


# DonationsSerializer
class DonationsSerializer(serializers.ModelSerializer):
    donCandidateName = serializers.StringRelatedField(source='donationTo', many=False)
    donSponsorName = serializers.StringRelatedField(source='donationBy', many=False)
    donationOwnerName = serializers.StringRelatedField(source='owner', many=False)

    class Meta:
        model = Donations
        fields = '__all__'
