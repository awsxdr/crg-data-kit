(function () {
  const view = _windowFunctions.checkParam('preview', 'true') ? 'Preview' : 'View';
  $('body').attr('sbPrefix', '&: ScoreBoard.Settings.Setting(ScoreBoard.' + view + ' : )');

  WS.Register(
    ['ScoreBoard.Settings.Setting(ScoreBoard.' + view + '_BoxStyle)', 'ScoreBoard.Settings.Setting(ScoreBoard.' + view + '_SidePadding)'],
    {
      triggerBatchFunc: function () {
        $(window).trigger('resize');
      },
    }
  );

  WS.Register(
    [
      'ScoreBoard.CurrentGame.Clock(Timeout).Running',
      'ScoreBoard.CurrentGame.TimeoutOwner',
      'ScoreBoard.CurrentGame.OfficialReview',
      'ScoreBoard.CurrentGame.Team(*).Timeouts',
    ],
    sbSetActiveTimeout
  );

  // Show Clocks
  WS.Register(['ScoreBoard.CurrentGame.Clock(*).Running', 'ScoreBoard.CurrentGame.InJam'], sbClockSelect);
})();


