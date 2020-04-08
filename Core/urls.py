from rest_framework import routers
from Core.api import SponsorViewSet, SponsorGroupViewSet, CandidateCategoryViewSet, CandidateViewSet, DonationsViewSet

router = routers.DefaultRouter()
router.register('core/sponsors', SponsorViewSet, 'sponsors')
router.register('core/sponsorGroups', SponsorGroupViewSet, 'sponsorGroups')
router.register('core/candidates', CandidateViewSet, 'candidates')
router.register('core/candidateCategory', CandidateCategoryViewSet, 'candidateCategory')
router.register('core/donations', DonationsViewSet, 'donations')

urlpatterns = router.urls
