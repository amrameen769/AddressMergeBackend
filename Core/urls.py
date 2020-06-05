from rest_framework import routers
from Core.api import SponsorViewSet, SponsorGroupViewSet, CandidateCategoryViewSet, CandidateViewSet, DonationsViewSet, DocumentsViewSet

router = routers.DefaultRouter()
router.register('core/sponsors', SponsorViewSet, 'sponsors')
router.register('core/sponsorGroups', SponsorGroupViewSet, 'sponsorGroups')
router.register('core/candidates', CandidateViewSet, 'candidates')
router.register('core/candidateCategory', CandidateCategoryViewSet, 'candidateCategory')
router.register('core/donations', DonationsViewSet, 'donations')
router.register('core/documents', DocumentsViewSet, 'documents')

urlpatterns = router.urls
