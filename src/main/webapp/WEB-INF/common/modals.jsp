<!-- Modal Join Trip-->
<div class="modal fade" id="joinTrip" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Join Trip To ${currentTrip.country}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"> <i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
       This trip will be added to your account
      </div>
      <div class="modal-footer">
        <a href="/trip/${currentTrip.id}/join" class="btn main-bg-color text-white">join</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Leave Trip-->
<div class="modal fade" id="leaveTrip" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Leave Trip To ${currentTrip.country}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"> <i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        Leaving this trip will remove it and all the activities related to it from your account!
      </div>
      <div class="modal-footer">
        <a href="/trip/${currentTrip.id}/unjoin" class="btn main-bg-color text-white" >leave</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
