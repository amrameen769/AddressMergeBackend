from django.db import models
from django.contrib.auth.models import User
from django_ckeditor_5.fields import CKEditor5Field

# Create your models here.

class SponsorGroup(models.Model):
    groupName = models.CharField(max_length=50)

    def __str__(self):
        return self.groupName


class Sponsors(models.Model):
    firstName = models.CharField(max_length=100)
    lastName = models.CharField(max_length=100)
    email = models.EmailField(max_length=100, unique=True)
    phoneNo = models.CharField(max_length=15)
    address = models.TextField(blank=True)
    country = models.CharField(max_length=100, blank=True)
    region = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)
    zip = models.CharField(max_length=10, blank=True)
    owner = models.ForeignKey(User, related_name="sponsorOwnerName", on_delete=models.CASCADE, null=True)
    createdAt = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=True)
    sponsorGroup = models.ForeignKey(SponsorGroup, related_name="sponsorGroupName", on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.firstName + " " + self.lastName


class CandidateCategory(models.Model):
    categoryName = models.CharField(max_length=50)

    def __str__(self):
        return self.categoryName


class Candidates(models.Model):
    firstName = models.CharField(max_length=100, null=True)
    lastName = models.CharField(max_length=100, null=True)
    candidateCategory = models.ForeignKey(CandidateCategory, related_name="candidateCategoryName",
                                          on_delete=models.CASCADE, null=True)
    email = models.EmailField(max_length=100, unique=True)
    phoneNo = models.CharField(max_length=15)
    address = models.TextField(blank=True)
    country = models.CharField(max_length=100, blank=True)
    region = models.CharField(max_length=100, blank=True)
    city = models.CharField(max_length=100, blank=True)
    zip = models.CharField(max_length=10, blank=True)
    sponsor = models.ForeignKey(Sponsors, related_name="sponsorName", on_delete=models.CASCADE, null=True)
    createdAt = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=True)
    owner = models.ForeignKey(User, related_name="candidateOwnerName", on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.firstName + " " + self.lastName


class Donations(models.Model):
    donationName = models.CharField(max_length=50)
    donationDescription = models.TextField(blank=True)
    donationDate = models.DateTimeField()
    donationAmount = models.FloatField(blank=True)
    donationTo = models.ForeignKey(Candidates, related_name="donCandidateName", on_delete=models.CASCADE, null=True)
    donationBy = models.ForeignKey(Sponsors, related_name="donSponsorName", on_delete=models.CASCADE, null=True)
    owner = models.ForeignKey(User, related_name="donationOwnerName", on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.donationName


class DocumentTypes(models.Model):
    typeName = models.CharField(max_length=20)

    def __str__(self):
        return self.typeName


class Documents(models.Model):
    docName = models.CharField(max_length=100)
    docType = models.ForeignKey(DocumentTypes, related_name="documentType", on_delete=models.CASCADE, null=True)
    docContent = CKEditor5Field('Text', config_name='extends')
    lastEdited = models.DateTimeField(auto_now_add=True)
    isTemplate = models.BooleanField(default=False)
    owner = models.ForeignKey(User, related_name="documents", on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.docName
